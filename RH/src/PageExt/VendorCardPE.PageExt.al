pageextension 50102 VendorCardPE extends "Vendor Card"
{
    actions
    {
        addbefore("Ledger E&ntries")
        {
            action(OfferedLines)
            {
                Caption = 'Offered Lines';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = true;
                Image = WageLines;
                ToolTip = 'Specifies the offered lines page.';
                RunObject = page OfferedLines;
                RunPageLink = "Buy-from Vendor No." = field("No.");

            }
        }
    }
}