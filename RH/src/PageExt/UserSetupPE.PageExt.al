pageextension 50100 UserSetupPE extends "User Setup"
{
    layout
    {
        addafter(PhoneNo)
        {
            field(CopyQuoteToPurchaseOrder; Rec.CopyQuoteToPurchaseOrder)
            {
                ApplicationArea = all;
            }
        }
    }

}