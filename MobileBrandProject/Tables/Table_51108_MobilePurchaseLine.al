table 51108 "Mobile Purchase Line"
{
    DataClassification = ToBeClassified;
    Caption = 'Customers Purchases Lines';

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

        field(3; "Mobile ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mobile ID';
            TableRelation = "Mobile List";

            trigger OnValidate()
            var
                myInt: Integer;

                RecMobile: Record "Mobile List";
            begin

                RecMobile.Get(Rec."Mobile ID");
                "Mobile Name" := RecMobile."Mobile Name";

            end;



            trigger OnLookup()
            var
                myInt: Integer;

                RecMobile: Record "Mobile List";
            begin
                RecMobile.Reset();
                RecMobile.FindSet();

                if Page.RunModal(0, RecMobile) = Action::LookupOK then begin
                    "Mobile ID" := RecMobile."Mobile ID";
                    "Mobile Name" := RecMobile."Mobile Name";
                    "Mobile Amount" := RecMobile."Mobile Amount";
                end;

            end;


        }

        field(4; "Mobile Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mobile Name';
        }

        field(5; "Mobile Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "New Mobile","Used Mobile";
            Caption = 'Mobile status';
        }

        field(6; "Quantity"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantity';

            trigger OnValidate()
            var
                myInt: Integer;
                TotalCodeunit: Codeunit Total;
            begin

                TotalCodeunit.Run(Rec);

            end;
        }

        field(7; "Mobile Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mobile Amount';
        }

        // field(8; "Total"; decimal)
        // {
        //     DataClassification = ToBeClassified;
        //     Caption = 'Total';
        // }

        field(9; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Line No.';
        }

        field(10; "Confirme Request"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Confirme Request';
        }


    }

    keys
    {
        key(PK; "Vendor ID", "Line No.")
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