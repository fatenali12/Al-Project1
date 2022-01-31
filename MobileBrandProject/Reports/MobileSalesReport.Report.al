report 51101 "Mobile Sales Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Mobile Sales Report';

    DefaultLayout = Word;
    WordLayout = 'MobileSalesReport.Report.docx';

    dataset
    {
        dataitem("Mobile Sale"; "Mobile Sale")
        {

            RequestFilterFields = "Mobile ID";
            column(Mobile_ID; "Mobile ID")
            {

            }

            column(Mobile_Name; "Mobile Name")
            {

            }

            column(Created_Date; format("Created Date", 0))
            {

            }

            column(MobileNoCaptionLbl; MobileNoCaptionLbl)
            {

            }
            column(MobileNameCaptionLbl; MobileNameCaptionLbl)
            {

            }
            column(CreateDateCaptionLbl; CreateDateCaptionLbl)
            {

            }
            column(CustomerNameCaptionLbl; CustomerNameCaptionLbl)
            {

            }
            column(MobileQuantityCaptionLbl; MobileQuantityCaptionLbl)
            {

            }
            column(MobileStatusCaptionLbl; MobileStatusCaptionLbl)
            {

            }
            column(MobileAmountCaptionLbl; MobileAmountCaptionLbl)
            {

            }

            column(AmountSum; AmountSum)
            {

            }


            dataitem("Mobile Sale Line"; "Mobile Sale Line")
            {
                // RequestFilterFields = "Mobile ID";
                DataItemLink = "Mobile ID" = field("Mobile ID");


                column(Customer_Name; "Customer Name")
                {

                }

                column(Quantity; Quantity)
                {

                }
                column(Mobile_Status; "Mobile Status")
                {

                }
                column(Mobile_Amount; "Mobile Amount")
                {

                }

                trigger OnAfterGetRecord()
                var
                    MobileSaleLines: Record "Mobile Sale Line";
                begin
                    MobileSaleLines.CopyFilters("Mobile Sale Line");
                    MobileSaleLines.SetRange("Mobile ID", "Mobile ID");
                    MobileSaleLines.CalcSums("Mobile Amount");
                    AmountSum := MobileSaleLines."Mobile Amount";


                end;


            }



        }
    }

    // requestpage
    // {
    //     layout
    //     {
    //         area(Content)
    //         {
    //             group(GroupName)
    //             {
    //                 field(Mobile_ID; MobileNoCaptionLbl)
    //                 {
    //                     ApplicationArea = All;

    //                 }
    //             }
    //         }
    //     }

    //     actions
    //     {
    //         area(processing)
    //         {
    //             action(ActionName)
    //             {
    //                 ApplicationArea = All;

    //             }
    //         }
    //     }
    // }

    var
        MobileNoCaptionLbl: Label 'Mobile No.';
        MobileNameCaptionLbl: Label 'Mobile Name';
        CustomerNameCaptionLbl: Label 'Customer Name';
        CreateDateCaptionLbl: Label 'Created Date';
        MobileQuantityCaptionLbl: Label 'Mobile Quantity';
        MobileStatusCaptionLbl: Label 'Mobile Status';
        MobileAmountCaptionLbl: Label 'Mobile Amount';

        AmountSum: Decimal;

}