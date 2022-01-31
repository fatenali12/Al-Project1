page 51109 "Mobile Brand Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Mobile Brand";

    layout
    {
        area(Content)
        {
            group("Mobile Info")
            {
                field("Brand ID"; Rec."Brand ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Brand ID';
                }

                field("Brand Name"; Rec."Brand Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Brand Name';

                }
                field("Number Of Mobiles"; Rec."Number Of Mobiles")
                {
                    ApplicationArea = All;
                    ToolTip = 'Number Of Mobiles';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Created Date';
                }

                field("Last Modified Date"; Rec."Last Modified Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Last Modified Date';
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