function scr_juice_name(arg0 = 0, arg1 = 0)
{
    if (arg0 >= 1)
        return stringsetloc("Mystic Nectar", "scr_juice_name_slash_scr_juice_name_gml_30_0");
    if (arg1 >= 1)
        return stringsetloc("Blood of Power", "scr_juice_name_slash_scr_juice_name_gml_35_0");
    if (arg0 == 0.75 && arg1 >= 0.25)
        return stringsetloc("Dragon's Scar", "scr_juice_name_slash_scr_juice_name_gml_40_0");
    if (arg0 == 0.5 && arg1 >= 0.5)
        return stringsetloc("Try This It's Orange Juice", "scr_juice_name_slash_scr_juice_name_gml_45_0");
    if (arg0 == 0.25 && arg1 >= 0.75)
        return stringsetloc("Sunset Requiem", "scr_juice_name_slash_scr_juice_name_gml_50_0");
    return stringsetloc("Bepis Brew", "scr_juice_name_slash_scr_juice_name_gml_53_0");
}
