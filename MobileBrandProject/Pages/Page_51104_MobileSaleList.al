page 51104 "Mobile Sale List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Mobile Sale";
    CardPageId = "Mobile Sale Card";


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Mobile ID"; Rec."Mobile ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Mobile ID';
                }


                field("Mobile Name"; Rec."Mobile Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Custome ID';
                }


                field("Customer Name"; CustomerName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Custome Name';
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

    trigger OnOpenPage()
    var
        myInt: Integer;
        WelcomeMsg: Label 'Welcome to Mobile Sales List';
    begin

    end;


    trigger OnAfterGetRecord()
    var
        myInt: Integer;
        RecMobileSale: Record "Mobile Sale Line";

    begin


        CustomerName := '';
        RecMobileSale.SetRange("Mobile ID", Rec."Mobile ID");
        if RecMobileSale.FindSet() then
            repeat

                if CustomerName <> '' then
                    CustomerName += '  |  ' + RecMobileSale."Customer Name"
                else
                    CustomerName += RecMobileSale."Customer Name";
            until RecMobileSale.Next() = 0;


    end;

    var

        CustomerName: Text[50];

}
