function scr_tenna_alt_plot()
{
    var any_lost = scr_flag_get(1248) > 0;
    var recruited_shadow_guys = scr_flag_get(654) == 1;
    var recruited_pippins = scr_flag_get(659) == 1;
    return any_lost || (!recruited_shadow_guys || !recruited_pippins);
}
