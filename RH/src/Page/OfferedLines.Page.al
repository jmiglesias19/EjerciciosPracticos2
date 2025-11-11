page 50100 OfferedLines
{
    Caption = 'Offered Lines';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Purchase Header";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                Caption = 'Group name';
                field(PurchaseNo; Rec."No.")
                {

                }
                field(BuyFromVendorNo; Rec."Buy-from Vendor No.")
                {

                }
                field(BuyFromVendorName; Rec."Buy-from Vendor Name")
                {

                }
                field(VendorAuthorizationNo; Rec."Vendor Authorization No.")
                {

                }
                field(LocationCode; Rec."Location Code")
                {

                }
                field("AssignedUserID"; Rec."Assigned User ID")
                {

                }
            }
        }
    }
}