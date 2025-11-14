tableextension 50102 PurchaseHeaderTE extends "Purchase Header"
{

    fields
    {
        modify("Quote No.")
        {
            ToolTip = 'Specifies the quote number.';
        }

        field(50100; "Buy-from City 2"; Text[100])
        {
            AllowInCustomizations = Always;
            Caption = 'City 2';
            DataClassification = ToBeClassified;
            ToolTip = 'Specifies the second city of the vendor.';
        }
    }
}