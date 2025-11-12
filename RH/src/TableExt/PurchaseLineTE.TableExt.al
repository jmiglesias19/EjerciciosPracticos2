tableextension 50101 PurchaseLineTE extends "Purchase Line"
{
    fields
    {
        modify("Buy-from Vendor No.")
        {
            ToolTip = 'Specifies the vendor number.';
        }

        modify("Buy-from Vendor Name")
        {
            ToolTip = 'Specifies the vendor name.';
        }

        modify("Document No.")
        {
            ToolTip = 'Specifies the document number.';
        }

        modify(Type)
        {
            ToolTip = 'Specifies the type.';
        }

        modify("No.")
        {
            ToolTip = 'Specifies the purchase number.';
        }

        modify(Description)
        {
            ToolTip = 'Specifies the description.';
        }
        modify(Quantity)
        {
            ToolTip = 'Specifies the quantity.';
        }
    }


}