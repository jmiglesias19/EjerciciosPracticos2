report 50100 RHCorporativePurchaseOrder
{
    Caption = 'RH Coporative Purchase Order';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/RHCorporativePurchaseOrder.rdl';

    Permissions = tabledata Vendor = r,
    tabledata "Purchase Header" = r,
    tabledata "Company Information" = r;

    dataset
    {
        /* -----------------------------------------------------------------------------HEADER----------------------------------------------------------------------------------- */
        dataitem(PurchaseHeader; "Purchase Header")
        {
            column(LogoImage; CompanyInformation.Picture) { }
            column(Addres; CompanyInformation.Address) { }
            column(Address2; CompanyInformation."Address 2") { }
            column(City; CompanyInformation.City) { }
            column(City2; CompanyInformation.City2) { }
            column(PostCode; CompanyInformation."Post Code") { }
            column(PhoneNo; CompanyInformation."Phone No.") { }
            column(PhoneNo2; CompanyInformation."Phone No. 2") { }
            column(CIF; CompanyInformation."VAT Registration No.") { }
            column(Email; CompanyInformation."E-Mail") { }
            column(Web; CompanyInformation."Home Page") { }

            column(PONumber; "No.") { }

            column(OffFacCaption; OffFacLbl) { }
            column(OfficeCaption; OfficeLbl) { }
            column(FactoryCaption; FactoryLbl) { }
            column(CIFCaption; CIFLbl) { }
        }
    }

    var
        CompanyInformation: Record "Company Information";
        OffFacLbl: Label 'OFFICE/FACTORY';
        OfficeLbl: Label 'OFFDICE Tel.';
        FactoryLbl: Label 'FACTORY Tel.';
        CIFLbl: Label 'CIF';

    trigger OnPreReport()
    begin
        CompanyInformation.Get();
    end;
}