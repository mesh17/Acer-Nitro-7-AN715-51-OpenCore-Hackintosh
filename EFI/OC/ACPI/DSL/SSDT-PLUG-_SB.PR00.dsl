/*
 * XCPM power management compatibility table.
 */
DefinitionBlock ("", "SSDT", 2, "CpuRef", "CpuPlug", 0x00003000)
{
    External (_SB_.PR00, ProcessorObj)   // Rename this

    Scope (_SB.PR00)  // Rename this
    {
        Method (DTGP, 5, NotSerialized)
        {
            If (LEqual (Arg0, ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
            {
                If (LEqual (Arg1, One))
                {
                    If (LEqual (Arg2, Zero))
                    {
                        Store (Buffer (One)
                            {
                                 0x03                                           
                            }, Arg4)
                        Return (One)
                    }

                    If (LEqual (Arg2, One))
                    {
                        Return (One)
                    }
                }
            }

            Store (Buffer (One)
                {
                     0x00                                           
                }, Arg4)
            Return (Zero)
        }

        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            Store (Package (0x02)
                {
                    "plugin-type", 
                    One
                }, Local0)
            DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
            Return (Local0)
        }
    }
}

