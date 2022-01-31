page 51114 "Confirmed Purchase Request"

{
    PageType = list;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Confirmed Purchase Request";


    layout
    {
        area(Content)
        {
            repeater("Customer Purchase Info")
            {
                field("Vendor ID"; Rec."Vendor ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Vendor ID';

                }

                field("Vendor Name"; VendorName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Vendor Name';
                }

                field("Entity No."; Rec."Entity No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Entity No.';
                }

                field("Mobile Name"; Rec."Mobile Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Mobile Name';
                }

                field("Quantity"; Rec."Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Mobile Quantity';
                }

                field("Mobile Amount"; Rec."Mobile Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Mobile Amount';
                }



                field("Confirmed"; Rec.Confirmed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Confirmed';

                }



            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Go To Vendors")
            {
                ApplicationArea = All;
                RunObject = page "Mobile Vendor List";
                RunPageLink = "Vendor ID" = field("Vendor ID");
                RunPageMode = View;
                Promoted = true;
                Image = GoTo;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;



    trigger OnAfterGetRecord();

    var
        myInt: Integer;
        RecMobileVendor: Record "Mobile Vendor";

    begin
        VendorName := '';
        RecMobileVendor.SetRange("Vendor ID", Rec."Vendor ID");

        if RecMobileVendor.FindSet() then
            VendorName := RecMobileVendor."Vendor Name";

    end;

    var
        VendorName: Text[50];



}