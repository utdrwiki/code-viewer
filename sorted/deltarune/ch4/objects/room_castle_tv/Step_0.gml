if (con < 0)
    exit;
if (zapper_talk_active)
{
    var stop_anim = false;
    with (obj_writer)
    {
        if (halt > 0)
            stop_anim = true;
    }
    zapper_marker.image_speed = stop_anim ? 0 : 0.2;
    zapper_marker.image_index = stop_anim ? 0 : zapper_marker.image_index;
}
if (con == 0 && !d_ex())
{
    con = 10;
    zapper_talk_active = true;
    global.interact = 1;
    zapper_marker.image_speed = 0.2;
    scr_speaker("no_name");
    msgsetloc(0, "* Hello^1, boss. Welcome to TV STUDIO./", "obj_room_castle_tv_slash_Step_0_gml_30_0");
    msgnextloc("* Here you can play various MiniGames./", "obj_room_castle_tv_slash_Step_0_gml_31_0");
    msgnextloc("* They have no effect on anything^1, so just enjoy yourself and relax!/%", "obj_room_castle_tv_slash_Step_0_gml_32_0");
    var d = d_make();
}
if (con == 10 && !d_ex())
{
    con = -1;
    global.interact = 0;
    zapper_talk_active = false;
    with (zapper_marker)
    {
        image_speed = 0;
        image_index = 0;
    }
}
if (con == 20 && global.interact == 0 && !d_ex())
{
    con = 21;
    global.interact = 1;
}
if (con == 21)
{
    con = 22;
    code_timer = 0;
    code_entry = instance_create(x, y, obj_codeentry);
    with (code_entry)
    {
        side = 0;
        correctcode = [6, 4, 5, 3];
        numcount = array_length(correctcode);
    }
}
if (con == 22)
{
    if (code_entry.result != -1)
    {
        code_timer++;
        if (code_timer == 1)
        {
            if (code_entry.result == -2)
            {
                with (code_entry)
                    instance_destroy();
                code_timer = 0;
                con = 30;
            }
        }
        if (code_timer == 30)
        {
            scr_speaker("no_name");
            if (code_entry.result == 0)
            {
                msgsetloc(0, "* (..^1. wrong combination!)/%", "obj_room_castle_tv_slash_Step_0_gml_91_0");
                con = 30;
            }
            else
            {
                msgsetloc(0, "* (You entered the numbers knowingly.)/%", "obj_room_castle_tv_slash_Step_0_gml_96_0");
                if (scr_flag_get(1645) == 0)
                    scr_flag_set(1645, 1);
                scr_tempsave();
                unlock_mystery_door();
                con = 30;
            }
            var d = d_make();
            d.side = 0;
            with (code_entry)
                instance_destroy();
            code_timer = 0;
        }
    }
}
if (con == 30 && !d_ex())
{
    con = -1;
    global.interact = 0;
}
if (con == 50 && !d_ex() && global.interact == 0)
{
    con = 51;
    global.facing = 0;
    global.interact = 1;
    var margin = scr_dark_marker(-10, room_height - 10, spr_pixel_white);
    with (margin)
    {
        image_blend = c_black;
        image_xscale = 170;
        image_yscale = 40;
    }
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 100;
    blackall.image_blend = c_black;
    blackall.visible = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_var_lerp_instance(blackall, "image_alpha", 1, 0, 30);
    c_sel(kr);
    c_walkdirect(kr_actor.x, 255, 30);
    if (scr_havechar(2) && scr_havechar(3))
    {
        c_sel(su);
        c_facing("u");
        c_setxy(240, 265);
        c_sel(ra);
        c_facing("u");
        c_setxy(160, 265);
    }
    c_wait(60);
    c_sel(kr);
    c_facing("u");
    if (scr_havechar(2) && scr_havechar(3))
    {
        c_sel(su);
        c_sprite(spr_susie_shocked_behind);
        c_flip("x");
        c_shakeobj();
        c_sel(ra);
        c_sprite(spr_ralsei_shocked_behind);
        c_shakeobj();
    }
    c_customfunc(function()
    {
        var explosion = instance_create(220, 240, obj_animation);
        snd_play(snd_badexplosion);
        explosion.sprite_index = spr_realisticexplosion;
        explosion.depth = kr_actor.depth + 10;
        scr_shakescreen();
    });
    c_var_instance(mystery_door_marker, "sprite_index", spr_dw_ranking_doors_narrow_mouse);
    c_wait(30);
    c_sel(kr);
    c_facing("d");
    if (scr_havechar(2) && scr_havechar(3))
    {
        c_sel(su);
        c_facing("u");
        c_flip("x");
        c_setxy(240, 265);
        c_sel(ra);
        c_facing("u");
        c_wait(30);
    }
    c_customfunc(function()
    {
        global.flag[1702] = 1;
        with (obj_doorAny)
        {
            if (doorSpecial == "mike")
                init = 0;
        }
    });
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 51 && !d_ex() && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
}
