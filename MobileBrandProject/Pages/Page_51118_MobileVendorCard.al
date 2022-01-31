page 51118 "Mobile Vendor Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Mobile Vendor";


    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Vendor ID"; Rec."Vendor ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Vendor ID';

                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Vendor Name';
                }

            }

            group("Address & Contact")
            {

                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Phone No.';
                    ExtendedDatatype = PhoneNo;
                    Importance = Additional;

                }

                field("Email"; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Email';
                    ExtendedDatatype = EMail;
                    Importance = Additional;
                }

                field("Address"; Rec."Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Address';
                    Importance = Additional;
                }

                field("Address2"; Rec."Address2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Address';
                    Importance = Additional;
                }
            }
        }

        area(FactBoxes)
        {
            part("Vendor Details"; "Vendor Details")
            {
                ApplicationArea = All;
                SubPageLink = "Vendor ID" = field("Vendor ID");

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