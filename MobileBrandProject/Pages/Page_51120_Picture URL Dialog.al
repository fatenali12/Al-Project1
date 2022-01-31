page 51120 "Picture URL Dialog"
{
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Picture URL Dialog';


    layout
    {
        area(Content)
        {

            field("Mobile ID"; MobileID)
            {
                ApplicationArea = All;
                Caption = 'Mobile ID';
                Editable = false;

            }
            field("Mobile Name"; MobileName)
            {
                ApplicationArea = All;
                Caption = 'Mobile Name';
                Editable = false;

            }
            field("Picture URL"; PictureURL)
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
        myInt: Integer;
        MobileID: Code[20];
        MobileName: Text[50];
        PictureURL: Text;

    procedure SetMobileInfo(NewMobileID: code[20]; NewMobileName: text[50])
    begin
        MobileID := NewMobileID;
        MobileName := NewMobileName;

    end;

    procedure ImportMobilePictureFromURL()
    var
        myInt: Integer;
        MobileList: Record "Mobile List";
        Client: HttpClient;
        Content: HttpContent;
        Response: HttpResponseMessage;
        InStr: InStream;

    begin

        Client.Get(PictureURL, Response);
        Response.Content.ReadAs(InStr);
        if MobileList.Get(MobileID) then begin
            Clear(MobileList."Mobile Image");
            MobileList."Mobile Image".ImportStream(InStr, 'Picture For Mobile' + Format(MobileList."Mobile ID"));
            MobileList.Modify(true);
        end;

    end;

    procedure DeleteImage()
    var
        MobileList: Record "Mobile List";
    begin
        if MobileList.Get(MobileID) then begin

            Clear(MobileList."Mobile Image");

            MobileList.Modify(true);

        end;


    end;
}