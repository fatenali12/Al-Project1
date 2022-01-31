page 51113 "Mobile Purchase Card"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Mobile Purchase";

    layout
    {
        area(Content)
        {
            group(Details)
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

                // field("Mobile ID"; Rec."Mobile ID")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies Mobile ID';

                // }
                // field("Mobile Name"; Rec."Mobile Name")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies Mobile Name';

                // }

                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Order Date';
                }

                field("Phone No"; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Created By ...';
                }

                field("Email"; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Created Date';
                }
            }

            part("Customer Purchases Lines"; "Mobile Purchase Line")
            {

                ApplicationArea = All;
                SubPageLink = "Vendor ID" = field("Vendor ID");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Confirmed Requests")
            {
                ApplicationArea = All;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    RecCustPurchasesLines: Record "Mobile Purchase Line";
                    RecConfirmedCustRequests: Record "Confirmed Purchase Request";
                    ConfirmedMessage: label 'Request Confirmed';

                begin
                    RecCustPurchasesLines.Reset();
                    RecCustPurchasesLines.SetRange("Vendor ID", Rec."Vendor ID");
                    RecCustPurchasesLines.SetRange("Confirme Request", true);

                    if RecCustPurchasesLines.FindSet() then
                        repeat

                            RecConfirmedCustRequests.Init();
                            RecConfirmedCustRequests."Vendor ID" := RecCustPurchasesLines."Vendor ID";
                            RecConfirmedCustRequests."Vendor Name" := RecCustPurchasesLines."Vendor Name";
                            RecConfirmedCustRequests."Mobile Name" := RecCustPurchasesLines."Mobile Name";
                            RecConfirmedCustRequests."Quantity" := RecCustPurchasesLines."Quantity";
                            RecConfirmedCustRequests."Mobile Amount" := RecCustPurchasesLines."Mobile Amount";
                            RecConfirmedCustRequests."Confirmed" := 'Confirmed';

                            RecConfirmedCustRequests."Entity No." := 0;
                            RecConfirmedCustRequests.Insert();
                            RecCustPurchasesLines."Confirme Request" := false;
                            RecCustPurchasesLines.Modify();

                            Message(ConfirmedMessage);

                        until RecCustPurchasesLines.Next() = 0;



                end;
            }

            action("Show Confirmed Requests")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = GoTo;
                RunObject = page "Confirmed Purchase Request";
                RunPageLink = "Vendor ID" = field("Vendor ID");


                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;



}