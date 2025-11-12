page 50100 OfferedLines
{
    Caption = 'Offered Lines';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Purchase Line";
    SourceTableView = where("Document Type" = const(Quote));
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                Caption = 'Group name';

                field(VendorNo; Rec."Buy-from Vendor No.")
                {

                }
                field(VendorName; Rec."Buy-from Vendor Name")
                {

                }
                field(DocumentNo; Rec."Document No.")
                {
                    DrillDownPageId = "Purchase Quote";
                }
                field(Type; Rec.Type)
                {

                }
                field(LineNo; Rec."No.")
                {

                }
                field(Description; Rec.Description)
                {

                }
                field(Quantity; Rec."Quantity")
                {

                }
            }
        }
    }
}