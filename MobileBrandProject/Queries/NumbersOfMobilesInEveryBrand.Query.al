query 51101 "NumberOfMobilesInEveryBrand"
{
    QueryType = Normal;
    OrderBy = descending(Created_Date);

    elements
    {
        dataitem(Mobile_Brand; "Mobile Brand")
        {

            column(Brand_ID; "Brand ID")
            {

                Caption = 'Brand No';

            }
            column(Brand_Name; "Brand Name")
            {
                Caption = 'Brand Name';

            }

            column(Created_Date; "Created Date")
            {
                Caption = 'Created Date';
                Method = Year;
            }

            dataitem(Mobile_List; "Mobile List")
            {

                DataItemLink = "Mobile Brand ID" = Mobile_Brand."Brand ID";
                SqlJoinType = InnerJoin;
                DataItemTableFilter = "Mobile Status" = filter("Used Mobile" | "New Mobile");
                column(Mobile_Name; "Mobile Name")
                {
                    Caption = 'Mobile Name';
                }
                column(Mobile_Color; "Mobile Color")
                {
                    Caption = 'Mobile Color';
                }
                column(Mobile_Description; "Mobile Description")
                {
                    Caption = 'Mobile Description';
                }
                column(Mobile_Status; "Mobile Status")
                {
                    Caption = 'Mobile Status';
                }
                column(Mobile_Amount; "Mobile Amount")
                {
                    Caption = 'Mobile Amount';
                    Method = Sum;

                }

            }
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}