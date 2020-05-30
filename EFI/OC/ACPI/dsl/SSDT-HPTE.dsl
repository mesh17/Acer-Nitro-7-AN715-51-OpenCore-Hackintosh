//Disable HPTE
DefinitionBlock ("", "SSDT", 2, "ACDT", "HPTE", 0x00000000)
{
    External (HPTE, FieldUnitObj)    // (from opcode)

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            Store (Zero, HPTE)
        }
    }
}

