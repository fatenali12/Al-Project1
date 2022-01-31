table 51101 "Mobile Brand"
{
    DataClassification = CustomerContent;
    Caption = 'Mobile Brand';
    LookupPageId = 51101;
    DrillDownPageId = 51101;

    fields
    {
        field(1; "Brand ID"; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Brand ID';

        }

        field(2; "Brand Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Brand Name';
        }

        field(3; "Number Of Mobiles"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Mobile List" where("Mobile Brand ID" = field("Brand ID")));
            Editable = false;
        }

        field(4; "Created Date"; DateTime)
        {
            DataClassification = CustomerContent;
            Caption = 'Created Date';
        }


        field(5; "Last Modified Date"; DateTime)
        {
            DataClassification = CustomerContent;
            Caption = 'Last Modified Date';
        }
    }

    keys
    {
        key(PK; "Brand ID")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()

    begin

        "Created Date" := CurrentDateTime;
        Message('New Record Inserted');
    end;

    trigger OnModify()
    begin

        "Last Modified Date" := CurrentDateTime;
        Message('Record Has Been Modified');

    end;

    trigger OnDelete()
    var
        RecMobileList: Record "Mobile List";

    begin

        RecMobileList.Reset();
        RecMobileList.SetRange("Mobile Brand ID", "Brand ID");

        if RecMobileList.FindSet() then
            RecMobileList.DeleteAll();
        Message('Record Deleted');



    end;

    trigger OnRename()
    var
        RecMobileList: Record "Mobile List";

    begin
        RecMobileList.Reset();
        RecMobileList.SetRange("Mobile Brand ID", "Brand ID");
        if RecMobileList.FindSet() then
            repeat
                RecMobileList.Rename("Brand ID", Rec."Brand ID");
            until RecMobileList.Next() = 0;

        Message('Record Has Been Renamed');

    end;
}