var _timer = 120;
if (init == 0)
{
    with (scr_marker_ext(0, 0, spr_pxwhite, room_width, room_height, undefined, undefined, c_black, 0, undefined, undefined, 1))
        scr_lerpvar("image_alpha", 2, 0, _timer);
    with (obj_fadein)
        instance_destroy();
    init = 1;
}
free++;
if (free == _timer)
    global.interact = 0;
roomleft = 640;
roomwidth = 2560;
roomtop = 480;
roomheight = 2880;
var looped = 0;
ilooped = false;
with (obj_mainchara)
{
    if (x > (other.roomleft + other.roomwidth))
    {
        x -= other.roomwidth;
        looped = true;
    }
    if (x < other.roomleft)
    {
        x += other.roomwidth;
        looped = true;
    }
    if (y > (other.roomtop + other.roomheight))
    {
        y -= other.roomheight;
        looped = true;
    }
    if (y < other.roomtop)
    {
        y += other.roomheight;
        looped = true;
    }
}
if (con == 0)
{
    var trig = 0;
    with (obj_trigger_interact)
    {
        if (extflag == "act")
        {
            if (myinteract == 3)
                trig = 1;
        }
    }
    if (trig == 1)
    {
        global.interact = 1;
        con = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* You used the machine./", "obj_ch3_gachaunknown_slash_Step_0_gml_55_0");
        msgnextloc("* ..^1. The capsule came out./", "obj_ch3_gachaunknown_slash_Step_0_gml_56_0");
        msgnextloc("* Inside was something hard like lacquer./", "obj_ch3_gachaunknown_slash_Step_0_gml_57_0");
        msgnextloc("* It was a small^1, dark^1, triangle./", "obj_ch3_gachaunknown_slash_Step_0_gml_58_0");
        msgnextloc("* You tried to take it.../", "obj_ch3_gachaunknown_slash_Step_0_gml_59_0");
        msgnextloc("* But^1, it slipped through your hand/", "obj_ch3_gachaunknown_slash_Step_0_gml_60_0");
        msgnextloc("* And you couldn't find it anymore./%", "obj_ch3_gachaunknown_slash_Step_0_gml_61_0");
        with (d_make())
            stay = 30;
    }
}
if (con == 1)
{
    if (i_ex(obj_writer))
        con = 1.5;
}
if (con == 1.5)
{
    if (scr_msgno_end(6))
    {
        mus_fade(global.currentsong[1], 10);
        con = 2;
    }
}
if (con == 2 && !d_ex())
{
    scr_speaker("no_name");
    msgsetloc(0, "* You couldn't find^1^1^1^1^1^1^1^1^1^1^1\n\nyour hand.", "obj_ch3_gachaunknown_slash_Step_0_gml_85_0");
    with (d_make())
    {
        global.typer = 36;
        skippable = false;
    }
    con = 3;
}
if (con == 3)
{
    with (obj_writer)
    {
        rate = 4;
        if (rate == 4)
            other.con = 4;
    }
}
if (con == 4)
{
    if (scr_msgno_end(0))
        con = 5;
}
if (con == 5)
{
    timer++;
    if (timer == 30)
    {
        fade = scr_marker_ext(camerax(), cameray(), spr_pxwhite, 640, 480, 0, 0, c_black, -40);
        fade.image_alpha = 0;
        with (fade)
        {
            scr_delay_var("image_alpha", 0.2, 5);
            scr_delay_var("image_alpha", 0.4, 10);
            scr_delay_var("image_alpha", 0.6000000000000001, 15);
            scr_delay_var("image_alpha", 0.8, 20);
            scr_delay_var("image_alpha", 1, 25);
        }
        scr_delay_var("con", 6, 40);
    }
}
if (con == 6)
{
    global.flag[1226] = 1;
    with (instance_create(obj_mainchara.x - 80, obj_mainchara.y - 80, obj_doorAny))
    {
        image_xscale = 999;
        image_yscale = 999;
        doorRoom = room_dw_ranking_b;
        doorFadeMusic = 1;
        doorEntrance = 5;
    }
    global.interact = 0;
    con = 7;
}
if (scr_debug())
{
}
