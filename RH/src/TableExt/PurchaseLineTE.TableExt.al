tableextension 50101 PurchaseLineTE extends "Purchase Line"
{
    fields
    {

        field(50100; Combined; Boolean)
        {
            AllowInCustomizations = Always;
            Caption = 'Combined';
            DataClassification = ToBeClassified;
            ToolTip = 'Specifies if the line has been combined in a Purchase Order.';
        }

        field(50101; OriginQuoteNo; Code[20])
        {
            AllowInCustomizations = Always;
            Caption = 'Origin Quote Number';
            DataClassification = CustomerContent;
            ToolTip = 'Specifies the original quote number.';
            Editable = false;
        }

        field(50102; RAEE; Decimal)
        {
            AllowInCustomizations = Always;
            Caption = 'RAEE';
            DataClassification = ToBeClassified;
            ToolTip = 'Specifies the RAEE value.';
        }

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