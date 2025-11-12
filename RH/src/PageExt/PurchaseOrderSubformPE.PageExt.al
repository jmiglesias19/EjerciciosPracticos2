pageextension 50104 PurchaseOrderSubformPE extends "Purchase Order Subform"
{

    layout
    {
        addbefore("No.")
        {
            field("OriginQuoteNo"; PHRec."Quote No.")
            {
                Caption = 'Origin Quote Number';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
        }
    }

    var
        PHRec: Record "Purchase Header";
        PurchHeaderGetter: Codeunit Getter;

    trigger OnAfterGetRecord()
    begin
        if (PHRec."No." <> Rec."Document No.") or (PHRec."Document Type" <> Rec."Document Type") then
            if Rec."Document Type" = Rec."Document Type"::Order then
                // PHRec.Get(Rec."Document Type", Rec."Document No.");
                PurchHeaderGetter.GetPurchaseHeader(Rec."Document Type", Rec."Document No.", PHRec)
    end;
    //mover a codeunit por tema de permisos del tabledata Purchase Header
}