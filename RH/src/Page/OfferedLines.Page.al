page 50100 OfferedLines
{
    Caption = 'Offered Lines';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Purchase Line";
    SourceTableView = where("Document Type" = const(Quote), Combined = const(false));
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

    actions
    {
        area(Processing)
        {

            action(CreatePurchaseOrder)
            {
                Caption = 'Create Purchase Order';
                ToolTip = 'Action to create a purchase order.';
                Image = CreateLinesFromTimesheet;

                Scope = Page;

                trigger OnAction()
                var
                    QuoteCombiner: Codeunit CombineQuotes;
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    QuoteCombiner.CombineSelectedLines(Rec);
                end;
            }
        }

    }
}