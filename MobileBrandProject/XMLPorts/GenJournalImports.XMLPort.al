xmlport 51103 IBBGenJournalImports
{
    Caption = 'Import';
    Direction = Import;
    // TextEncoding = UTF16;
    Format = VariableText;
    // FieldDelimiter = '"';
    FieldSeparator = ',';


    schema
    {
        textelement(Root)
        {
            tableelement(GenJnlLine; "Gen. Journal Line")
            {
                XmlName = 'GenJournalLine';


                fieldattribute(TemplateName; GenJnlLine."Journal Template Name")
                {

                }
                fieldattribute(BatchName; GenJnlLine."Journal Batch Name")
                {

                }
                fieldattribute(LineNo; GenJnlLine."Line No.")
                {

                }
                fieldelement(PostingDate; GenJnlLine."Posting Date")
                {

                }
                fieldelement(DocumentDate; GenJnlLine."Document Date")
                {

                }
                fieldelement(DocumentType; GenJnlLine."Document Type")
                {

                }
                fieldelement(DocumentNo; GenJnlLine."Document No.")
                {

                }
                fieldelement("IncomingDocumentEntryNo"; GenJnlLine."Incoming Document Entry No.")
                {

                }
                fieldelement(ExternalDocumentNo; GenJnlLine."External Document No.")
                {

                }
                fieldelement(AppliesToExtDocNo; GenJnlLine."Applies-to Ext. Doc. No.")
                {

                }

                fieldelement(AccountType; GenJnlLine."Account Type")
                {
                    // FieldValidate = Yes;
                }
                fieldelement(AccountNo; GenJnlLine."Account No.")
                {
                    // FieldValidate = Yes;

                }

                fieldelement(Description; GenJnlLine."Description")
                {


                }
                fieldelement(PayerInformation; GenJnlLine."Payer Information")
                {

                }
                fieldelement(TransactionInformation; GenJnlLine."Transaction Information")
                {

                }
                fieldelement(BusinessUnitCode; GenJnlLine."Business Unit Code")
                {

                }
                fieldelement(SalespersPurchCode; GenJnlLine."Salespers./Purch. Code")
                {


                }
                fieldelement(CampaignNo; GenJnlLine."Campaign No.")
                {

                }

                fieldelement(CurrencyCode; GenJnlLine."Currency Code")
                {


                }


                fieldelement(GenPostingType; GenJnlLine."Gen. Posting Type")
                {


                }
                fieldelement(GenBusPostingGroup; GenJnlLine."Gen. Bus. Posting Group")
                {


                }
                fieldelement(GenProdPostingGroup; GenJnlLine."Gen. Prod. Posting Group")
                {


                }
                fieldelement(VATBusPostingGroup; GenJnlLine."VAT Bus. Posting Group")
                {

                }
                fieldelement(VATProdPostingGroup; GenJnlLine."VAT Prod. Posting Group")
                {

                }
                fieldelement(TaxLiable; GenJnlLine."Tax Liable")
                {


                }
                fieldelement(TaxAreaCode; GenJnlLine."Tax Area Code")
                {


                }
                fieldelement(TaxGroupCode; GenJnlLine."Tax Group Code")
                {


                }
                fieldelement(UseTax; GenJnlLine."Use Tax")
                {

                }
                fieldelement(Quantity; GenJnlLine.Quantity)
                {

                }

                fieldelement(Amount; GenJnlLine.Amount)
                {
                    // FieldValidate = Yes;

                }
                fieldelement(DebitAmount; GenJnlLine."Debit Amount")
                {

                }
                fieldelement(CreditAmount; GenJnlLine."Credit Amount")
                {

                }
                fieldelement(VATAmount; GenJnlLine."VAT Amount")
                {

                }
                fieldelement(VATDifference; GenJnlLine."VAT Difference")
                {

                }
                fieldelement(BalVATAmount; GenJnlLine."Bal. VAT Amount")
                {

                }
                fieldelement(BalVATDifference; GenJnlLine."Bal. VAT Difference")
                {

                }
                fieldelement(BalAccountType; GenJnlLine."Bal. Account Type")
                {

                    // FieldValidate = Yes;
                }
                fieldelement(BalAccountNo; GenJnlLine."Bal. Account No.")
                {

                    // FieldValidate = Yes;
                }

                fieldelement(BalGenPostingType; GenJnlLine."Bal. Gen. Posting Type")
                {


                }
                fieldelement(BalGenBusPostingGroup; GenJnlLine."Bal. Gen. Bus. Posting Group")
                {


                }
                fieldelement(BalGenProdPostingGroup; GenJnlLine."Bal. Gen. Prod. Posting Group")
                {


                }
                fieldelement(DeferralCode; GenJnlLine."Deferral Code")
                {


                }
                fieldelement(JobQueueStatus; GenJnlLine."Job Queue Status")
                {

                }
                fieldelement(BalATBusPostingGroup; GenJnlLine."Bal. VAT Bus. Posting Group")
                {

                }
                fieldelement(BalVATProdPostingGroup; GenJnlLine."Bal. VAT Prod. Posting Group")
                {

                }
                fieldelement(BillToPayToNo; GenJnlLine."Bill-to/Pay-to No.")
                {

                }
                fieldelement(ShipToOrderAddressCode; GenJnlLine."Ship-to/Order Address Code")
                {

                }
                fieldelement(PaymentTermsCode; GenJnlLine."Payment Terms Code")
                {

                }
                fieldelement(AppliedAutomatically; GenJnlLine."Applied Automatically")
                {

                }
                fieldelement(AppliesToDocType; GenJnlLine."Applies-to Doc. Type")
                {

                }
                fieldelement(AppliesToDocNo; GenJnlLine."Applies-to Doc. No.")
                {

                }
                fieldelement(AppliesToID; GenJnlLine."Applies-to ID")
                {

                }
                fieldelement(OnHold; GenJnlLine."On Hold")
                {

                }
                fieldelement(BankPaymentType; GenJnlLine."Bank Payment Type")
                {

                }
                fieldelement(ReasonCode; GenJnlLine."Reason Code")
                {
                    // FieldValidate = Yes;
                }

                fieldelement(Correction; GenJnlLine.Correction)
                {


                }
                fieldelement(Comment; GenJnlLine.Comment)
                {


                }
                fieldelement(DirectDebitMandateID; GenJnlLine."Direct Debit Mandate ID")
                {

                }
                fieldelement(ShortcutDimension1Code; GenJnlLine."Shortcut Dimension 1 Code")
                {

                    // FieldValidate = Yes;
                }
                fieldelement(ShortcutDimension2Code; GenJnlLine."Shortcut Dimension 2 Code")
                {
                    // FieldValidate = Yes;

                }
                fieldelement(ShortcutDimension3Code; GenJnlLine."SCC Shortcut Dimension 3 Code")
                {
                    // FieldValidate = Yes;

                }
                fieldelement(ShortcutDimension4Code; GenJnlLine."PC Shortcut Dimension 4 Code")
                {
                    // FieldValidate = Yes;

                }
                fieldelement(ShortcutDimension5Code; GenJnlLine."AC Shortcut Dimension 5 Code")
                {

                    // FieldValidate = Yes;
                }
                fieldelement(ShortcutDimension6Code; GenJnlLine."SPC Shortcut Dimension 6 Code")
                {

                    // FieldValidate = Yes;
                }
                fieldelement(ShortcutDimension7Code; GenJnlLine."IBB Shortcut Dimension 7 Code")
                {

                    // FieldValidate = Yes;
                }
                fieldelement(ShortcutDimension8Code; GenJnlLine."IBB Shortcut Dimension 8 Code")
                {

                    //     FieldValidate = Yes;
                }
                trigger OnBeforeInsertRecord()
                begin
                    LastLineNo += 10000;
                    GenJnlLine."Line No." := LastLineNo;
                    GenJnlLine."Journal Template Name" := JournalTemplate;
                    GenJnlLine."Journal Batch Name" := JournalBatch;
                end;

            }
        }
    }
    trigger OnPreXmlPort()
    begin
        GenJnlLine.Reset();
        GenJnlLine.SetRange("Journal Template Name", JournalTemplate);
        GenJnlLine.SetRange("Journal Batch Name", JournalBatch);
    end;

    var
        JournalTemplate: Code[10];
        JournalBatch: Code[10];
        LastLineNo: Integer;


    procedure SetJournalTemplateBatch(Template: Code[10]; Batch: Code[10])
    begin
        JournalTemplate := Template;
        JournalBatch := Batch;
    end;

}
