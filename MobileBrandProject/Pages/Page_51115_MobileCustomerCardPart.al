page 51115 "Customer Details"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Mobile Customer";


    layout
    {
        area(Content)
        {
            group("Customer Picture")
            {
                field("Avatar"; Rec.Avatar)
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer Picture';
                    ShowCaption = false;
                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer Name';
                }
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(Take)
            {
                ApplicationArea = All;
                Caption = 'Take';
                Image = Camera;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Import Picture From URL..';

                trigger OnAction()
                var

                begin


                end;



            }


            action(Import)
            {
                ApplicationArea = All;
                Caption = 'Imoprt';
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Import Picture From';

                trigger OnAction()
                var

                begin
                    ImportCusPicture(Rec);

                end;

            }


            action(ImportFormURL)
            {
                ApplicationArea = All;
                Caption = 'Imoprt From URL';
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Import Picture From URL..';

                trigger OnAction()
                var
                    CusPictureURLDialog: Page "CusPicture URL Dialog";

                begin
                    CusPictureURLDialog.SetCustomerInfo(Rec."Customer ID", Rec."Customer Name");
                    if CuspictureURLDialog.RunModal() = Action::OK then
                        cusPictureURLDialog.ImportMobilePictureFromURL();
                end;

            }
            action(Export)
            {
                ApplicationArea = All;
                Caption = 'Export';
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Export Picture';

                trigger OnAction()
                var

                begin

                    ExportPicture(Rec);


                end;

            }
            action(Delete)
            {
                ApplicationArea = All;
                Caption = 'Delete';
                Image = Delete;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Delete Picture ';


                trigger OnAction()
                var

                begin

                    DeletePicture(Rec);

                end;

            }
        }
    }




    procedure ImportCusPicture(CustomerPic: Record "Mobile Customer")
    var
        PicIsStream: InStream;
        FileName: Text;
        ImportConFirmMsgLbl: Label 'The Existing Picture will be replaced .. Continue ?..';
    begin


        if CustomerPic.Avatar.Count() > 0 then
            if not Confirm(ImportConFirmMsgLbl) then
                exit;

        file.UploadIntoStream('Import Picture', '', '', FileName, PicIsStream);
        Clear(CustomerPic.Address);
        CustomerPic.Avatar.ImportStream(PicIsStream, FileName);
        CustomerPic.Modify(true);

    end;


    procedure ExportPicture(CustomerPic: Record "Mobile Customer")
    var

        TenantMedia: Record "Tenant Media";
        PicInStream: InStream;
        FileName: Text;
        Index: Integer;
        ExportConFirmMsgLbl: Label 'Do You Want To Download The Picture ?!..';

    begin


        if CustomerPic.Avatar.Count() = 0 then begin
            Message('There is No Picture To Download');
            exit;

        end;


        if not Confirm(ExportConFirmMsgLbl) then
            exit;


        for Index := 1 to CustomerPic.Avatar.Count() do
            if TenantMedia.Get(CustomerPic.Avatar.Item(Index)) then
                TenantMedia.CalcFields(Content);
        if TenantMedia.Content.HasValue() then begin
            FileName := StrSubstNo('%1_Image.jpg', Rec.TableCaption());
            TenantMedia.Content.CreateInStream(PicInStream);
            File.DownloadFromStream(PicInStream, 'Download Picture', '', '', FileName);
        end;
    end;


    procedure DeletePicture(CustomerPic: Record "Mobile Customer")
    var

        DeleteConFirmMsgLbl: Label 'Are You Sure You Want To Delete The Picture!?..';

    begin
        if not Confirm(DeleteConFirmMsgLbl) then
            exit;

        Clear(Rec.Avatar);
        Rec.Modify(true);

    end;



    var
        myInt: Integer;
}