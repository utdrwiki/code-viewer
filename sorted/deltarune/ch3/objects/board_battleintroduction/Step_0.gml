if (con == 0)
{
    timer++;
    var starttime = 36;
    if (timer == starttime)
    {
        global.interact = 1;
        global.screenshot = sprite_create_from_surface(application_surface, 0, 0, __view_get(e__VW.WView, 0), __view_get(e__VW.HView, 0), 0, 0, 0, 0);
    }
    if (timer == starttime)
    {
        con = 1;
        timer = 0;
    }
}
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        drawoverlay = true;
        with (obj_shadowman_enemy)
            visible = false;
        scr_lerpvar("tone_saturation", 1, 0.1, 30, 2, "out");
        scr_lerpvar("tone_factor", 0, 0.5, 30, 2, "out");
    }
    if (timer == 2)
        scr_lerpvar("staticalpha", 0, 0.015, 15);
    if (timer == 3)
        scr_lerpvar("grayalpha", 0, 0.35, 15);
    if (timer == 5)
    {
        tenna = instance_create((camerax() + 320) - 640, cameray() + 260, obj_actor_tenna);
        tenna.depth = depth - 10;
        tenna.auto_depth = 0;
        tenna.dropshadow = true;
        tenna.preset = 1;
        with (tenna)
            scr_lerpvar("x", x, 320, 40, -1, "out");
    }
    if (timer == 42)
    {
        tenna.bounce = 1;
        tenna.preset = 2;
    }
    if (timer == 45)
    {
        scr_speaker("tenna");
        msgsetloc(0, "* WELCOME TO TV TIME PRESENTS: FIGHTING!/", "obj_board_battleintroduction_slash_Step_0_gml_56_0");
        scr_anyface_next("susie", 0);
        msgnextloc("* We've done this before./", "obj_board_battleintroduction_slash_Step_0_gml_58_0");
        scr_anyface_next("tenna", 0);
        msgnextloc("* YOU HAVE?!/", "obj_board_battleintroduction_slash_Step_0_gml_60_0");
        scr_anyface_next("ralsei", 0);
        msgnextloc("* Yes^1, quite a few times./", "obj_board_battleintroduction_slash_Step_0_gml_62_0");
        scr_anyface_next("tenna", 0);
        msgnextloc("* HOW AM I SUPPOSED TO INTRODUCE THIS THEN?/", "obj_board_battleintroduction_slash_Step_0_gml_64_0");
        scr_anyface_next("susie", 0);
        msgnextloc("* You don't need to./", "obj_board_battleintroduction_slash_Step_0_gml_66_0");
        scr_anyface_next("ralsei", 0);
        msgnextloc("* Yep^1! We've got this. Right Kris?/%", "obj_board_battleintroduction_slash_Step_0_gml_68_0");
        d = d_make();
        d.depth = -20;
        d.side = 1;
        con = 1.1;
    }
}
if (i_ex(d))
{
    with (d)
    {
        if (i_ex(writer))
        {
            if (other.con == 1.1)
                other.con = 2;
            writer.depth = depth - 10;
        }
    }
}
if (con == 2 && d.writer.msgno == 2)
{
    tenna.preset = 0;
    con++;
}
if (con == 3 && d.writer.msgno == 3)
{
    tenna.preset = 7;
    con++;
}
if (con == 4 && d.writer.msgno == 5)
{
    tenna.preset = 8;
    con++;
}
if (con == 5 && d.writer.msgno == 8)
{
    tenna.preset = 12;
    con++;
}
if (con == 6 && d.writer.msgno == 10)
{
    tenna.preset = 0;
    tenna.sprite_index = spr_tenna_grasp_d;
    con++;
}
if (con == 7 && d.writer.msgno == 12)
{
    tenna.preset = 0;
    tenna.sprite_index = spr_tenna_grasp_b;
    con++;
}
if (con == 8 && !d_ex())
{
    timer = 0;
    con++;
}
if (con == 9)
{
    timer++;
    if (timer == 30)
    {
        tenna.preset = 1;
        scr_speaker("tenna");
        msgsetloc(0, "* Well fine^1, this is all placeholder anywho./%", "obj_board_battleintroduction_slash_Step_0_gml_145_0");
        d = d_make();
        d.depth = -20;
        d.side = 1;
        timer = 0;
        con++;
    }
}
if (con == 10 && !d_ex())
{
    timer++;
    if (timer == 15)
    {
        tenna.presset = 0;
        tenna.gravity = 1.25;
        tenna.vspeed = -9;
        tenna.hspeed = 12;
        tenna.image_xscale = -2;
        tenna.sprite_index = spr_tenna_attack;
        tenna.image_speed = 0;
        tenna.image_index = 0;
        snd_play(snd_jump);
    }
    if (timer == 45)
    {
        with (obj_shadowman_enemy)
            visible = true;
        scr_lerpvar("tone_saturation", 0.1, 1, 15, 2, "in");
        scr_lerpvar("tone_factor", 0.5, 0, 15, 2, "in");
        scr_lerpvar("staticalpha", 0.015, 0, 15);
        scr_lerpvar("grayalpha", 0.35, 0, 15);
    }
    if (timer == 60)
    {
        safe_delete(tenna);
        instance_destroy();
    }
}

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
