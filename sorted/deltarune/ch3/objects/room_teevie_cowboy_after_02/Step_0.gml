if (con < 0)
    exit;
if (con == 1)
{
    con = 2;
    alarm[0] = 1;
}
if (con == 3)
{
    con = 4;
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            visible = 0;
    }
    ralsei_caterpillar = instance_create(0, 0, obj_caterpillar_generic);
    with (ralsei_caterpillar)
    {
        scr_darksize();
        rsprite = spr_ralsei_horse_walk_overworld;
        lsprite = spr_ralsei_horse_walk_overworld_left;
        halign = 2;
        valign = 36;
        allowup = false;
        allowdown = false;
        targetdist = 34;
    }
}
if (con == 4 && obj_mainchara.x >= 450 && global.interact == 0)
{
    con = 5;
    alarm[0] = 60;
    global.interact = 1;
    with (obj_mainchara)
    {
        cutscene = 1;
        fun = 1;
        image_index = 0;
    }
    var _ral_x = 0;
    var _ral_y = 0;
    with (obj_caterpillarchara)
    {
        cutscene = 1;
        fun = 1;
        image_index = 0;
    }
    with (ralsei_caterpillar)
    {
        _ral_x = x;
        _ral_y = y;
    }
    ralsei_marker = scr_dark_marker(_ral_x, _ral_y, spr_ralsei_horse_walk_overworld);
    with (ralsei_marker)
        scr_depth();
    with (ralsei_caterpillar)
        visible = 0;
}
if (con == 6)
{
    con = 7;
    alarm[0] = 30;
    with (obj_mainchara)
        sprite_index = lsprite;
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            sprite_index = lsprite;
    }
}
if (con == 8)
{
    con = 9;
    alarm[0] = 30;
    scr_speaker("susie");
    msgsetloc(0, "\\EK* .../", "obj_room_teevie_cowboy_after_02_slash_Step_0_gml_98_0");
    scr_anyface_next("ralsei", "D");
    msgnextloc("\\ED* O-oops.../", "obj_room_teevie_cowboy_after_02_slash_Step_0_gml_100_0");
    msgnextloc("\\EK* I forgot I was wearing it./%", "obj_room_teevie_cowboy_after_02_slash_Step_0_gml_101_0");
    d_make();
}
if (con == 10 && !d_ex())
{
    con = 11;
    alarm[0] = 15;
    with (ralsei_marker)
        scr_flip("x");
}
if (con == 12 && !d_ex())
{
    con = 13;
    alarm[0] = 60;
    with (ralsei_marker)
    {
        image_speed = 0.2;
        scr_lerpvar("x", x, -120, 60);
    }
}
if (con == 14)
{
    con = 15;
    alarm[0] = 60;
    var _ral_x = 0;
    var _ral_y = 0;
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
        {
            _ral_x = x;
            _ral_y = y;
        }
    }
    with (ralsei_caterpillar)
        instance_destroy();
    with (ralsei_marker)
    {
        scr_flip("x");
        sprite_index = spr_ralsei_walk_right;
        scr_lerpvar("x", x, _ral_x, 60);
        scr_lerpvar("y", y, _ral_y, 60);
        scr_delay_var("image_speed", 0, 61);
        scr_delay_var("image_index", 0, 61);
    }
}
if (con == 16)
{
    con = -1;
    global.facing = 0;
    global.interact = 0;
    scr_flag_set(1152, 1);
    with (obj_mainchara)
    {
        cutscene = 0;
        fun = 0;
    }
    with (ralsei_marker)
        visible = 0;
    with (obj_caterpillarchara)
    {
        fun = 0;
        cutscene = 0;
        if (name == "ralsei")
            visible = 1;
        scr_caterpillar_interpolate();
    }
    with (exit_collider)
        instance_destroy();
}
if (con == 30 && global.interact == 0)
{
    con = 31;
    alarm[0] = 30;
    global.interact = 1;
    with (obj_mainchara)
    {
        cutscene = 1;
        fun = 1;
        sprite_index = usprite;
        image_index = 0;
    }
    with (obj_caterpillarchara)
    {
        cutscene = 1;
        fun = 1;
        sprite_index = usprite;
        image_index = 0;
    }
    snd_play(snd_dooropen);
    with (wardrobe_npc)
        image_index = 1;
    scr_speaker("no_name");
    msgsetloc(0, "* (You slowly unlocked the door...!)/", "obj_room_teevie_cowboy_after_02_slash_Step_0_gml_223_0");
    msgnextloc("* (Inside the closet was a HORSE COSTUME and MINI-STABLE.)/%", "obj_room_teevie_cowboy_after_02_slash_Step_0_gml_224_0");
    d_make();
}
if (con == 32 && !d_ex())
{
    con = 33;
    alarm[0] = 30;
    snd_play(snd_shineselect);
}
if (con == 34)
{
    con = 35;
    alarm[0] = 30;
    scr_speaker("no_name");
    msgsetloc(0, "* (RALSEI RANCHER is now unlocked for your CASTLE TOWN!)/", "obj_room_teevie_cowboy_after_02_slash_Step_0_gml_244_0");
    scr_anyface_next("susie", "B");
    msgnextloc("\\EB* .../%", "obj_room_teevie_cowboy_after_02_slash_Step_0_gml_246_0");
    d_make();
}
if (con == 36 && !d_ex())
{
    con = 37;
    alarm[0] = 60;
    snd_play(snd_doorclose);
    scr_script_delayed(snd_play, 30, snd_noise);
    with (wardrobe_npc)
        image_index = 0;
}
if (con == 38)
{
    con = 39;
    alarm[0] = 30;
    scr_speaker("no_name");
    msgsetloc(0, "* (Susie slowly locked the door...!)/%", "obj_room_teevie_cowboy_after_02_slash_Step_0_gml_268_0");
    d_make();
}
if (con == 40 && !d_ex())
{
    con = 41;
    alarm[0] = 30;
    snd_play(snd_shineselect_reverse);
    scr_speaker("no_name");
    msgsetloc(0, "* (RALSEI RANCHER is now locked for your CASTLE TOWN. Again.)/%", "obj_room_teevie_cowboy_after_02_slash_Step_0_gml_282_0");
    d_make();
}
if (con == 42 && !d_ex())
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
    with (obj_mainchara)
    {
        cutscene = 0;
        fun = 0;
        sprite_index = dsprite;
    }
    with (obj_caterpillarchara)
    {
        cutscene = 0;
        fun = 0;
        sprite_index = rsprite;
    }
}
