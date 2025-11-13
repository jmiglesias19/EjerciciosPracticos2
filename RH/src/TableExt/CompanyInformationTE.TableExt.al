tableextension 50104 CompanyInformationTE extends "Company Information"
{
    fields
    {
        field(50100; City2; Text[50])
        {
            Caption = 'City 2';
            DataClassification = CustomerContent;
            ToolTip = 'Specifies the city 2.';
        }

        modify("Phone No. 2")
        {
            ToolTip = 'Specifies the second phone number.';
        }
    }

}