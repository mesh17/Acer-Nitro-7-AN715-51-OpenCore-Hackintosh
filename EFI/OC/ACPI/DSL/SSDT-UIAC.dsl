DefinitionBlock ("", "SSDT", 2, "ACDT", "_UIAC", 0x00000000)
{
    Device (UIAC)
    {
        Name (_HID, "UIA00000")  // _HID: Hardware ID
        Name (RMCF, Package (0x02)
        {
            "XHC", 
            Package (0x04)
            {
                "port-count", 
                Buffer (0x04)
                {
                     0x13, 0x00, 0x00, 0x00                         
                }, 

                "ports", 
                Package (0x12)
                {
                    "HS01", 
                    Package (0x06)
                    {
                        "name", 
                        Buffer (0x05)
                        {
                            "HS01"
                        }, 

                        "UsbConnector", 
                        0x03, 
                        "port", 
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00                         
                        }
                    }, 

                    "HS02", 
                    Package (0x06)
                    {
                        "name", 
                        Buffer (0x05)
                        {
                            "HS02"
                        }, 

                        "UsbConnector", 
                        0x0A, 
                        "port", 
                        Buffer (0x04)
                        {
                             0x02, 0x00, 0x00, 0x00                         
                        }
                    }, 

                    "HS03", 
                    Package (0x06)
                    {
                        "name", 
                        Buffer (0x05)
                        {
                            "HS03"
                        }, 

                        "UsbConnector", 
                        0x03, 
                        "port", 
                        Buffer (0x04)
                        {
                             0x03, 0x00, 0x00, 0x00                         
                        }
                    }, 

                    "HS04", 
                    Package (0x06)
                    {
                        "name", 
                        Buffer (0x05)
                        {
                            "HS04"
                        }, 

                        "UsbConnector", 
                        Zero, 
                        "port", 
                        Buffer (0x04)
                        {
                             0x04, 0x00, 0x00, 0x00                         
                        }
                    }, 

                    "HS05", 
                    Package (0x06)
                    {
                        "name", 
                        Buffer (0x05)
                        {
                            "HS05"
                        }, 

                        "UsbConnector", 
                        0xFF, 
                        "port", 
                        Buffer (0x04)
                        {
                             0x05, 0x00, 0x00, 0x00                         
                        }
                    }, 

                    "HS14", 
                    Package (0x06)
                    {
                        "name", 
                        Buffer (0x05)
                        {
                            "HS14"
                        }, 

                        "UsbConnector", 
                        0xFF, 
                        "port", 
                        Buffer (0x04)
                        {
                             0x0E, 0x00, 0x00, 0x00                         
                        }
                    }, 

                    "SS01", 
                    Package (0x06)
                    {
                        "name", 
                        Buffer (0x05)
                        {
                            "SS01"
                        }, 

                        "UsbConnector", 
                        0x03, 
                        "port", 
                        Buffer (0x04)
                        {
                             0x11, 0x00, 0x00, 0x00                         
                        }
                    }, 

                    "SS02", 
                    Package (0x06)
                    {
                        "name", 
                        Buffer (0x05)
                        {
                            "SS02"
                        }, 

                        "UsbConnector", 
                        0x0A, 
                        "port", 
                        Buffer (0x04)
                        {
                             0x12, 0x00, 0x00, 0x00                         
                        }
                    }, 

                    "SS03", 
                    Package (0x06)
                    {
                        "name", 
                        Buffer (0x05)
                        {
                            "SS03"
                        }, 

                        "UsbConnector", 
                        0x03, 
                        "port", 
                        Buffer (0x04)
                        {
                             0x13, 0x00, 0x00, 0x00                         
                        }
                    }
                }
            }
        })
    }
}

