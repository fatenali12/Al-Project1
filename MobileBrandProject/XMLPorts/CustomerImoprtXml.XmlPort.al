xmlport 51101 CustomerImportXML
{
    Caption = 'Customer XML';
    Direction = Both;
    Format = Xml;
    schema
    {
        textelement(Customers)
        {
            XmlName = 'Customers';
            tableelement(Customer; Customer)
            {
                fieldattribute(Number; Customer."No.") { }
                fieldattribute(LanguageCode; Customer."Language Code") { }

                fieldelement(Name; Customer.Name) { }
                fieldelement(Phone_No; Customer."Phone No.") { }

                textelement(Address)
                {

                    XmlName = 'Address';

                    fieldelement(Address; Customer.Address) { }
                    fieldelement(Post_Code; Customer."Post Code") { }
                    fieldelement(City; Customer.City) { }

                }





            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field(Name; Customer.Name)
                    {

                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {

                }
            }
        }
    }

    var
        myInt: Integer;
}