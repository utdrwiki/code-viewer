var xmove = 280;
con = 0;
timer = 0;
camcontrol = false;
camx = camerax();
camy = cameray();
crblock = 0;
console = instance_find(obj_b3bs_console, 0);
lawnmower = instance_create(1248 + xmove, 224, obj_board_lawnmower);
lawnmower.depth = 99900;
pynpc = 0;
scr_setparty(1, 1, 0);
var populate = true;
if (populate)
{
    var xoffset = -64;
    for (var i = 0; i < 15; i++)
    {
        if (i != 13)
        {
            consolemarker[i] = scr_dark_marker(xoffset + xmove + 250 + (78 * i), 268, spr_ch3_dw_b3bs_console);
            consolemarker[i].image_index = 1;
            consolemarker[i].image_speed = 0;
            consolemarker[i].depth = 97000;
            if (i != 7 && i != 8)
            {
                sadshad[i] = instance_create(xoffset + xmove + 252 + (78 * i), 242, obj_npc_room);
                sadshad[i].sprite_index = spr_shadowman_playgamesad;
                sadshad[i].extflag = "sadshad";
            }
            boardshad[i] = scr_board_marker(xoffset + xmove + 264 + (78 * i), 164, spr_dw_b3bs_sadshadowguys, 0.05);
            with (boardshad[i])
            {
                image_index = i * pi * 4;
                image_speed += (((i % 2) == 0) * 0.01);
            }
        }
    }
    pip = instance_create(1446 + xmove, 238, obj_npc_room);
    with (pip)
    {
        extflag = "pip";
        sprite_index = spr_npc_pippins;
    }
    var xx = 750 + xmove;
    var yy = 98;
    var xspace = 32;
    var yspace = 72;
    xoffset = 0;
    pyramid[9] = scr_marker_ext((xx + (xspace * 0)) - xoffset, yy + (yspace * -1), spr_shadowman_playgamesad, 2, 2, 0, 0, c_white, 96986);
    xoffset = 4;
    pyramid[0] = scr_marker_ext((xx + (xspace * 0)) - xoffset, yy + (yspace * 0), spr_shadowman_playgamesad, 2, 2, 0, 0, c_white, 96985);
    pyramid[8] = scr_marker_ext((xx + (xspace * 1)) - xoffset, yy + (yspace * 0), spr_shadowman_playgamesad, 2, 2, 0, 0, c_white, 96985);
    xoffset = 16;
    pyramid[1] = scr_marker_ext((xx + (xspace * 0)) - xoffset, yy + (yspace * 1), spr_shadowman_playgamesad, 2, 2, 0, 0, c_white, 96984);
    pyramid[2] = scr_marker_ext((xx + (xspace * 1)) - xoffset, yy + (yspace * 1), spr_shadowman_playgamesad, 2, 2, 0, 0, c_white, 96984);
    pyramid[7] = scr_marker_ext((xx + (xspace * 2)) - xoffset, yy + (yspace * 1), spr_shadowman_playgamesad, 2, 2, 0, 0, c_white, 96984);
    xoffset = 26;
    pyramid[3] = scr_marker_ext((xx + (xspace * 0)) - xoffset, yy + (yspace * 2), spr_shadowman_playgamesad, 2, 2, 0, 0, c_white, 96980);
    pyramid[4] = scr_marker_ext((xx + (xspace * 1)) - xoffset, yy + (yspace * 2), spr_shadowman_playgamesad, 2, 2, 0, 0, c_white, 96980);
    pyramid[5] = scr_marker_ext((xx + (xspace * 2)) - xoffset, yy + (yspace * 2), spr_shadowman_playgamesad, 2, 2, 0, 0, c_white, 96980);
    pyramid[6] = scr_marker_ext((xx + (xspace * 3)) - xoffset, yy + (yspace * 2), spr_shadowman_playgamesad, 2, 2, 0, 0, c_white, 96980);
    pynpc = instance_create(pyramid[3].x + 12, pyramid[3].y + 66, obj_trigger_interact);
    with (pynpc)
    {
        sprite_index = spr_solidblock;
        issolid = true;
        scr_sizeexact(154, 36);
        strict = true;
    }
}
pyjump = 0;
pytimer = 0;
px = pyramid[0].x;
py = pyramid[0].y;
py_lockpos = false;
happyshad = [];
killhappyshads = false;
killcount = 0;
pyupdate = 0;
loner = 0;
shine = 0;
endshine = 0;
siner = 0;
if (global.flag[1147] != 0)
{
    crblock = 1;
    with (obj_dw_ch3_b3bs_office_paperstack)
    {
        if (x < (1242 + xmove))
            instance_destroy();
    }
    safe_delete(lawnmower);
    with (obj_npc_room)
    {
        if (extflag == "sadshad")
            instance_destroy();
    }
    with (obj_board_marker)
        instance_destroy();
    with (obj_marker)
    {
        if (sprite_index == spr_shadowman_playgamesad)
            instance_destroy();
    }
}
else if (global.flag[1055] < 6)
{
    shine = scr_marker_ext(1494, 290, spr_shine, 2, 2);
    with (shine)
        scr_depth();
}
pydepth = -1;
if (scr_enemylostcheck("shadowguy") && global.flag[1147] == 0)
{
    con = 30;
    with (obj_npc_room)
    {
        if (extflag == "sadshad")
            instance_destroy();
    }
    with (obj_board_marker)
        instance_destroy();
    with (obj_marker)
    {
        if (sprite_index == spr_shadowman_playgamesad)
            instance_destroy();
    }
}
dooffset = 0;
shadhere = true;
if (scr_enemylostcheck("shadowguy") || global.flag[1147] > 1)
    shadhere = false;
if (global.flag[1055] >= 6)
{
    dooffset = true;
    if (global.flag[1147] != 0)
        con = -20;
    tvBlackOverlay = scr_marker_ext(408, 96, spr_pxwhite, 1280, 160, undefined, undefined, c_black, 99801);
}
if (global.flag[1147] != 0 || global.flag[654] == -1)
    safe_delete(pynpc);
