tableextension 50103 ItemCategoryTE extends "Item Category"
{
    fields
    {
        field(50100; ProductiveProcessCode; Code[2])
        {
            AllowInCustomizations = Always;
            Caption = 'Productive Process';
            DataClassification = ToBeClassified;
            ToolTip = 'Specifies the productive process code.';
            TableRelation = ProductiveProcess;
        }
    }
}