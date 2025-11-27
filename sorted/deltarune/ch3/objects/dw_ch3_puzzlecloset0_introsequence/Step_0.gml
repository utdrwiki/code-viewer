if (con == 0)
{
    con = -1;
    global.interact = 1;
    global.facing = 1;
    obj_puzzlecloset_manager.camcontrol = false;
    with (obj_fadein)
        instance_destroy();
    with (scr_marker_ext(0, 0, spr_pxwhite, room_width, room_height, undefined, undefined, c_black, 100, undefined, undefined, 3))
        scr_lerpvar("image_alpha", 1.1, 0, 120);
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_pannable(1);
    c_pan(121, 0, 1);
    c_sel(kr);
    c_setxy(422, 298);
    c_facing("r");
    c_sel(su);
    c_setxy(368, 282);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_sel(ra);
    c_setxy(324, 286);
    c_facing("r");
    c_wait(80);
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_speaker("susie");
    c_msgsetloc(0, "* Where the heck is this...?/", "obj_dw_ch3_puzzlecloset0_introsequence_slash_Step_0_gml_34_0");
    c_msgnextloc("* It's kinda cold in here../%", "obj_dw_ch3_puzzlecloset0_introsequence_slash_Step_0_gml_35_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_confused_right);
    c_setxy(368, 286);
    c_wait_talk();
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw);
    c_setxy(368, 282);
    c_wait(1);
    c_var_instance(id, "con", 99);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 99 && !i_ex(cutscene_master))
{
    global.flag[1123] = 1;
    with (obj_caterpillarchara)
        scr_caterpillar_interpolate();
    obj_mainchara.cutscene = 0;
    global.interact = 0;
    con++;
}
if (snd_is_playing(music))
{
    vmin = 422;
    vmax = 1042;
    newamount = ((obj_mainchara.x - vmin) / (vmax - vmin)) * 0.7;
    var waszero = 0;
    if (amount == 0)
        waszero = true;
    if (amount < newamount)
        amount = newamount;
    if (waszero && amount > 0)
        audio_sound_set_track_position(music, 0);
    volume = clamp(amount, 0, 0.7);
    mus_volume(music, volume, 0);
}
