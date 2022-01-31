page 51112 "Mobile Purchase Line"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Mobile Purchase Line";
    AutoSplitKey = true;


    layout
    {
        area(Content)
        {
            repeater("Customer Info")
            {


                field("Confirme Request"; Rec."Confirme Request")
                {
                    ApplicationArea = All;
                    ToolTip = 'Confirme Request';

                }
                field("Vendor ID"; Rec."Vendor ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Mobile ID';

                }


                // field("Vendor Name"; Rec."Vendor Name")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies Vendor Name';
                // }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Line No.';

                }

                field("Mobile ID"; Rec."Mobile ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Mobile ID';
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
                // field("Total"; Rec.Total)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies Mobile Total';
                // }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

            }
        }
    }

    var
        myInt: Integer;


}
