table 51104 "Mobile Sale Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Mobile ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mobile ID';
            TableRelation = "Mobile List";

            trigger OnValidate()
            var
                myInt: Integer;

                RecMoblieList: Record "Mobile List";
            begin
                RecMoblieList.Get(Rec."Mobile ID");
                "Mobile Status" := RecMoblieList."Mobile Status";
                "Mobile Amount" := RecMoblieList."Mobile Amount";
            end;

            // trigger OnLookup()
            // var
            //     myInt: Integer;
            //     RecMoblieList: Record "Mobile List";
            // begin

            //     RecMoblieList.Reset();
            //     RecMoblieList.FindSet();
            //     if Page.RunModal(0, RecMoblieList) = Action::LookupOK then begin
            //         "Mobile ID" := RecMoblieList."Mobile ID";
            //         "Mobile Status" := RecMoblieList."Mobile Status";
            //         "Mobile Amount" := RecMoblieList."Mobile Amount";
            //     end;

            // end;

        }

        field(2; "Mobile Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mobile Name';
        }

        field(3; "Customer Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer  Name';
        }

        field(4; "Quantity"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mobile Quantity';
        }

        field(5; "Mobile Status"; option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "New Mobile","Used Mobile";
            Caption = 'Mobile status';
        }

        field(6; "Mobile Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mobile Amount';

        }

        field(7; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Line No.';
        }
        field(8; "Process Sales"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Process Sales';
        }
    }

    keys
    {
        key(Pk; "Mobile ID", "Line No.")
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