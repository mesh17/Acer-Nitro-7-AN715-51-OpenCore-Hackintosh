// Overriding _PTS and _WAK
// In config ACPI, _PTS to ZPTS(1,N)
// Find:     5F50545301
// Replace:  5A50545301
// or 
// In config ACPI, _PTS to ZPTS(1,S)
// Find:     5F50545309
// Replace:  5A50545309
//
// In config ACPI, _WAK to ZWAK(1,N)
// Find:     5F57414B01
// Replace:  5A57414B01
// or
// In config ACPI, _WAK to ZWAK(1,S)
// Find:     5F57414B09
// Replace:  5A57414B09
//
DefinitionBlock ("", "SSDT", 2, "hack", "NDGP", 0x00000000)
{
    External (_SB_.PCI0.PEG0.PEGP._OFF, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.PEG0.PEGP._ON_, MethodObj)    // 0 Arguments (from opcode)
    External (ZPTS, MethodObj)    // 1 Arguments (from opcode)
    External (ZWAK, MethodObj)    // 1 Arguments (from opcode)

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        If (_OSI ("Darwin"))
        {
            \DGPU._ON ()
        }

        \ZPTS (Arg0)
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        If (_OSI ("Darwin"))
        {
            \DGPU._OFF ()
        }

        Store (ZWAK (Arg0), Local0)
        Return (Local0)
    }

    Device (DGPU)
    {
        Name (_HID, "DGPU1000")  // _HID: Hardware ID
        Name (RMEN, One)
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            _OFF ()
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (_ON, 0, NotSerialized)  // _ON_: Power On
        {
            If (CondRefOf (\_SB.PCI0.PEG0.PEGP._ON))
            {
                \_SB.PCI0.PEG0.PEGP._ON ()
            }
        }

        Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
        {
            If (CondRefOf (\_SB.PCI0.PEG0.PEGP._OFF))
            {
                \_SB.PCI0.PEG0.PEGP._OFF ()
            }
        }
    }
}

