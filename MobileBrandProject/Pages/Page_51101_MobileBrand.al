page 51101 "Mobile Brand"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Mobile Brand";
    Caption = 'Mobile Brand';
    CardPageId = 51109;

    layout
    {
        area(Content)
        {
            repeater("Mobile Brand Info")
            {
                field("Brand ID"; Rec."Brand ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Fill In With Brand ID. Should Be Unique ..';
                }

                field("Brand Name"; Rec."Brand Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Fill In With Brand Name';
                }
                field("Number Of Mobiles"; Rec."Number Of Mobiles")
                {
                    ApplicationArea = All;
                    ToolTip = 'Fill In With Number Of Mobiles';
                }

                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Created Date';
                }

                field("Last Modified Date"; rec."Last Modified Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Last Modified Date';
                }
            }
        }
    }





    actions
    {
        area(Processing)
        {
            action("Show Mobile List")
            {
                ApplicationArea = All;
                RunObject = page "Mobile List";
                RunPageLink = "Mobile Brand ID" = field("Brand ID");
                Image = ShowList;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                end;
            }



            action(ShowQuery)
            {
                ApplicationArea = All;
                Caption = 'Show Query';
                ToolTip = 'Show Query On Number Of Mobiles In Every Brand';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = ShowList;

                trigger OnAction()
                var
                    NumberOfMobileInEveryBrand: Query NumberOfMobilesInEveryBrand;
                    MobileName: text;

                begin

                    if NumberOfMobileInEveryBrand.Open() then begin
                        while NumberOfMobileInEveryBrand.Read() do begin
                            MobileName := NumberOfMobileInEveryBrand.Mobile_Name;

                            Message(MobileName);

                        end;
                        NumberOfMobileInEveryBrand.Close();

                    end;
                end;
            }


            action(DownLoadTOXMLFile)
            {
                ApplicationArea = All;
                Caption = 'Download Query To XML';
                ToolTip = 'Download Query To XML';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = ShowList;

                trigger OnAction()
                var


                begin
                    GetMobilesInEveryBrand();


                end;
            }

        }
    }


    procedure GetMobilesInEveryBrand()
    var
        MobileBrandQuery: Query MobileBrandQuery;
        TempBlob: Codeunit "Temp Blob";
        FileNotSavedMsg: Label 'The File Was Not Saved. The Problem Was %1';
        OutStr: OutStream;
        InStr: InStream;
        FileName: Text;
    begin

        TempBlob.CreateOutStream(OutStr);
        MobileBrandQuery.TopNumberOfRows(10);
        if not MobileBrandQuery.SaveAsCsv(OutStr) then
            Error(FileNotSavedMsg, GetLastErrorText());

        TempBlob.CreateInStream(InStr);
        FileName := 'Mobiles In Every Brand.csv';
        file.DownloadFromStream(InStr, 'DownLoad xml File', '', '', FileName);




    end;


    var
        myInt: Integer;


}

