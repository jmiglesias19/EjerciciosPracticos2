pageextension 50103 CompanyInformationPE extends "Company Information"
{
    layout
    {
        addafter(City)
        {
            field(City2; Rec.City2)
            {
                ApplicationArea = All;
                Caption = 'City 2';
            }

        }

        addafter("Phone No.")
        {
            field("Phone No. 2"; Rec."Phone No. 2")
            {
                ApplicationArea = All;
                Caption = 'Phone No. 2';
            }
        }
    }

}