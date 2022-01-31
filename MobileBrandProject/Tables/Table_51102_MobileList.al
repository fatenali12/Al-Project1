table 51102 "Mobile List"
{
    DataClassification = CustomerContent;
    Caption = 'Mobile List';
    LookupPageId = 51102;
    DrillDownPageId = 51102;


    fields
    {
        field(1; "Mobile ID"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Mobile ID';
            NotBlank = true;

        }
        field(2; "Mobile Name"; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Mobile Name';
            NotBlank = true;
        }

        field(3; "Mobile Brand ID"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Mobile Brand ID';
            TableRelation = "Mobile Brand";

            trigger OnValidate()
            var
                myInt: Integer;
                RecMobileBrand: Record "Mobile Brand";
            begin
                RecMobileBrand.Get(Rec."Mobile Brand ID");
                "Brand Name" := RecMobileBrand."Brand Name";

            end;


            trigger OnLookup()
            var
                myInt: Integer;

                RecMobileBrand: Record "Mobile Brand";
            begin

                RecMobileBrand.FindSet();
                if Page.RunModal(0, RecMobileBrand) = Action::LookupOK then begin

                    "Mobile Brand ID" := RecMobileBrand."Brand ID";
                    "Brand Name" := RecMobileBrand."Brand Name";
                end;


            end;
        }

        field(4; "Brand Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Brand Name';

        }

        field(5; "Mobile Color"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Mobile Color';
        }

        field(6; "Mobile Description"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mobile Description';
        }
        field(7; "Mobile Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "New Mobile","Used Mobile";
            Caption = 'Mobile Status';

        }

        field(8; "Mobile Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mobile Amount';

        }

        field(9; "Mobile Image"; MediaSet)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mobile Image';
        }

    }

    keys
    {
        key(PK; "Mobile ID")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Mobile ID", "Mobile Name", "Mobile Color", "Mobile Amount") { }
        fieldgroup(Brick; "Mobile ID", "Mobile Name", "Mobile Color", "Mobile Description", "Mobile Amount", "Mobile Status", "Mobile Image") { }
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

