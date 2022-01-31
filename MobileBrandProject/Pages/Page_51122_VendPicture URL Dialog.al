page 51122 "VendPicture URL Dialog"
{
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Vendor Picture URL Dialog';


    layout
    {
        area(Content)
        {

            field("Vendor ID"; VendorID)
            {
                ApplicationArea = All;
                Caption = 'Mobile ID';
                Editable = false;

            }
            field("Vendor Name"; VendorName)
            {
                ApplicationArea = All;
                Caption = 'Mobile Name';
                Editable = false;

            }
            field("VendPicture URL"; VendPictureURL)
            {
                ApplicationArea = All;
                Caption = 'Picture URL';
                ExtendedDatatype = URL;

            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var

        VendorID: Code[20];
        VendorName: Text[50];
        VendPictureURL: Text;

    procedure SetVendorInfo(NewVendorID: code[20]; NewVendorName: text[50])
    begin
        VendorID := NewVendorID;
        VendorName := NewVendorName;

    end;

    procedure ImportMobilePictureFromURL()
    var
        myInt: Integer;
        MobileVendor: Record "Mobile Vendor";
        Client: HttpClient;
        Content: HttpContent;
        Response: HttpResponseMessage;
        InStr: InStream;

    begin

        Client.Get(VendPictureURL, Response);
        Response.Content.ReadAs(InStr);
        if MobileVendor.Get(VendorID) then begin
            Clear(MobileVendor.Avatar);
            MobileVendor."Avatar".ImportStream(InStr, 'Picture For Mobile' + Format(MobileVendor."Vendor ID"));
            MobileVendor.Modify(true);
        end;

    end;
}