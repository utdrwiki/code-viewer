if (kris_spin_active)
{
    spin_timer_kris++;
    if ((spin_timer_kris % 6) == 1)
    {
        spin_index = scr_wrap_new(spin_index + 1, 0, 3);
        var kris_index = spin_index;
        with (obj_mainchara)
        {
            fun = 1;
            if (kris_index == 0)
                sprite_index = dsprite;
            else if (kris_index == 1)
                sprite_index = rsprite;
            else if (kris_index == 2)
                sprite_index = usprite;
            else if (kris_index == 3)
                sprite_index = lsprite;
        }
    }
}
if (con < 0)
    exit;
if (con == 20 && !d_ex() && global.interact == 0)
{
    con = 21;
    global.interact = 1;
    scr_speaker("lancer");
    msgsetloc(0, "\\E3* Oooh^1, carry me^1! Carry me!/%", "obj_dw_ch3_lancer_spin_slash_Step_0_gml_41_0");
    var d = d_make();
    d.stay = 5;
}
if (con == 21 && !d_ex())
{
    con = 22;
    lancer_visible = false;
    snd_play(snd_item);
    scr_speaker("no_name");
    msgsetloc(0, "* (You picked up LANCER into your LANCERs.)/%", "obj_dw_ch3_lancer_spin_slash_Step_0_gml_55_0");
    d_make();
}
if (con == 22 && !d_ex())
{
    con = 23;
    alarm[0] = 60;
}
if (con == 24)
{
    con = 25;
    scr_speaker("lancer");
    msgsetloc(0, "\\E3* Now^1, put me down^1! Put me down!/%", "obj_dw_ch3_lancer_spin_slash_Step_0_gml_70_0");
    var d = d_make();
    d.stay = 5;
}
if (con == 25 && !d_ex())
{
    con = 26;
    lancer_visible = true;
    snd_play(snd_item);
    scr_speaker("no_name");
    msgsetloc(0, "* (You dropped LANCER from your LANCERs.)/%", "obj_dw_ch3_lancer_spin_slash_Step_0_gml_84_0");
    d_make();
}
if (con == 26 && !d_ex())
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
}
