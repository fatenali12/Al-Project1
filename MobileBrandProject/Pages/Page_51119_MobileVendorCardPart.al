page 51119 "Vendor Details"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Mobile Vendor";


    layout
    {
        area(Content)
        {
            group("Vendor Picture")
            {
                field("Avatar"; Rec.Avatar)
                {
                    ApplicationArea = All;
                    ToolTip = 'Vendor Picture';
                    ShowCaption = false;
                }

                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Name:';
                    ToolTip = 'Vendor Name';
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
                ToolTip = 'Import Picture';


                trigger OnAction()
                var

                begin
                    ImportPicture(Rec);

                end;

            }


            action(ImportFromURL)
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
                    VendPictureURLDialog: Page "VendPicture URL Dialog";
                begin
                    VendPictureURLDialog.SetVendorInfo(Rec."Vendor ID", Rec."Vendor Name");
                    if VendpictureURLDialog.RunModal() = Action::OK then
                        VendPictureURLDialog.ImportMobilePictureFromURL();

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

    procedure ImportPicture(VendPicture: Record "Mobile Vendor")
    var
        PicInStream: InStream;
        FileName: Text;
        ReplaceConFirmMsgLbl: Label 'The Existing Picture will be replaced .. Continue ?..';
    begin

        if VendPicture.Avatar.Count() > 0 then
            if not Confirm(ReplaceConFirmMsgLbl) then
                exit;

        if file.UploadIntoStream('Import Picture', '', '', FileName, PicInStream) then begin
            Clear(Rec.Avatar);
            Rec.Avatar.ImportStream(PicInStream, FileName);
            Rec.Modify(true);
        end;
    end;


    procedure ExportPicture(VendPicture: Record "Mobile Vendor")
    var

        TenantMedia: Record "Tenant Media";
        PicInStream: InStream;
        FileName: Text;
        ExportConFirmMsgLbl: Label 'Do You Want To Download The Picture ?!..';
        Index: Integer;
    begin

        if VendPicture.Avatar.Count() = 0 then begin
            Message('There is No Picture To Download');
            exit;
        end;


        if not Confirm(ExportConFirmMsgLbl) then
            exit;

        for Index := 1 to VendPicture.Avatar.Count() do
            if TenantMedia.Get(VendPicture.Avatar.Item(Index)) then
                TenantMedia.CalcFields(Content);
        if TenantMedia.Content.HasValue() then begin
            FileName := StrSubstNo('%1_Image.jpg', Rec.TableCaption());
            TenantMedia.Content.CreateInStream(PicInStream);
            File.DownloadFromStream(PicInStream, 'Download Picture', '', '', FileName);

        end;


    end;


    procedure DeletePicture(VendPicture: Record "Mobile Vendor")
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