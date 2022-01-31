page 51116 "Mobile Picture"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Mobile List";


    layout
    {
        area(Content)
        {
            group("Mobile Picture")
            {
                field("Mobile Image"; Rec."Mobile Image")
                {
                    ApplicationArea = All;
                    ToolTip = 'Mobile Image';
                    ShowCaption = false;
                }

                field("Mobile Name"; Rec."Mobile Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Mobile Name';
                    ShowCaption = false;

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
                // var
                //     PictureURLDialog: Page "Picture URL Dialog";
                begin
                    // PictureURLDialog.SetMobileInfo(Rec."Mobile ID", Rec."Mobile Name");
                    // if pictureURLDialog.RunModal() = Action::OK then
                    //     PictureURLDialog.ImportMobilePictureFromURL();

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


            action("Import From URL")
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
                    PictureURLDialog: Page "Picture URL Dialog";
                begin
                    PictureURLDialog.SetMobileInfo(Rec."Mobile ID", Rec."Mobile Name");
                    if pictureURLDialog.RunModal() = Action::OK then
                        PictureURLDialog.ImportMobilePictureFromURL();

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
                // PictureURLDialog: Page "Picture URL Dialog";
                begin
                    // PictureURLDialog.SetMobileInfo(Rec."Mobile ID", Rec."Mobile Name");
                    // if pictureURLDialog.RunModal() = Action::OK then
                    //     PictureURLDialog.ImportMobilePictureFromURL();

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
                    PictureURLDialog: Page "Picture URL Dialog";
                begin
                    // PictureURLDialog.SetMobileInfo(Rec."Mobile ID", Rec."Mobile Name");
                    // if pictureURLDialog.RunModal() = Action::OK then
                    //     PictureURLDialog.ImportMobilePictureFromURL();
                    // PictureURLDialog.DeleteImage();

                    DeletePicture(Rec);

                end;

            }
        }
    }


    procedure ImportPicture(MobilePic: Record "Mobile List")
    var
        PicInStream: InStream;
        FileName: Text;
        ReplaceConFirmMsgLbl: Label 'The Existing Picture will be replaced .. Continue ?..';

    begin

        if MobilePic."Mobile Image".Count() > 0 then
            if Not Confirm(ReplaceConFirmMsgLbl) then
                exit;

        if file.UploadIntoStream('Import Mobile Picture', '', '', FileName, PicInStream) then begin
            Clear(Rec."Mobile Image");
            Rec."Mobile Image".ImportStream(PicInStream, FileName);
            Rec.Modify(true);
        end;
    end;


    procedure ExportPicture(MobilePic: Record "Mobile List")
    var
        PicInStream: InStream;
        FileName: Text;
        ExportConFirmMsgLbl: Label 'Do You Want To Download The Picture ?!..';
        TenantMedia: Record "Tenant Media";
        Index: Integer;
        outStr: OutStream;
        tempBlob: Codeunit "Temp Blob";

    begin


        if MobilePic."Mobile Image".Count() = 0 then begin
            Message('There is No Picture To Download');
            exit;

        end;


        if Not Confirm(ExportConFirmMsgLbl) then
            exit;

        for Index := 1 to MobilePic."Mobile Image".Count() do
            if TenantMedia.Get(MobilePic."Mobile Image".Item(Index)) then
                TenantMedia.CalcFields(Content);
        if TenantMedia.Content.HasValue() then begin
            FileName := StrSubstNo('%1_Image_%2.jpg', Rec.TableCaption(), Index);
            TenantMedia.Content.CreateInStream(PicInStream);
            File.DownloadFromStream(PicInStream, 'Download Picture', '', '', FileName);

        end;


    end;


    procedure DeletePicture(MobilePic: Record "Mobile List")
    var

        DeleteConFirmMsgLbl: Label 'Are You Sure You Want To Delete The Picture!?..';

    begin
        if not Confirm(DeleteConFirmMsgLbl) then
            exit;

        Clear(Rec."Mobile Image");
        // Rec.Modify(true);

    end;

    var
        myInt: Integer;
}


