tableextension 50101 PurchaseHeaderTE extends "Purchase Header"
{
    fields
    {
        modify("No.")
        {
            ToolTip = 'Specifies the purchase number.';
        }

        modify("Buy-from Vendor No.")
        {
            ToolTip = 'Specifies the vendor number.';
        }
        modify("Buy-from Vendor Name")
        {
            ToolTip = 'Specifies the vendor name.';
        }
        modify("Vendor Authorization No.")
        {
            ToolTip = 'Specifies the vendor authorization number.';
        }
        modify("Location Code")
        {
            ToolTip = 'Specifies the location code.';
        }
        modify("Assigned User ID")
        {
            ToolTip = 'Specifies the assigned user ID.';
        }
    }


}