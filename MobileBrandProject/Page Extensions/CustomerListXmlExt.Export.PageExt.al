pageextension 51102 CustomerListXmlExt extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast(processing)
        {

            action(ImportToXml)
            {

                Caption = 'Import To Xml';
                ApplicationArea = All;
                ToolTip = 'Import Customer List To Xml File';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = XMLFile;

                trigger OnAction()

                var
                    CustomerXml: XmlPort CustomerImportXML;
                    TempBlob: Codeunit "Temp Blob";
                    InStr: InStream;
                    FileName: text;
                begin

                    TempBlob.CreateInStream(InStr);
                    CustomerXml.SetSource(InStr);


                    if file.UploadIntoStream('Upload XML File', '', '', FileName, InStr) then
                        CustomerXml.Import();
                    exit;

                end;
            }




            action(ExportToXml)
            {

                Caption = 'Export To Xml';
                ApplicationArea = All;
                ToolTip = 'Export Customer List To Xml File';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = XMLFile;

                trigger OnAction()

                var
                    CustomerXml: XmlPort CustomerExportXML;
                    TempBlob: Codeunit "Temp Blob";
                    OutStr: OutStream;
                    InStr: InStream;
                    FileName: text;
                    ConfirmExportMsgLbl: Label 'Do You Want To Export The File';
                begin

                    if not Confirm(ConfirmExportMsgLbl) then
                        exit;

                    TempBlob.CreateOutStream(OutStr);
                    CustomerXml.SetDestination(OutStr);
                    CustomerXml.Export();

                    TempBlob.CreateInStream(InStr);
                    FileName := 'Customers.xml';
                    DownloadFromStream(InStr, 'Download', '', '', FileName);

                end;
            }

        }
    }

    var
        myInt: Integer;
}