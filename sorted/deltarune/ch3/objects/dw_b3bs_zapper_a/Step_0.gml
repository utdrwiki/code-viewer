if (ccon == 0)
{
    if (obj_mainchara.x >= 240)
    {
        ccon = 1;
        cctimer = 0;
        global.interact = 1;
        camx = camerax();
    }
}
if (ccon == 1)
{
    ccon = -1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_pannable(1);
    c_pan(332, 0, 30);
    c_wait(40);
    c_speaker("susie");
    c_msgsetloc(0, "\\E2* Hell yeah. Security lights. That means going stealth mode./", "obj_dw_b3bs_zapper_a_slash_Step_0_gml_27_0");
    c_msgnextloc("\\EA* Always wanted to sneak like this^1. Let's hit the wall^1, Kris./%", "obj_dw_b3bs_zapper_a_slash_Step_0_gml_28_0");
    c_talk_wait();
    c_pan(camx, 0, 30);
    c_wait(30);
    c_var_instance(id, "ccon", 99);
    c_sel(kr);
    c_facing("r");
    c_sel(ra);
    c_facing("r");
    c_sel(su);
    c_facing("r");
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (ccon == 99 && !i_ex(cutscene_master))
{
    with (obj_caterpillarchara)
        scr_caterpillar_interpolate();
    global.interact = 0;
    global.flag[1135] = 1;
    ccon++;
}
if (con == 0)
{
    with (obj_b3bs_stealth)
    {
        if (alert == 2)
        {
            other.con = 1;
            other.timer = 0;
        }
    }
}
if (con == 1)
{
    headct[0] = 0;
    var headrange = 50;
    with (obj_dw_ch3_b3bs_zapperhead)
    {
        if (x > (camerax() + headrange) && x < ((camerax() + 640) - headrange))
            array_push(other.headct, id);
    }
    array_delete(headct, 0, 1);
    show_debug_message(string(headct));
    head = headct[irandom_range(0, array_length(headct) - 1)];
    zapper = scr_dark_marker(head.x + 64, head.y - 36, spr_zapper_jump_noshadow);
    with (zapper)
        scr_lerpvar("image_index", 0, 4, 7);
    zapper.vspeed = -40;
    zapper.gravity = 2;
    zapper.image_xscale = -2;
    zapper.image_blend = c_black;
    scr_lerp_imageblend(zapper, c_black, c_white, 8, 2, "out");
    snd_play(snd_jump);
    var desxloc = obj_mainchara.x - 48;
    if (head.x > (obj_mainchara.x + 17))
    {
        desxloc = obj_mainchara.x + 90;
        zapper.image_xscale = 2;
        zapper.x -= 92;
    }
    with (zapper)
        scr_lerpvar("x", x, desxloc, 30, 2, "out");
    safe_delete(head);
    con = 2;
}
var groundpos = scr_even(obj_mainchara.y - 60);
if (con == 2)
{
    if (zapper.y < groundpos)
        con = 3;
}
if (con == 3)
{
    if (zapper.y >= groundpos)
    {
        zapper.y = groundpos;
        zapper.image_index = 7;
        with (zapper)
            scr_delay_var("image_index", 8, 4);
        zapper.gravity = 0;
        zapper.vspeed = 0;
        zapper.depth = obj_mainchara.depth;
        snd_play(snd_wing);
        con = 4;
    }
}
if (con == 4)
{
    scr_speaker("no_name");
    msgsetloc(0, "* What the -- you's ain't allowed in here!/%", "obj_dw_b3bs_zapper_a_slash_Step_0_gml_148_0");
    d_make();
    con = 5;
}
if (con == 5 && !d_ex())
{
    roomtarg = 177;
    change = instance_create(x, y, obj_tvturnoff_manager);
    change.kind = 1;
    global.entrance = 4;
    change.roomtarg = roomtarg;
    con = 6;
}
if (paannounce == 0)
{
    var trig = 0;
    with (obj_b3bs_stealth)
    {
        if (active)
            trig = 1;
    }
    if (trig == 1)
    {
        paannounce = 1;
        patime = 0;
    }
}
if (fastcon == 1)
{
    if (global.interact == 0 && !d_ex() && i_ex(obj_mainchara) && obj_mainchara.x > 740)
    {
        global.interact = 1;
        scr_speaker("susie");
        msgsetloc(0, "\\EK* Hey^1, uh^1, Kris?/", "obj_dw_b3bs_zapper_a_slash_Step_0_gml_205_0");
        msgnextloc("\\E1* So^1, uh^1, sneaking actually really sucks./", "obj_dw_b3bs_zapper_a_slash_Step_0_gml_206_0");
        msgnextloc("\\E2* Let's just go super fast./", "obj_dw_b3bs_zapper_a_slash_Step_0_gml_207_0");
        scr_anyface_next("none", 0);
        msgnextloc("* (You and Susie decided to go really really fast in every Stealth Zone.)/%", "obj_dw_b3bs_zapper_a_slash_Step_0_gml_209_0");
        d_make();
        fastcon = 2;
        global.flag[1184] = 1;
    }
}
if (fastcon == 2)
{
    if (!d_ex())
    {
        fastcon = 3;
        global.interact = 0;
    }
}
if (i_ex(doortrig))
{
    with (doortrig)
    {
        if (myinteract == 3)
        {
            global.interact = 1;
            scr_speaker("no_name");
            msgsetloc(0, "* (The door is locked by some garbage mechanism.)/%", "obj_dw_b3bs_zapper_a_slash_Step_0_gml_223_0");
            d_make();
            myinteract = 4;
        }
        if (myinteract == 4 && !d_ex())
        {
            global.interact = 0;
            myinteract = 0;
        }
    }
}
