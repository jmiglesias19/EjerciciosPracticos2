codeunit 50102 Getter
{
    Permissions = tabledata "Purchase Header" = r;

    procedure GetPurchaseHeader(DocType: Enum "Purchase Document Type"; DocNo: Code[20]; var PHRec: Record "Purchase Header")
    begin
        if PHRec.Get(DocType, DocNo) then
            exit
        else
            Clear(PHRec);
    end;
}