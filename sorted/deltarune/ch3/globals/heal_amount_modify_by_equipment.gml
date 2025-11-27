function scr_heal_amount_modify_by_equipment(arg0)
{
    var ___healAmount = arg0;
    var ___healAdd = 0;
    if (global.chararmor1[global.char[caster]] == 26)
        ___healAdd += ceil(___healAmount / 8);
    if (global.chararmor2[global.char[caster]] == 26)
        ___healAdd += ceil(___healAmount / 8);
    return ___healAmount + ___healAdd;
}
