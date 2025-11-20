pageextension 50107 ItemCardPE extends "Item Card"
{
    layout
    {
        addfirst(content)
        {
            group(ProductiveProcess)
            {
                Caption = 'Productive Process';
                field(ProductiveProcessCode; Rec.ProductiveProcessCode)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}