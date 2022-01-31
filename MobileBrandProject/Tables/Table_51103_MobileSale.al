table 51103 "Mobile Sale"
{
    DataClassification = ToBeClassified;
    Caption = 'Mobile Sales';

    fields
    {
        field(1; "Mobile ID"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mobile ID';
            TableRelation = "Mobile List";

            trigger OnLookup()
            var
                myInt: Integer;
                RecMoblieList: Record "Mobile List";
            begin

                RecMoblieList.Reset();
                RecMoblieList.FindSet();
                if Page.RunModal(0, RecMoblieList) = Action::LookupOK then begin
                    "Mobile ID" := RecMoblieList."Mobile ID";
                    "Mobile Name" := RecMoblieList."Mobile Name";
                end;

            end;
        }
        field(2; "Customer Name"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Name';

        }

        field(3; "Mobile Name"; text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mobile Name';
        }

        field(4; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Created Date';
        }

        field(5; "Created By"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Created By';
        }
    }

    keys
    {
        key(PK; "Mobile ID")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

        "Created By" := UserId;
        "Created Date" := Today;

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