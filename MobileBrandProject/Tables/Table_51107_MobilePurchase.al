table 51107 "Mobile Purchase"
{
    DataClassification = ToBeClassified;
    Caption = 'Customers Purchases';

    fields
    {
        field(1; "Vendor ID"; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Vendor ID';
            TableRelation = "Mobile Vendor";


            trigger OnValidate()
            var
                myInt: Integer;

                RecMobileCustomer: Record "Mobile Vendor";
            begin
                RecMobileCustomer.Get(Rec."Vendor ID");
                "Vendor Name" := RecMobileCustomer."Vendor Name";

            end;

            trigger onlookup()
            var
                myInt: Integer;
                RecMobileVendor: Record "Mobile Vendor";
            begin

                RecMobileVendor.Reset();
                RecMobileVendor.FindSet();
                if Page.RunModal(0, RecMobileVendor) = Action::LookupOK then begin
                    "Vendor ID" := RecMobileVendor."Vendor ID";
                    "Vendor Name" := RecMobileVendor."Vendor Name";
                    "Phone No." := RecMobileVendor."Phone No.";
                    "Email" := RecMobileVendor."Email";
                end;

            end;

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

                end;

            end;

        }

        field(4; "Mobile Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mobile Name';
        }

        field(5; "Order Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Order Date';
        }

        field(6; "Phone No."; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Phone No.';
        }

        field(7; "Email"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Email';
        }

    }

    keys
    {
        key(PK; "Vendor ID")
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
