pageextension 50101 VendorListPE extends "Vendor List"
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
                PromotedCategory = Category5;
                PromotedIsBig = true;
                Image = WageLines;
                ToolTip = 'Specifies the offered lines page.';
                RunObject = page OfferedLines;
                RunPageLink = "Buy-from Vendor No." = field("No.");

            }
        }
    }

}