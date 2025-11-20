pageextension 50106 ItemCategoriesPE extends "Item Categories"
{
    layout
    {
        addafter(Description)
        {
            field(ProductiveProcessCode; Rec.ProductiveProcessCode)
            {
                ApplicationArea = All;
            }
        }
    }
}