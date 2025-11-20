page 50101 XXCodePage
{
    Caption = 'XX Code Page';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = ProductiveProcess;

    layout
    {
        area(Content)
        {
            repeater(XXCode)
            {
                Caption = 'XX Code';
                field(Code; Rec.XXCode)
                {

                }
                field(Description; Rec.Description)
                {

                }
                field(YYY4Digits; Rec.YYY4Digits)
                {

                }
            }
        }
    }
}