page 51110 "Mobile Sale History"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Mobile Sale History";

    layout
    {
        area(Content)
        {
            repeater("Mobile Sales Info")
            {
                field("Mobile ID"; Rec."Mobile ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Mobile ID';

                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;

                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Entry No.';

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