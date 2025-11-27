if (scr_debug())
{
    if (keyboard_check_pressed(ord("A")))
    {
    }
}
scr_populatechars();
if (!init)
{
    var pos = scr_heromarker(undefined, "prop1");
    prophecy1 = instance_create(pos[0] + 150, pos[1] + 90, obj_dw_church_prophecy);
    prophecy1.extflag = "heroes1";
    pos = scr_heromarker(undefined, "prop2");
    prophecy2 = instance_create(pos[0] + 150, pos[1] + 90, obj_dw_church_prophecy);
    prophecy2.extflag = "main3";
    pos = scr_heromarker(undefined, "prop3");
    prophecy3 = instance_create(pos[0] + 150, pos[1] + 90, obj_dw_church_prophecy);
    prophecy3.extflag = "main2";
    with (obj_dw_church_prophecy)
        fade_edges = true;
    init = 1;
}
var propactive = false + forceactive;
with (obj_trigger)
{
    if (extflag == "proptrig")
    {
        if (place_meeting(x, y, obj_mainchara))
            propactive++;
    }
}
with (obj_dw_church_prophecy)
    active = propactive;
with (roomglow)
    active = propactive;
var killbat = false;
if (cutscene == 0)
{
    if (scr_trigcheck("cut1"))
    {
        cutscene = 1;
        global.interact = 1;
    }
}
if (cutscene == 1)
{
    cutscene = 2;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    with (roomglow)
    {
        var actors = [];
        with (obj_actor)
            array_push(actors, id);
        for (var i = 0; i < array_length(actors); i++)
            create_highlight(actors[i]);
    }
    var campos = scr_heromarker(undefined, "campos1");
    var krpos = scr_heromarker("kris", "pos1");
    var supos = scr_heromarker("susie", "pos1");
    var krdist = scr_returnwait_instance(kris, krpos[2], 6);
    var sudist = scr_returnwait_instance(susie, supos[2], 8);
    var camdist = scr_returnwait(camerax(), cameray(), campos[0], campos[1], 6);
    var camdistret = scr_returnwait(camerax(), cameray(), campos[0], campos[1], 10);
    c_pannable(1);
    c_pan(campos[0], campos[1], camdist);
    c_customfunc(function()
    {
    });
    c_sel(kr);
    c_walkdirect(krpos[0], krpos[1], krdist);
    c_delayfacing(krdist + 1, "u");
    c_sel(su);
    c_walkdirect(supos[0], supos[1], sudist);
    c_delayfacing(sudist + 1, "u");
    c_wait(max(sudist, krdist, camdist));
    c_wait(30);
    c_msgside("bottom");
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* ...There's that prophecy again. The one with..^1. us./", "obj_dw_churchb_prophecyencounter_slash_Step_0_gml_132_0");
    c_msgnextloc("\\EV* .../", "obj_dw_churchb_prophecyencounter_slash_Step_0_gml_133_0");
    c_msgnextloc("\\ED* ...It's..^1. pretty hard to believe./", "obj_dw_churchb_prophecyencounter_slash_Step_0_gml_134_0");
    c_msgnextloc("\\ET* Not just..^1. that things have been predicted^1, sure./", "obj_dw_churchb_prophecyencounter_slash_Step_0_gml_135_0");
    c_msgnextloc("\\ED* But that..^1. I'm..^1. part of it too^1, I guess./%", "obj_dw_churchb_prophecyencounter_slash_Step_0_gml_136_0");
    c_talk();
    c_wait_box(1);
    c_sel(su);
    c_sprite(spr_susie_up_head_down);
    c_wait_box(3);
    c_sel(su);
    c_facing("u");
    c_wait_box(4);
    c_sel(su);
    c_sprite(spr_susie_up_head_down);
    c_wait_talk();
    c_sel(su);
    c_facing("r");
    c_pan(1013, 128, camdistret);
    c_wait(camdistret + 1);
    c_customfunc(function()
    {
        global.facing = 0;
    });
    c_wait(1);
    c_pannable(0);
    c_actortocaterpillar();
    c_actortokris();
    c_terminatekillactors();
}
if (cutscene == 2 && !instance_exists(obj_cutscene_master))
{
    obj_mainchara.nudgey = -60;
    scr_caterpillar_interpolate("all");
    global.plot = 236;
    global.interact = 0;
    global.facing = 0;
    cutscene = 3;
}
if (econ == 0 && global.interact == 0)
{
    var trig = 0;
    with (obj_trigger)
    {
        if (extflag == "enemtrig")
        {
            if (place_meeting(x, y, obj_mainchara))
                trig = 1;
        }
    }
    if (trig)
    {
        econ = 1;
        var pos = scr_heromarker(undefined, "batspawn");
        bat = scr_marker_ext(pos[0], pos[1], spr_halo_bat_retract, 2, 2, 0, 5, c_black, layer_get_depth("PARALLAX_1") - 50);
        with (bat)
        {
            movespeed = 0;
            con = 0;
            timer = 0;
        }
    }
}
if (econ == 1)
{
    if (i_ex(bat))
    {
        if (bat.con == 2)
        {
            econ = 2;
            etimer = 0;
            forceactive = -99;
        }
    }
    with (obj_trigger)
    {
        if (extflag == "killbat")
        {
            if (place_meeting(x, y, obj_mainchara))
                killbat = true;
        }
    }
    if (killbat)
    {
        with (bat)
        {
            direction = image_angle - 90;
            scr_lerpvar("speed", speed, -10, 8, 2, "in");
            scr_lerpvar("image_alpha", image_alpha, 0, 8);
            scr_lerpvar("auraalph", auraalph, 0, 6);
            scr_doom(id, 60);
            con = 10;
        }
        econ = 0;
    }
}
if (i_ex(bat))
{
    with (bat)
    {
        var difficulty = 0;
        if (global.flag[other.encounterflag] != 0)
            difficulty = 1;
        if (con == 0)
        {
            timer++;
            var difftime = 16;
            if (difficulty == 1)
                difftime = 20;
            if (timer == 1)
            {
                snd_play(snd_wing);
                scr_lerp_imageblend(id, c_black, c_white, difftime, 2, "in");
                scr_lerpvar("y", y, cameray() + 40, difftime, 2, "out");
            }
            if (timer == (difftime - 2))
                image_index = 4;
            if (timer == difftime)
                image_index = 3;
            if (timer == (difftime + 1))
            {
                image_index = 2;
                snd_play(snd_knight_cut2, 0.7, 1.8);
            }
            if (timer == (difftime + 3))
                image_index = 1;
            if (timer == (difftime + 4))
            {
                image_index = 0;
                con++;
                timer = 0;
                depth = 5000;
                movespeed = 0.5;
            }
        }
        if (con == 1)
        {
            var waittime = 6;
            if (difficulty == 1)
                waittime = 18;
            var chasespeedmax = 18;
            if (difficulty == 1)
                chasespeedmax = 8;
            timer++;
            if (timer > waittime)
            {
                if (global.interact)
                {
                    speed = 0;
                }
                else
                {
                    movespeed *= 1.2;
                    movespeed = clamp(movespeed, 0, chasespeedmax);
                    direction = point_direction(x, y, obj_mainchara.x + 20, obj_mainchara.y + 60);
                    targdir = direction + 90;
                    if (abs((targdir - image_angle) + 90) > 360)
                        image_angle += 360;
                    image_angle = lerp(image_angle, targdir, 0.1);
                    move_towards_point(obj_mainchara.x + 20, obj_mainchara.y + 40, movespeed);
                    var caught = 0;
                    var dir = image_angle - 90;
                    var leng = 48;
                    var size = 24;
                    if (i_ex(collision_circle(x + lengthdir_x(leng, dir), y + lengthdir_y(leng, dir), size, obj_mainchara, 0, 0)))
                        caught = 1;
                    if (!caught)
                    {
                        if (i_ex(collision_circle(x, y, size * 2, obj_mainchara, 0, 0)))
                            caught = 1;
                    }
                    if (caught)
                    {
                        speed = 0;
                        con = 2;
                        scr_lerpvar("image_angle", image_angle, 360, 8);
                        scr_lerpvar("x", x, obj_mainchara.x + 160, 12, 2, "out");
                        scr_lerpvar("y", y, obj_mainchara.y + 20, 12, 2, "out");
                        timer = 0;
                        global.interact = 1;
                        global.facing = 1;
                    }
                }
            }
        }
    }
}
if (econ == 2)
{
    etimer++;
    if (etimer == 1)
    {
        snd_play(snd_tensionhorn);
        snd_play_delay(snd_tensionhorn, 10, undefined, 1.1);
    }
    if (etimer == 25)
    {
        global.flag[54] = encounterflag;
        scr_battle(encounterno, 0, bat);
        econ = 3;
    }
}
if (econ == 3 && !i_ex(obj_battleback))
{
    econ = 4;
    forceactive = 0;
}
