pageextension 50104 PurchaseOrderSubformPE extends "Purchase Order Subform"
{

    layout
    {
        addbefore("No.")
        {
            field("OriginQuoteNo"; Rec."OriginQuoteNo")
            {
                Caption = 'Origin Quote Number';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
        }
    }
}