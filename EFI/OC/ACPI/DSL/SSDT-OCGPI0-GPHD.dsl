// Enable GPI0
DefinitionBlock ("", "SSDT", 2, "ACDT", "GPI0", 0x00000000)
{
    External (GPHD, FieldUnitObj)    // (from opcode)

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            Store (Zero, GPHD)
        }
    }
}

