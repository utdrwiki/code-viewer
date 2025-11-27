if (scr_debug())
{
    if (keyboard_check(ord("W")) && con == 0)
    {
        if (keyboard_check_pressed(ord("1")))
        {
            con = 1;
            var pos = scr_heromarker("kris", "debugwarp1");
            setxy(pos[0], pos[1], 1049);
        }
        if (keyboard_check_pressed(ord("2")))
        {
            con = 2;
            var pos = scr_heromarker("kris", "debugwarp2");
            setxy(pos[0], pos[1], 1049);
        }
    }
    if (global.tempflag[90] == 6)
    {
        if (con == 0)
        {
            global.tempflag[90] = 0;
            var pos = scr_heromarker("kris", "endofcutscene");
            setxy(pos[0], pos[1], 1049);
            con = 3;
        }
    }
}
scr_populatechars();
if (!init)
{
    var col = 0;
    var pos = scr_heromarker("any", "ger1");
    gersonmark1 = scr_marker_ext(pos[0], pos[1], spr_gerson_outfit_walk_cane_right, 2, 2, 0, 0, col);
    gersonmark1.touched = false;
    pos = scr_heromarker("any", "ger2");
    gersonmark2 = scr_marker_ext(pos[0], pos[1], spr_gerson_outfit_walk_cane_right, 2, 2, 0, 0, col);
    gersonmark2.touched = false;
    pos = scr_heromarker("any", "ger3");
    gersonmark3 = scr_marker_ext(pos[0], pos[1], spr_gerson_outfit_walk_cane_right, 2, 2, 0, 0, col);
    gersonmark3.touched = false;
    init = 1;
}
if (con == 0)
{
    if (scr_trigcheck("ger1move"))
    {
        with (gersonmark1)
        {
            var lifetime = 90;
            hspeed = 4;
            image_speed = 0.25;
            scr_lerpvar("image_alpha", lifetime / 4, 0, lifetime);
            scr_doom(id, lifetime);
        }
        con++;
    }
}
if (con == 1)
{
    if (scr_trigcheck("ger2move"))
    {
        with (gersonmark2)
        {
            var delay = 24;
            var lifetime = 60;
            lifetime += delay;
            scr_delay_var("vspeed", -6, delay);
            scr_delay_var("image_speed", 0.25, delay);
            scr_delay_var("friction", -0.1, delay);
            scr_lerpvar("image_alpha", lifetime / 4, 0, lifetime);
            scr_doom(id, lifetime);
        }
        con++;
    }
}
if (con == 2)
{
    if (scr_trigcheck("ger3move"))
    {
        with (gersonmark3)
        {
            var delay = 20;
            var lifetime = 70;
            lifetime += delay;
            scr_delay_var("hspeed", 6, delay);
            scr_delay_var("image_speed", 0.25, delay);
            scr_delay_var("friction", -0.1, delay);
            scr_lerpvar("image_alpha", lifetime / 4, 0, lifetime);
            scr_doom(id, lifetime);
        }
        con++;
    }
}
if (con == 3)
{
    if (scr_trigcheck("seqEnd"))
    {
        audio_sound_gain(global.currentsong[1], 0, 120000 / fps);
        con = 4;
        global.interact = 1;
    }
}
if (con == 4)
{
    con++;
    cutscene_master = scr_cutscene_make();
    c_msgruncheck(true);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E8* It's..^1. awfully dark in here^1, isn't it...?/", "obj_dw_church_ripseq1_slash_Step_0_gml_131_0");
    c_facenext("susie", "K");
    c_msgnextloc("\\EK* Yeah^1, it's the Dark World./", "obj_dw_church_ripseq1_slash_Step_0_gml_133_0");
    c_facenext("ralsei", "8");
    c_msgnextloc("\\E8* Right..^1. but I mean.../%", "obj_dw_church_ripseq1_slash_Step_0_gml_135_0");
    c_talk_wait();
    c_var_instance(id, "makerip", 1);
    c_wait(40);
    c_msgruncheck(false);
    c_speaker("susie");
    c_msgsetloc(0, "\\EF* ?/", "obj_dw_church_ripseq1_slash_Step_0_gml_141_0");
    c_msgnextloc("\\EG* Hey^1, did you just..^1. hear something?/%", "obj_dw_church_ripseq1_slash_Step_0_gml_142_0");
    c_talk_wait();
    c_var_instance(id, "makerip", 2);
    c_wait(15);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EY* KRIS!!^1! RUN LEFT^1, NOW!!!/%", "obj_dw_church_ripseq1_slash_Step_0_gml_147_0");
    c_talk();
    c_wait(30);
    c_wait_talk();
    c_var_instance(id, "nextroom", 1);
    c_wait(180);
}
if (makerip)
{
    makerip = false;
    var xx = (camerax() + 640) - (makerip * 70);
    var yy = cameray() + 240;
    var ripdir = point_direction(xx, yy, obj_mainchara.x + 40, obj_mainchara.y + 60);
    var _hsp = lengthdir_x(2, ripdir);
    var _vsp = lengthdir_y(2, ripdir);
    snd_play(snd_tspawn, 0.7);
    if (!instance_exists(chaser))
    {
        chaser = scr_marker_ext(xx, yy, spr_dw_church_enemy_spawn_nooutline, 2, 2, 0.25, undefined, undefined, 5000);
    }
    else
    {
        snd_play_delay(snd_tspawn, 5, 0.4, 1);
        snd_play_delay(snd_tspawn, 10, 0.2, 1);
    }
    chaser.direction = ripdir;
    chaser.speed = 3;
    chaser.friction = 0.1;
    scr_fancy_ripple_alt(chaser.x, chaser.y, 60, 255, 120, 1, 8, 5001, _hsp, _vsp);
}
if (nextroom)
{
    var cont = true;
    with (obj_fancy_ripples_alt)
    {
        for (var i = 0; i < array_length(ripples); i++)
        {
            if (ripples[i].rad < 100)
                cont = false;
        }
    }
    if (cont)
    {
        with (obj_marker)
        {
            if (sprite_index == spr_dw_church_enemy_spawn_nooutline)
            {
                global.tempflag[50] = x - camerax();
                global.tempflag[51] = y - cameray();
                show_debug_message_concat(global.tempflag[50], " / ", global.tempflag[51]);
            }
        }
        room_goto(room_dw_church_ripseq2);
    }
}
if (i_ex(gersonmark2))
{
    with (gersonmark2)
    {
        if (!touched)
        {
            var border = 20;
            if (i_ex(collision_rectangle(bbox_left - border, bbox_top - border, bbox_right + border, bbox_bottom + 60, obj_mainchara, 0, true)))
            {
                debug_print("touched!");
                touched = 1;
            }
        }
        else
        {
            if (vspeed > -6)
                vspeed = -6;
            vspeed *= 1.05;
        }
    }
}
if (i_ex(gersonmark3))
{
    with (gersonmark3)
    {
        if (!touched)
        {
            var border = 20;
            if (i_ex(collision_rectangle(bbox_left - (border * 1.5), bbox_top - border, bbox_right + border, bbox_bottom + border, obj_mainchara, 0, true)))
            {
                speed *= 2;
                touched = 1;
            }
        }
        else
        {
            if (hspeed == 0)
                hspeed = 6;
            hspeed *= 1.05;
        }
    }
}
with (obj_treasure_room)
{
    if (!variable_instance_exists(id, "lightindex"))
        lightindex = 0;
    var _minPt = 39.2;
    var _maxPt = 103;
    var minClamp = 0.75;
    var maxClamp = 1;
    var input = distance_to_object_bbox(id, 1049);
    var prog = scr_progress(distance_to_object_bbox(id, 1049), 39.2, 103, 0.75, 1);
    lightindex = lerp(lightindex, prog, 0.25);
    image_blend = merge_color(c_white, c_black, lightindex);
}
