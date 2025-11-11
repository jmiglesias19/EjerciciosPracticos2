tableextension 50100 UserSetupTE extends "User Setup"
{
    fields
    {
        field(50100; CopyQuoteToPurchaseOrder; Boolean)
        {
            AllowInCustomizations = Always;
            Caption = 'Copy Quote To Purchase Order';
            DataClassification = ToBeClassified;
            ToolTip = 'Specifies if the user can copy quotes to purchase order.';
        }
    }

}