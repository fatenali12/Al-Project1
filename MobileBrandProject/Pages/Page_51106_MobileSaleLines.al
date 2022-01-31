page 51106 "Mobile Sale Line"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Mobile Sale Line";
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater("Customer Info")
            {


                field("Process Sales"; Rec."Process Sales")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Process Sales';
                }
                field("Mobile ID"; Rec."Mobile ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Mobile ID';

                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Line No.';

                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Customer Name';
                }

                field("Quantity"; Rec."Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Mobile Quantity';
                }

                field("Mobile Type"; Rec."Mobile Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Mobile Status';
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
