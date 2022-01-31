page 51108 "Mobile Customer Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Mobile Customer";


    layout
    {
        area(Content)
        {
            group("Customer Info")
            {
                field("Customer ID"; Rec."Customer ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Customer ID';

                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Customer Name';
                }

                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Phone No.';
                    ExtendedDatatype = PhoneNo;
                }
                field("Email"; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Email';
                    ExtendedDatatype = EMail;

                }

                field("Address"; Rec."Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Address';
                }
            }
        }

        area(FactBoxes)
        {
            part("Customer Picture"; "Customer Details")
            {
                ApplicationArea = All;
                SubPageLink = "Customer ID" = field("Customer ID");
            }

            systempart("Notes"; Notes)
            {
                ApplicationArea = All;

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}