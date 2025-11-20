table 50100 ProductiveProcess
{
    Caption = 'Productive Process';
    DataClassification = ToBeClassified;
    LookupPageId = XXCodePage;
    DrillDownPageId = XXCodePage;

    fields
    {
        field(1; XXCode; Code[2])
        {
            Caption = 'XX Code';
            NotBlank = true;
            ToolTip = 'Specifies XX Code.';
        }

        field(2; Description; Text[50])
        {
            AllowInCustomizations = Always;
            Caption = 'Description';
            ToolTip = 'Specifies XX Code Description.';
        }

        field(3; YYY4Digits; Boolean)
        {
            AllowInCustomizations = Always;
            Caption = 'YYY with 4 digits';
            ToolTip = 'Specifies if YYY have 4 digits.';
        }
    }

    keys
    {
        key(Key1; XXCode)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; XXCode, Description) { }
        fieldgroup(DropDown; XXCode, Description) { }
    }

}