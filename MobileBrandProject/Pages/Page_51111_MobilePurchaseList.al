page 51111 "Mobile Purchase List"
{
    PageType = list;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Mobile Purchase";
    CardPageId = "Mobile Purchase Card";

    layout
    {
        area(Content)
        {
            repeater("Customer Purchase Info")
            {

                field("Vendor ID"; Rec."Vendor ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Customer ID';

                }

                field("Customer Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Vendor Name';
                }

                // field("Mobile ID"; Rec."Mobile ID")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies Mobile ID';
                // }


                field("Mobile Name"; MobileName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Mobile Name';
                }

                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies The Order Date';
                }


                field("Confirmed"; ConfirmedRequest)
                {
                    ApplicationArea = All;

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
                // RunPageLink = "Vendor ID" = field("Vendor ID");
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
        WelcomeMsg: Label 'Welcome to Customer Purchase List';

    trigger OnOpenPage();
    begin
        Message(WelcomeMsg);
    end;




    trigger OnAfterGetRecord()
    var
        myInt: Integer;
        RecConfirmedRequest: Record "Confirmed Purchase Request";
        RecPurchaseLine: Record "Mobile Purchase Line";

    begin

        MobileName := '';
        RecPurchaseLine.SetRange("Vendor ID", Rec."Vendor ID");
        if RecPurchaseLine.FindSet() then begin
            MobileName := RecPurchaseLine."Mobile Name";

        end;


        ConfirmedRequest := '';
        RecConfirmedRequest.SetRange("Vendor ID", Rec."Vendor ID");
        if RecConfirmedRequest.FindSet() then begin
            ConfirmedRequest := RecConfirmedRequest."Confirmed";


        end
        else
            ConfirmedRequest := 'Not Confirmed';

    end;

    var

        ConfirmedRequest: Text[50];
        MobileName: Text[50];
}