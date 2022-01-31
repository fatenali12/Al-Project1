page 51102 "Mobile List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Mobile List";
    Caption = 'Mobile List';
    CardPageId = 51103;


    layout
    {


        area(Content)
        {



            repeater("Mobile Info")
            {

                field("Mobile ID"; Rec."Mobile ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Mobile ID';
                }



                field("Mobile Name"; Rec."Mobile Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Mobile Name';
                    ShowMandatory = true;

                }
                // field("Mobile Brand"; Rec."Mobile Brand ID")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Mobile Brand ID';
                // }

                field("Brand Name"; Rec."Brand Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Brand Description';

                }
                field("Mobile Color"; Rec."Mobile Color")
                {
                    ApplicationArea = All;
                    ToolTip = 'Mobile color';

                }
                field("Mobile Description"; Rec."Mobile Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Mobile Description';

                }

                field("Mobile Status"; Rec."Mobile Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Mobile Status';
                }

                field("Mobile Amount"; Rec."Mobile Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Mobile Amount';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Show Mobile Sales")
            {
                ApplicationArea = All;
                RunObject = page "Mobile Sale List";
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