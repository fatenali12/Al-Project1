pageextension 51104 IBBGenJournalEXt extends "General Journal"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {


        addfirst(Processing)
        {
            group(IBBImports)
            {
                Caption = 'Import';

                action("IBBImport")
                {
                    ApplicationArea = All;
                    Caption = 'Import Excel & CSV File';
                    ToolTip = 'Import Excel & CSV File';

                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Image = ImportExcel;



                    trigger OnAction()
                    begin
                        Xmlport.Run(51103, false, true);
                        IBBRunXMLPortImport();
                    end;
                }
            }
        }

    }
    procedure IBBRunXMLPortImport()
    var
        TempBlob: Codeunit "Temp Blob";
        FileInstream: InStream;
        outStr: OutStream;
        FileName: Text;
        GenJnlImport: XmlPort IBBGenJournalImports;
        ConfirmExportMsgLbl: Label 'Do You Want To Export The File';

    begin

        if not Confirm(ConfirmExportMsgLbl) then
            exit;

        GenJnlImport.SetJournalTemplateBatch(rec."Journal Template Name", rec."Journal Batch Name");
        TempBlob.CreateInStream(FileInstream);
        GenJnlImport.SetSource(FileInstream);


        TempBlob.CreateInStream(FileInstream);
        UploadIntoStream('Import', '', '', FileName, FileInstream);
        GenJnlImport.Import();




        // Message('File Imported Successfully!');


        // if not Confirm(ConfirmExportMsgLbl) then
        //     exit;

        // GenJnlImport.SetJournalTemplateBatch(rec."Journal Template Name", rec."Journal Batch Name");
        // TempBlob.CreateOutStream(OutStr);
        // GenJnlImport.SetDestination(OutStr);
        // GenJnlImport.Export();

        // TempBlob.CreateInStream(FileInstream);
        // FileName := 'GenFile.csv';
        // DownloadFromStream(FileInstream, 'Download', '', '', FileName);




        // Message('File Imported Successfully!');
    end;

}
