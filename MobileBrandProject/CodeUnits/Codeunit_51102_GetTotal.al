codeunit 51102 Total
{

    TableNo = 51108;
    trigger OnRun()

    begin

        PurchaseQuantity := Rec.Quantity;
        PurchaseAmount := Rec."Mobile Amount";
        GetTotal(PurchaseQuantity, PurchaseAmount);
    end;

    procedure GetTotal(var PurchaseQuantity: Integer; PurchaseAmount: Decimal)
    var
        myInt: Integer;
        RecPurchase: Record "Mobile Purchase Line";
    begin
        PurTotal := PurchaseQuantity * PurchaseAmount;
        // RecPurchase.Total := PurTotal;
        Message('The Total is %1 ', PurTotal);

    end;

    var
        myInt: Integer;
        PurchaseQuantity: Integer;
        PurchaseAmount: Decimal;
        PurTotal: Decimal;





}