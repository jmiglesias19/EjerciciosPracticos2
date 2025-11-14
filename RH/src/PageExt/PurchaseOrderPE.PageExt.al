pageextension 50105 PurchaseOrderPE extends "Purchase Order"
{
    layout
    {
        addafter("Buy-from City")
        {
            field("Buy-from City 2"; Rec."Buy-from City 2")
            {
                ApplicationArea = All;
            }
        }
    }
}