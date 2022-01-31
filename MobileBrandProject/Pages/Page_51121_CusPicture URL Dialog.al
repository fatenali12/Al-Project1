page 51121 "CusPicture URL Dialog"
{
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Customer Picture URL Dialog';


    layout
    {
        area(Content)
        {

            field("Customer ID"; CustomerID)
            {
                ApplicationArea = All;
                Caption = 'Mobile ID';
                Editable = false;

            }
            field("customer Name"; CustomerName)
            {
                ApplicationArea = All;
                Caption = 'Mobile Name';
                Editable = false;

            }
            field("cusPicture URL"; CusPictureURL)
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
        CustomerID: Code[20];
        CustomerName: Text[50];
        CusPictureURL: Text;

    procedure SetCustomerInfo(NewCustomerID: code[20]; NewCustomerName: text[50])
    begin
        CustomerID := NewCustomerID;
        CustomerName := NewCustomerName;

    end;

    procedure ImportMobilePictureFromURL()
    var
        myInt: Integer;
        MobileCustomer: Record "Mobile Customer";
        Client: HttpClient;
        Content: HttpContent;
        Response: HttpResponseMessage;
        InStr: InStream;

    begin

        Client.Get(CusPictureURL, Response);
        Response.Content.ReadAs(InStr);
        if MobileCustomer.Get(CustomerID) then begin
            Clear(MobileCustomer.Avatar);
            MobileCustomer."Avatar".ImportStream(InStr, 'Picture For Mobile' + Format(MobileCustomer."Customer ID"));
            MobileCustomer.Modify(true);
        end;

    end;
}