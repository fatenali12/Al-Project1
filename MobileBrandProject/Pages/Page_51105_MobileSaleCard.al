page 51105 "Mobile Sale Card"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Mobile Sale";

    layout
    {
        area(Content)
        {
            group(Details)
            {
                field("Mobile ID"; Rec."Mobile ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Mobile ID';

                }

                field("Mobile Name"; Rec."Mobile Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies customer Name';
                }

                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Created By ...';
                }

                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Created Date';
                }
            }

            part(Lines; "Mobile Sale Line")
            {
                ApplicationArea = All;
                SubPageLink = "Mobile ID" = field("Mobile ID");

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Process Sales")
            {
                ApplicationArea = All;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    RecMobileLines: Record "Mobile Sale Line";
                    RecMobileSalesHistory: Record "Mobile Sale History";

                    ProcessDone: label 'Process Done';
                begin
                    RecMobileLines.Reset();
                    RecMobileLines.SetRange("Mobile ID", Rec."Mobile ID");
                    RecMobileLines.SetRange("Process Sales", true);




                    if RecMobileLines.FindSet() then
                        repeat

                            RecMobileSalesHistory.Init();
                            RecMobileSalesHistory."Mobile ID" := RecMobileLines."Mobile ID";
                            RecMobileSalesHistory."Customer Name" := RecMobileLines."Customer Name";
                            RecMobileSalesHistory."Mobile Amount" := RecMobileLines."Mobile Amount";
                            RecMobileSalesHistory."Entry No." := 0;
                            RecMobileSalesHistory.Insert();
                            RecMobileLines."Process Sales" := false;
                            RecMobileLines.Modify();

                            Message(ProcessDone);

                        until RecMobileLines.Next() = 0;

                end;
            }


            action("Show Mobile Sales History")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = ShowChart;
                RunObject = page "Mobile Sale History";
                RunPageLink = "Mobile ID" = field("Mobile ID");

                trigger OnAction()
                var
                    myInt: Integer;
                begin

                end;
            }

        }
    }

    var
        myInt: Integer;
}