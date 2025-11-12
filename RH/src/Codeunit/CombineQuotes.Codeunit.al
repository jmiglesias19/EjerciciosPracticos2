codeunit 50101 CombineQuotes
{
    Permissions = tabledata "Purchase Line" = rmid,
    tabledata "Purchase Header" = rmid;

    var
        PageMgt: Codeunit "Page Management";
        DiffVendorsErr: Label 'Cannot combine lines from different vendors.';
        DiffCurrenciesErr: Label 'Cannot combine lines with different currencies.';
        FindPurQuoErr: Label 'Could not find Purchase Quote %1.', Comment = 'Could not find Purchase Quote %1';
        NoLinesErr: Label 'No lines have been selected.';
        ValidateLinesErr: Label 'Cannot validate an empty set of lines.';
        CreateHeaderErr: Label 'Cannot create header: No lines found.';


    procedure CombineSelectedLines(var SelectedLines: Record "Purchase Line")
    var
        NewPurchOrderHeader: Record "Purchase Header";
        SelectedLinesCount: Integer;
    begin
        if not SelectedLines.FindSet() then
            Error(NoLinesErr);

        SelectedLinesCount := SelectedLines.Count();
        ValidateLines(SelectedLines);

        ArchiveQuotes(SelectedLines);

        CreateNewOrderHeader(SelectedLines, NewPurchOrderHeader);
        CopyLinesToOrder(SelectedLines, NewPurchOrderHeader);

        Message('Purchase Order %1 has been created with %2 lines.', NewPurchOrderHeader."No.", SelectedLinesCount);
        PageMgt.PageRun(NewPurchOrderHeader);
    end;

    local procedure ValidateLines(var PurchLines: Record "Purchase Line")
    var
        FirstVendor: Code[20];
        FirstCurrency: Code[10];
    begin
        if not PurchLines.FindFirst() then
            Error(ValidateLinesErr);

        FirstVendor := PurchLines."Buy-from Vendor No.";
        FirstCurrency := PurchLines."Currency Code";

        repeat
            if (PurchLines."Buy-from Vendor No." <> FirstVendor) then
                Error(DiffVendorsErr);

            if (PurchLines."Currency Code" <> FirstCurrency) then
                Error(DiffCurrenciesErr);
        until PurchLines.Next() = 0;
    end;

    local procedure ArchiveQuotes(var PurchLines: Record "Purchase Line")
    var
        PurchHeader: Record "Purchase Header";
        ArchiveManagement: Codeunit "ArchiveManagement";
        UniqueQuoteNos: List of [Text[20]];
        QuoteNo: Text[20];
    begin
        if not PurchLines.FindSet() then
            exit;

        repeat
            if not UniqueQuoteNos.Contains(PurchLines."Document No.") then
                UniqueQuoteNos.Add(PurchLines."Document No.");
        until PurchLines.Next() = 0;

        foreach QuoteNo in UniqueQuoteNos do
            if PurchHeader.Get(PurchHeader."Document Type"::Quote, QuoteNo) then
                ArchiveManagement.ArchivePurchDocument(PurchHeader);
    end;

    local procedure CreateNewOrderHeader(var PurchLines: Record "Purchase Line"; var NewPurchOrderHeader: Record "Purchase Header")
    var
        PurchHeader: Record "Purchase Header";
    begin
        if not PurchLines.FindFirst() then
            Error(CreateHeaderErr);

        if not PurchHeader.Get(PurchHeader."Document Type"::Quote, PurchLines."Document No.") then
            Error(FindPurQuoErr, PurchLines."Document No.");

        NewPurchOrderHeader.Init();
        NewPurchOrderHeader.TransferFields(PurchHeader, true);
        NewPurchOrderHeader."Document Type" := NewPurchOrderHeader."Document Type"::Order;
        NewPurchOrderHeader."No." := '';
        NewPurchOrderHeader."Quote No." := '';
        NewPurchOrderHeader.Insert(true);
    end;

    local procedure CopyLinesToOrder(var PurchLines: Record "Purchase Line"; NewPurchOrderHeader: Record "Purchase Header")
    var
        NewPurchOrderLine: Record "Purchase Line";
        LineNo: Integer;
    begin
        LineNo := 10000;

        if not PurchLines.FindSet() then
            exit;

        repeat
            NewPurchOrderLine.Init();
            NewPurchOrderLine.TransferFields(PurchLines, true);
            NewPurchOrderLine."Document Type" := NewPurchOrderHeader."Document Type";
            NewPurchOrderLine."Document No." := NewPurchOrderHeader."No.";
            NewPurchOrderLine."Line No." := LineNo;
            NewPurchOrderLine.Insert(true);

            LineNo += 10000;

            PurchLines.Combined := true;
            PurchLines.Modify(true);

        until PurchLines.Next() = 0;
    end;
}