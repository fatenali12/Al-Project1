page 51103 "Mobile Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Mobile List";


    layout
    {
        area(Content)
        {
            group("Mobile Info")
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

                }
                field("Mobile Brand"; Rec."Mobile Brand ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Mobile Brand';
                }
                field("Brand Name"; Rec."Brand Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Brand Name';
                }

            }

            group("Mobile Details")

            {
                field("Mobile Color"; Rec."Mobile Color")
                {
                    ApplicationArea = All;
                    ToolTip = 'Mobile color';
                    Importance = Additional;
                }
                field("Mobile Description"; Rec."Mobile Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Mobile Description';
                    Importance = Additional;
                }

                field("Mobile Status"; Rec."Mobile Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Mobile Status';
                    Importance = Additional;
                }

                field("Mobile Amount"; Rec."Mobile Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Mobile Amount';
                    Importance = Additional;
                }

            }
        }

        area(FactBoxes)
        {
            part("Mobile Image"; "Mobile Picture")
            {
                ApplicationArea = All;
                SubPageLink = "Mobile ID" = field("Mobile ID");

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