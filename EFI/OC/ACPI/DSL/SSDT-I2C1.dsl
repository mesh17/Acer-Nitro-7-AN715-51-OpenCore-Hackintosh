// Add FMCN & SSCN for TPAD.
DefinitionBlock ("", "SSDT", 2, "hack", "I2C-SPED", 0x00000000)
{
    External (_SB_.PCI0.I2C1, DeviceObj)    // (from opcode)
    External (FMD1, IntObj)    // (from opcode)
    External (FMH1, IntObj)    // (from opcode)
    External (FML1, IntObj)    // (from opcode)
    External (SSD1, IntObj)    // (from opcode)
    External (SSH1, IntObj)    // (from opcode)
    External (SSL1, IntObj)    // (from opcode)

    Scope (_SB.PCI0.I2C1)
    {
        Method (PKGX, 3, Serialized)
        {
            Name (PKG, Package (0x03)
            {
                Zero, 
                Zero, 
                Zero
            })
            Store (Arg0, Index (PKG, Zero))
            Store (Arg1, Index (PKG, One))
            Store (Arg2, Index (PKG, 0x02))
            Return (PKG)
        }

        Method (SSCN, 0, NotSerialized)
        {
            Return (PKGX (SSH1, SSL1, SSD1))
        }

        Method (FMCN, 0, NotSerialized)
        {
            Name (PKG, Package (0x03)
            {
                0x0101, 
                0x012C, 
                0x62
            })
            Return (PKG)
        }
    }
}

