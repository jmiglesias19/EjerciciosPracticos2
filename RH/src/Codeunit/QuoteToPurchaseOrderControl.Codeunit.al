codeunit 50100 QuoteToPurchaseOrderControl
{

    Permissions = tabledata "User Setup" = r;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Quotes", OnBeforeActionEvent, MakeOrder, true, true)]
    local procedure QuotesToPurchaseOrderControl(var Rec: Record "Purchase Header")
    var
        USRec: Record "User Setup";
        ErrorLbl: Label 'This user do not have permission for copying purchase quotes to purchase orders. Please, check your user set up.';
    begin
        if USRec.Get(UserId()) then
            if not (USRec.CopyQuoteToPurchaseOrder) then
                Error(ErrorLbl);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Quote", OnBeforeActionEvent, MakeOrder, true, true)]
    local procedure QuoteToPurchaseOrderControl(var Rec: Record "Purchase Header")
    var
        USRec: Record "User Setup";
        ErrorLbl: Label 'This user do not have permission for copying purchase quotes to purchase orders. Please, check your user set up.';
    begin
        if USRec.Get(UserId()) then
            if not (USRec.CopyQuoteToPurchaseOrder) then
                Error(ErrorLbl);
    end;
}