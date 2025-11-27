if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    global.facing = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_sel(kr);
    c_setxy(300, 180);
    c_facing("d");
    if (global.is_console)
        c_var_instance(id, "border_change", true);
    c_var_lerp_instance(whiteall, "image_alpha", 1, 0, 30);
    c_wait(45);
    c_snd_play(snd_escaped);
    c_wait(30);
    c_snd_play(snd_locker);
    c_wait(30);
    c_customfunc(function()
    {
        sidenoise = snd_play(snd_dtrans_twinkle);
        snd_volume(sidenoise, 0.3, 0);
        snd_pitch(sidenoise, 0.6 + random(0.6));
    });
    c_wait(30);
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 30);
    c_customfunc(function()
    {
        with (obj_border_controller)
            show_border();
    });
    c_wait(30);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 1 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
}
if (border_change)
{
    border_val = clamp(border_val + 0.04, 0, 1);
    var _val = border_val;
    with (obj_border_controller)
        overlay_color = merge_color(c_white, c_black, _val);
    if (border_val >= 1)
        border_change = false;
}
