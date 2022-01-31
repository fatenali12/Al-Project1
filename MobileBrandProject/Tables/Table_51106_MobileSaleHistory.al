table 51106 "Mobile Sale History"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Mobile ID"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mobile ID';

        }

        field(2; "Customer Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(3; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(4; "Mobile Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mobile Amount';
        }
    }

    keys
    {
        key(PK; "Mobile ID", "Entry No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}