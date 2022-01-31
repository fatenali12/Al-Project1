page 51117 "Mobile Vendor List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Mobile Vendor";
    CardPageId = "Mobile Vendor Card";
    layout
    {
        area(Content)
        {
            repeater(General)
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

                field("Address2"; Rec."Address2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Address';
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Show Confirmed Purchases")
            {
                ApplicationArea = All;
                RunObject = page "Confirmed Purchase Request";
                // RunPageLink = "Vendor ID" = field("Vendor ID");
                Image = ShowList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}