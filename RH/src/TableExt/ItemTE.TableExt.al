tableextension 50105 ItemTE extends Item
{
    fields
    {
        field(50100; "ProductiveProcessCode"; Code[2])
        {
            Caption = 'Productive Process Code';
            TableRelation = ProductiveProcess;
            ToolTip = 'Specifies nose.';

            trigger OnValidate()
            begin
                if Rec."ProductiveProcessCode" <> xRec."ProductiveProcessCode" then
                    Rec."CodeForProductiveProcess" := 0;
            end;
        }

        field(50101; "CodeForProductiveProcess"; Integer)
        {
            Caption = 'Code for Productive Process';

            trigger OnValidate()
            var
                ProductiveProcessRec: Record ProductiveProcess;
                ItemRec: Record Item;
            begin
                if Rec."CodeForProductiveProcess" = 0 then
                    exit;

                Rec.TestField("ProductiveProcessCode");
                ProductiveProcessRec.Get(Rec."ProductiveProcessCode");

                if ProductiveProcessRec."YYY4Digits" then begin
                    if Rec."CodeForProductiveProcess" > 9999 then
                        Error('El valor no puede tener más de 4 dígitos (Máximo 9999).');
                end else
                    if Rec."CodeForProductiveProcess" > 999 then
                        Error('El valor no puede tener más de 3 dígitos (Máximo 999).');

                ItemRec.SetRange("ProductiveProcessCode", Rec."ProductiveProcessCode");
                ItemRec.SetRange("CodeForProductiveProcess", Rec."CodeForProductiveProcess");
                ItemRec.SetFilter("No.", '<>%1', Rec."No.");

                if not ItemRec.IsEmpty then
                    Error('Este código numérico ya está asignado a otro producto (%1) para este proceso.', ItemRec."No.");
            end;
        }

        // Modificación del campo estándar
        modify("Item Category Code")
        {
            trigger OnAfterValidate()
            var
                ItemCategory: Record "Item Category";
            begin
                if ItemCategory.Get(Rec."Item Category Code") then
                    Rec.Validate("ProductiveProcessCode", ItemCategory."ProductiveProcessCode");
            end;
        }
    }
}