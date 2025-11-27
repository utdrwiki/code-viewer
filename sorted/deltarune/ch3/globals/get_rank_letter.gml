function scr_get_rank_letter(arg0, arg1 = false)
{
    var rank_index = scr_flag_get(arg0);
    var rank_list = [stringsetloc("Z", "scr_get_rank_letter_slash_scr_get_rank_letter_gml_5_5"), stringsetloc("C", "scr_get_rank_letter_slash_scr_get_rank_letter_gml_5_4"), stringsetloc("B", "scr_get_rank_letter_slash_scr_get_rank_letter_gml_5_3"), stringsetloc("A", "scr_get_rank_letter_slash_scr_get_rank_letter_gml_5_2"), stringsetloc("S", "scr_get_rank_letter_slash_scr_get_rank_letter_gml_5_1"), stringsetloc("T", "scr_get_rank_letter_slash_scr_get_rank_letter_gml_5_0")];
    if (arg1)
        rank_list = ["Z", "C", "B", "A", "S", "T"];
    return rank_list[rank_index];
}
