table 51105 "Mobile Customer"
{
    DataClassification = ToBeClassified;
    Caption = 'Customer';
    LookupPageId = 51107;
    DrillDownPageId = 51107;

    fields
    {

        field(1; "Customer ID"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer ID';

        }

        field(2; "Customer Name"; text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Name';
        }

        field(3; "Phone No."; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Phone No.';
        }

        field(4; "Email"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Email';

        }
        field(5; "Address"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Address';
        }

        field(6; "Avatar"; MediaSet)
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Image';
        }
    }


    keys
    {
        key(PK; "Customer ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Customer ID", "Customer Name", "Phone No.", Email) { }
        fieldgroup(Brick; "Customer ID", "Customer Name", "Phone No.", Email, "Address", "Avatar") { }
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

