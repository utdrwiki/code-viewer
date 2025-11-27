function scr_get_high_score_text(arg0, arg1, arg2)
{
    scr_speaker("no_name");
    msgsetloc(0, "* (No high scores recorded^1! Give it a shot!)/%", "scr_get_high_score_text_slash_scr_get_high_score_text_gml_5_0");
    if (scr_flag_get(arg0) > 0 && arg2 == "")
    {
        scr_speaker("no_name");
        msgsetsubloc(0, "* (Your highest score is ~1!)/", string(global.flag[arg0]), "scr_get_high_score_text_slash_scr_get_high_score_text_gml_10_0");
        msgnextsubloc("* (Your highest rank is ~1!)/%", scr_get_rank_letter(arg1), "scr_get_high_score_text_slash_scr_get_high_score_text_gml_11_0");
    }
    if (scr_flag_get(arg0) > 0 && arg2 != "")
    {
        scr_speaker("no_name");
        msgsetsubloc(0, "* (Your highest score is ~1!)/", string(global.flag[arg0]), "scr_get_high_score_text_slash_scr_get_high_score_text_gml_16_0");
        msgnextsubloc("* (Your highest rank is ~1!)/", scr_get_rank_letter(arg1), "scr_get_high_score_text_slash_scr_get_high_score_text_gml_17_0");
        msgnextsubloc("* (Your clear time is ~1!)/%", arg2, "scr_get_high_score_text_slash_scr_get_high_score_text_gml_18_0");
    }
}
