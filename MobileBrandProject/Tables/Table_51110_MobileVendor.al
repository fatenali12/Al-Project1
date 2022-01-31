table 51110 "Mobile Vendor"
{
    DataClassification = ToBeClassified;
    LookupPageId = 51117;
    DrillDownPageId = 51117;

    fields
    {
        field(1; "Vendor ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Vendor ID';
        }
        field(2; "Vendor Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Vendor Name';
        }
        field(3; "Phone No."; Text[50])
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
        field(6; "Address2"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Address2';
        }

        field(7; "Avatar"; MediaSet)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Vendor ID")
        {
            Clustered = true;
        }
    }


    fieldgroups
    {
        fieldgroup(DropDown; "Vendor ID", "Vendor Name", "Phone No.", Email) { }
        fieldgroup(Brick; "Vendor ID", "Vendor Name", "Phone No.", Email, "Address", "Avatar") { }
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