table 51109 "Confirmed Purchase Request"

{
    DataClassification = ToBeClassified;
    Caption = 'Customers Purchases';

    fields
    {
        field(1; "Vendor ID"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Vendor ID';
        }


        field(2; "Vendor Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Vendor Name';
        }

        field(3; "Entity No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }


        field(5; "Mobile Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mobile Name';
        }

        field(6; "Quantity"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantity';
        }

        field(7; "Mobile Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mobile Amount';
        }

        field(8; "Confirmed"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Confirmed';
        }


    }
    keys
    {
        key(PK; "Vendor ID", "Entity No.")
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
