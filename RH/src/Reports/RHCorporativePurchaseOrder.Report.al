report 50100 RHCorporativePurchaseOrder
{
    Caption = 'RH Coporative Purchase Order';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/Reports/RHCorporativePurchaseOrder.rdl';

    Permissions = tabledata "Purchase Header" = r,
                  tabledata "Company Information" = r,
                  tabledata "Purchase Line" = r,
                  tabledata Vendor = r;

    dataset
    {
        /* -----------------------------------------------------------------------------HEADER----------------------------------------------------------------------------------- */
        dataitem(PurchaseHeader; "Purchase Header")
        {
            /* COMPANY INFORMATION */
            column(LogoImage; CompanyInformationRec.Picture) { }
            column(Addres; CompanyInformationRec.Address) { }
            column(Address2; CompanyInformationRec."Address 2") { }
            column(City; CompanyInformationRec.City) { }
            column(City2; CompanyInformationRec.City2) { }
            column(PostCode; CompanyInformationRec."Post Code") { }
            column(PhoneNo; CompanyInformationRec."Phone No.") { }
            column(PhoneNo2; CompanyInformationRec."Phone No. 2") { }
            column(CIF; CompanyInformationRec."VAT Registration No.") { }
            column(Email; CompanyInformationRec."E-Mail") { }
            column(Web; CompanyInformationRec."Home Page") { }
            column(CompanyRegister; CompanyInformationRec.CompanyRegister) { }

            /* PURCHASE HEADER */
            column(PONumber; "No.") { }
            column(OrderDate; "Order Date") { }
            column(Reference; "Your Reference") { }
            column(TransportMethod; "Transport Method") { }
            column(PaymentMethod; "Payment Terms Code") { }
            column(InvoiceDiscountCalculation; "Invoice Discount Calculation") { }
            column(BuyFromVendor; "Buy-from Vendor No.") { }
            column(BuyFromVendorName; "Buy-from Vendor Name") { }
            column(BuyFromAddress; "Buy-from Address") { }
            column(BuyFromPostCode; "Buy-from Post Code") { }
            column(BuyFromCity; "Buy-from City") { }
            column(BuyFromCity2; "Buy-from City 2") { }
            column(VendorPhoneNo; VendorRec."Phone No.") { }
            column(VendorFax; VendorRec."Fax No.") { }
            column(VendorCIF; VendorRec."VAT Registration No.") { }
            column(VendorEmail; VendorRec."E-Mail") { }

            column(FreightAmount; FreightAmount) { }
            column(PackagingAmount; PackagingAmount) { }
            column(PaymentDiscountPct; "Payment Discount %") { }
            column(PPAmount; PPAmount) { }




            /* LABELS */
            column(OffFacCaption; OffFacLbl) { }
            column(OfficeCaption; OfficeLbl) { }
            column(FactoryCaption; FactoryLbl) { }
            column(CIFCaption; CIFLbl) { }
            column(PONoCaption; PONoLbl) { }
            column(OrderDateCaption; OrderDateLbl) { }
            column(ReferenceCaption; ReferenceLbl) { }
            column(TransportCaption; TransportLbl) { }
            column(PmntMethodCaption; PmntMethodLbl) { }
            column(BuyFromPhoneCaption; BuyFromPhoneLbl) { }
            column(BuyFromFaxCaption; BuyFromFaxLbl) { }
            column(BuyFromCifCaption; BuyFromCifLbl) { }
            column(BuyFromEmailCaption; BuyFromEmailLbl) { }

            column(CodeCaption; CodeLbl) { }
            column(DescriptionCaption; DescriptionLbl) { }
            column(RAEECaption; RAEELbl) { }
            column(QtyCaption; QtyLbl) { }
            column(UECaption; UELbl) { }
            column(PriceCaption; PriceLbl) { }
            column(DiscountCaption; DiscountLbl) { }
            column(AmountCaption; AmountLbl) { }
            column(RateCaption; RateLbl) { }
            column(FreightCaption; FreightLbl) { }
            column(PackagingCaption; PackagingLbl) { }
            column(DtoPPCaption; DtoPPLbl) { }
            column(AmountPPCaption; AmountPPLbl) { }
            column(AmountRAEECaption; AmountRAEELbl) { }
            column(RecFinCaption; RecFinLbl) { }
            column(AmountRFCaption; AmountRFLbl) { }
            column(TaxBaseCaption; TaxBaseLbl) { }
            column(IVACaption; IVALbl) { }
            column(IVAmountCaption; IVAmountLbl) { }
            column(REPctCaption; REPctLbl) { }
            column(REAmountCaption; REAmountLbl) { }
            column(NetAmountCaption; NetAmountLbl) { }
            column(OrderTotalCaption; OrderTotalLbl) { }
            column(ObsvCaption; ObsvLbl) { }
            column(DeliveryCaption; DeliveryLbl) { }


            /* --------------------------------------------------------------------BODY------------------------------------------------------------------------ */
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = field("No.");

                column(UnitMeasureCode; "Unit of Measure Code") { }
                column(DirectUnitCost; "Direct Unit Cost") { }
                column(LineDiscountPct; "Inv. Discount Amount") { }
                column(LineAmountExclVAT; "Line Amount") { }
                column(LineNo; "Line No.") { }
                column(ItemNo; "No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(UE; "Unit of Measure Code") { }
                column(RAEEAmount; RAEE) { }

                trigger OnAfterGetRecord()
                begin
                    // Comprobamos si la línea es un Cargo (prod.)
                    if Type = Type::"Charge (Item)" then begin

                        // 1. Lógica de Portes (usando tu código 'C-FLETE')
                        if "No." = 'C-FLETE' then begin
                            FreightAmount += "Line Amount";
                            CurrReport.Skip(); // Oculta esta línea de la tabla principal
                        end;

                        // 2. Lógica de Embalajes (usando 'EMBALAJE' como ejemplo)
                        // (Recuerda crear este código en "Item Charges")
                        if "No." = 'EMBALAJE' then begin
                            PackagingAmount += "Line Amount";
                            CurrReport.Skip(); // Oculta esta línea
                        end;
                    end;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if VendorRec.Get("Buy-from Vendor No.") then;

                CalcFields(Amount);
                PPAmount := Amount * "Payment Discount %" / 100;

                FreightAmount := 0;
                PackagingAmount := 0;
            end;

        }
    }

    var
        CompanyInformationRec: Record "Company Information";
        VendorRec: Record Vendor;

        PPAmount: Decimal;

        OffFacLbl: Label 'OFFICE/FACTORY';
        OfficeLbl: Label 'OFFICE Tel.';
        FactoryLbl: Label 'FACTORY Tel.';
        CIFLbl: Label 'CIF';
        PONoLbl: Label 'PURCHASE ORDER Nº ';
        OrderDateLbl: Label 'Order Date: ';
        ReferenceLbl: Label 'Reference: ';
        TransportLbl: Label 'Transport: ';
        PmntMethodLbl: Label 'P. Method: ';
        BuyFromPhoneLbl: Label 'Phone.: ';
        BuyFromFaxLbl: Label 'Fax.: ';
        BuyFromCifLbl: Label 'CIF: ';
        BuyFromEmailLbl: Label 'E-mail: ';

        CodeLbl: Label 'Code';
        DescriptionLbl: Label 'Description';
        RAEELbl: Label 'RAEE(*)';
        QtyLbl: Label 'Quantity';
        UELbl: Label 'UE';
        PriceLbl: Label 'Price';
        DiscountLbl: Label 'Discounts';
        AmountLbl: Label 'Amount';

        RateLbl: Label '(*) Unit rate';

        FreightLbl: Label 'Freight:';
        FreightAmount: Decimal;
        PackagingLbl: Label 'Packaging:';
        PackagingAmount: Decimal;

        DtoPPLbl: Label '% Dto.P.P.:';
        AmountPPLbl: Label 'Amount P.P.:';
        AmountRAEELbl: Label 'Amount P.P.:';
        RecFinLbl: Label '% Res.Finan.:';
        AmountRFLbl: Label 'Amount R.F.:';
        TaxBaseLbl: Label 'Tax  Base';
        IVALbl: Label '% IVA';
        IVAmountLbl: Label 'IVA Amount';
        REPctLbl: Label '% R.E.';
        REAmountLbl: Label 'Amount R.E.';
        NetAmountLbl: Label 'NET AMOUNT';
        OrderTotalLbl: Label 'ORDER TOTAL';
        ObsvLbl: Label 'OBSERVATIONS';
        DeliveryLbl: Label 'Delivery address for goods:';


    trigger OnPreReport()
    begin
        if CompanyInformationRec.Get() then
            CompanyInformationRec.CalcFields(Picture);
    end;
}