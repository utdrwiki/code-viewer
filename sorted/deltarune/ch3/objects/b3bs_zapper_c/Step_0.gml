if (con == 0)
{
    if (stealth.alert == 2)
    {
        con = 1;
        timer = 0;
        stealth.dir = 0;
        stealth.updatedir = 1;
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
    with (instance_create(350, 200, obj_chaseenemy_zapper))
    {
        visible = 0;
        con = 3;
    }
    con = 5;
}
if (con == 5 && d_ex())
    con = 6;
if (con == 6 && !d_ex() && global.interact == 0)
{
    global.interact = 1;
    with (obj_chaseenemy_zapper)
        instance_destroy();
    with (obj_dw__backstagelight)
        instance_destroy();
    with (obj_b3bs_stealthSolid)
        instance_destroy();
    timer = 0;
    con = 7;
}
if (con == 7)
{
    timer++;
    if (timer == 1)
    {
        with (zapper)
        {
            sprite_index = spr_zapper_jump_noshadow;
            scr_lerpvar("image_index", 0, 4, 8, 2, "out");
        }
    }
    if (timer > 1)
    {
        if (zapper.image_index >= 3 && zapper.gravity == 0)
        {
            with (zapper)
            {
                depth = 20;
                snd_play(snd_jump);
                vspeed = -12;
                hspeed = 4;
                gravity = 1;
            }
        }
        if (zapper.y > 276)
        {
            timer = 0;
            con = 8;
            scr_lerp_imageblend(zapper, c_white, c_black, 12, 2, "out");
            scr_doom(zapper, 30);
            scr_delay_var("con", 9, 8);
        }
    }
}
if (con == 9)
{
    global.facing = 0;
    global.interact = 0;
    with (obj_caterpillarchara)
        scr_caterpillar_interpolate();
    with (obj_b3bs_stealtharea)
        y = 0;
    con = 10;
}
