active = i_ex(obj_mainchara_board);
if (global.interact == 0 && !frozen)
    bsin++;
if (con == 0)
{
    with (bell1)
        y = scr_even(128 + (sin((other.bsin + 32) / 6) * 32 * 2));
    b1[0].y = bell1.y;
    b1[1].y = bell1.y;
    with (bell2)
        y = scr_even(128 + (sin(other.bsin / 8) * 32 * 2));
    b2[0].y = bell2.y;
    b2[1].y = bell2.y;
    with (bell3)
        y = scr_even(128 + (sin(other.bsin / 15) * 32 * 2));
    b3[0].y = bell3.y;
    b3[1].y = bell3.y;
    with (bell4)
        y = scr_even(128 + (sin(other.bsin / 12) * 32 * 2));
    b4[0].y = bell4.y;
    b4[1].y = bell4.y;
    with (obj_board_trigger)
    {
        if (!place_meeting(x, y, obj_board_grayregion))
        {
            if (place_meeting(x, y, obj_mainchara_board))
            {
                other.con = 1;
                other.timer = 0;
            }
        }
    }
    var trigd = 0;
    with (btrig)
    {
        if (place_meeting(x, y, obj_pushableblock_board))
            trigd = 1;
    }
    if (trigd == 1)
    {
        timer = 0;
        con = 3;
        global.flag[1142] = 1;
        debug_print(string(instance_number(obj_pushableblock_board)));
        if (instance_number(obj_pushableblock_board) > 1)
            global.flag[1142] = 2;
    }
}
if (con == 1)
{
    frozen = true;
    global.interact = 1;
    timer++;
    if (timer == 1)
    {
        snd_play(snd_bell);
        snd_play_delay(snd_bell, 4);
        with (obj_board_playercamera)
            instance_destroy();
        with (obj_board_grayregion)
            instance_destroy();
        with (obj_board_grabobject)
            instance_destroy();
        with (block)
        {
            if (x != 160 || y != 128)
            {
                setxy(160, 128);
                visible = true;
                instance_create_depth(x, y, depth - 1, obj_board_smokepuff);
            }
        }
        with (obj_mainchara_board)
        {
            grabbed = 0;
            grab = 0;
            if (name == "ralsei")
                unstoole = true;
        }
    }
    if (timer == 15)
    {
        with (obj_mainchara_board)
        {
            scr_lerpvar("x", x, 448, 14, -1, "out");
            scr_lerpvar("y", y, 128, 14, -1, "in");
        }
    }
    if (timer == 30)
    {
        timer = 0;
        con = 0;
        global.interact = 0;
        frozen = false;
        with (obj_mainchara_board)
            canfreemove = true;
    }
}
if (con == 3)
{
    var cont = 1;
    with (obj_pushableblock_board)
    {
        if (con != 0)
            cont = 0;
    }
    if (cont == 1)
    {
        global.interact = 1;
        snd_play(snd_link_secret);
        con = 4;
        timer = 0;
    }
}
if (con == 4)
{
    timer++;
    if (timer == 5)
    {
        with (bell1)
        {
            snd_play(snd_board_splash);
            instance_create(x, y, obj_board_smokepuff);
            instance_destroy();
        }
    }
    if (timer == 10)
    {
        with (bell2)
        {
            snd_play(snd_board_splash);
            instance_create(x, y, obj_board_smokepuff);
            instance_destroy();
        }
    }
    if (timer == 15)
    {
        with (bell3)
        {
            snd_play(snd_board_splash);
            instance_create(x, y, obj_board_smokepuff);
            instance_destroy();
        }
    }
    if (timer == 20)
    {
        with (bell4)
        {
            snd_play(snd_board_splash);
            instance_create(x, y, obj_board_smokepuff);
            instance_destroy();
        }
    }
    if (timer == 20)
    {
        with (block)
        {
            snd_play(snd_board_splash);
            instance_create(x, y, obj_board_smokepuff);
            instance_destroy();
        }
    }
    if (timer == 55)
    {
        scr_shakescreen();
        snd_play(snd_impact);
        var targcolor = 4858411;
        if (global.flag[1142] == 2)
            targcolor = 2377478;
        with (obj_dw_ch3_b3bs_zapperhead)
            scr_lerp_imageblend(id, c_black, targcolor, 60, 2, "in");
        makelight = true;
        timer = 0;
        con = 10;
        global.interact = 0;
    }
}
if (con == 10)
{
    if (i_ex(collision_rectangle(80, 340, 120, 380, obj_mainchara, 0, 0)))
    {
        global.interact = 1;
        snd_play(snd_b);
        con = 11;
        timer = 0;
    }
}
if (con == 11)
{
    headct[0] = 0;
    var headrange = 50;
    with (obj_dw_ch3_b3bs_zapperhead)
    {
        if (x > 248 && x < 554)
            array_push(other.headct, id);
    }
    array_delete(headct, 0, 1);
    show_debug_message(string(headct));
    head = headct[irandom_range(0, array_length(headct) - 1)];
    zapper = scr_dark_marker(head.x + 64, head.y - 36, spr_zapper_jump_noshadow);
    with (zapper)
        scr_lerpvar("image_index", 0, 4, 7);
    zapper.vspeed = -36;
    zapper.gravity = 2;
    zapper.image_xscale = -2;
    zapper.image_blend = c_black;
    scr_lerp_imageblend(zapper, c_black, c_white, 8, 2, "out");
    snd_play(snd_jump);
    var desxloc = obj_mainchara.x - 48;
    desxloc = 336;
    zapper.image_xscale = 2;
    zapper.x -= 92;
    with (zapper)
        scr_lerpvar("x", x, desxloc, 30, 2, "out");
    safe_delete(head);
    con = 12;
}
var groundpos = scr_even(obj_mainchara.y - 60);
if (con == 12)
{
    if (zapper.y < groundpos)
        con = 13;
}
if (con == 13)
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
        con = 14;
        global.facing = 1;
        scr_caterpillar_facing(global.facing);
    }
}
if (con == 14)
{
    global.msc = -99;
    global.choice = -1;
    global.choicemsg[0] = stringsetloc("#Backstage#Entrance", "obj_dw_b3bs_camerareminder_slash_Step_0_gml_300_0");
    global.choicemsg[1] = stringsetloc("#Stay Here", "obj_dw_b3bs_camerareminder_slash_Step_0_gml_301_0");
    global.choicemsg[2] = stringset("");
    global.choicemsg[3] = stringset("");
    scr_speaker("zapper");
    msgsetloc(0, "* Hey^1! Youse guys ain't sposeda be here!/", "obj_dw_b3bs_camerareminder_slash_Step_0_gml_305_0");
    msgnextloc("* So^1, uh..^1. where'd you wanna go instead?/", "obj_dw_b3bs_camerareminder_slash_Step_0_gml_306_0");
    msgnext("\\C2 ");
    d_make();
    con = 15;
    blush = 0;
}
if (con == 15 && blush == 0)
{
    if (scr_getmsgno() == 1)
    {
        with (zapper)
            setxy(x + 16, y + 6);
        zapper.sprite_index = spr_zapper_spare;
        image_speed = 0.125;
        blush = 1;
    }
}
if (con == 15 && global.choice != -1)
{
    k_d(1);
    blush = 0;
    with (zapper)
        setxy(x - 16, y - 6);
    zapper.sprite_index = spr_zapper_jump_noshadow;
    zapper.image_index = 8;
    zapper.image_speed = 0;
    scr_speaker("zapper");
    msgsetloc(0, "* You got it^1, boss./%", "obj_dw_b3bs_camerareminder_slash_Step_0_gml_333_0");
    if (global.choice == 0)
        con = 99;
    if (global.choice == 1)
    {
        con = 16;
        timer = 0;
    }
    d_make();
}
if (con == 16 && !d_ex())
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
            con = -1;
            scr_lerp_imageblend(zapper, c_white, c_black, 12, 2, "out");
            scr_doom(zapper, 30);
            scr_delay_var("con", 17, 8);
            with (obj_dw__backstagelight)
                scr_lerpvar("image_alpha", image_alpha, 0, 30, 2, "out");
        }
    }
}
if (con == 17)
{
    global.facing = 0;
    with (obj_caterpillarchara)
        scr_caterpillar_interpolate();
    global.interact = 0;
    con++;
}
if (con == 99 && !d_ex())
{
    change = instance_create(x, y, obj_tvturnoff_manager);
    change.kind = 1;
    change.roomtarg = 177;
    con++;
}
if (makelight)
{
    makelight = false;
    light = instance_create(44, 412, obj_dw__backstagelight);
    with (light)
    {
        if (global.flag[1142] == 2)
            image_blend = #13D26F;
        type = 1;
        movetype = 4;
        range = 4;
        xrange = 6;
        amplitude = 30;
        drawlamp = false;
    }
}
