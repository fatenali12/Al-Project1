page 51107 "Mobile Customer List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = lists;
    SourceTable = "Mobile Customer";
    CardPageId = 51108;



    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Customer ID"; Rec."Customer ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Customer ID';
                    NotBlank = true;
                    ShowMandatory = true;

                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Customer Name';
                    ShowMandatory = true;
                }

                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Phone No.';
                    ExtendedDatatype = PhoneNo;
                }

                field("Email"; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Phone No.';
                    ExtendedDatatype = EMail;
                }

                field("Address"; Rec."Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Address';
                }

                field("Avatar"; Rec.Avatar)
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
            action(ActionName)
            {

            }
        }
    }

    var
        myInt: Integer;
}