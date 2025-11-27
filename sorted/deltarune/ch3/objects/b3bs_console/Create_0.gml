con = 0;
timer = 0;
buffer = 0;
canceltimer = 0;
depth = 5;
image_speed = 0;
player = 0;
characterIndex = 0;
cantuse = false;
skipcrt = false;
camera = false;
nocamera = false;
sword = false;
controlxpos = (x + 18) - 2;
controlypos = (y + 30) - 38;
camx = -1;
camy = 0;
camcon = 0;
camxoverride = 0;
camyoverride = 0;
init = 0;
kris = 0;
susie = 0;
ralsei = 0;
instructionLerp = 0;
engaged = 0;
canceltime = 15;
playx = 420;
playy = 190;
endplay = false;
gscreenw = 320;
gscreenh = 240;
gscreenx = 32;
gscreeny = 32;
canswitch = true;
startplayer = "kris";
dontdelete = false;
usecount = 0;
cutscene_master = 0;
image_alpha = 0.1;
depth = 500;
nostartchange = false;
skipcamreset = false;
playerid[0] = "kris";
array_push(playerid, "susie");
array_push(playerid, "ralsei");
for (var i = 0; i < global.flag[1099]; i++)
    array_push(playerid, "lancer");
if (room == room_dw_puzzlecloset_1)
{
    if (global.flag[1133] == 0)
    {
        tv1 = instance_create(384, 96, obj_puzzlecloset_tvturnon);
        tv2 = instance_create(560, 96, obj_puzzlecloset_tvturnon);
        tv3 = instance_create(736, 96, obj_puzzlecloset_tvturnon);
    }
    cantuse = true;
    if (global.flag[1090] == 1)
        cantuse = false;
    camx = 303;
    camy = 0;
    if (global.flag[1055] > 0)
    {
        array_resize(playerid, 0);
        playerid[0] = "kris";
        startplayer = "kris";
        sword = true;
    }
    else
    {
        array_resize(playerid, 0);
        playerid[0] = "susie";
        startplayer = "susie";
    }
    gscreenw = 384;
    gscreenh = 160;
    gscreenx = 768;
    gscreeny = 192;
    playx = 1472;
    playy = 272;
    canswitch = false;
    depth = 99799;
    image_alpha = 1;
}
if (room == room_dw_puzzlecloset_2)
{
    if (global.flag[1134] == 0)
    {
        for (var i = 0; i < 3; i++)
        {
            var xloc = 448;
            var yloc = 32;
            var xspace = 192;
            var yspace = 160;
            tv[i] = instance_create(xloc + (i * xspace), yloc + (yspace * 0), obj_puzzlecloset_tvturnon);
            tv[i].width = 160;
            tv[i].height = 128;
            tv[i + 3] = instance_create(xloc + (i * xspace), yloc + (yspace * 1), obj_puzzlecloset_tvturnon);
            tv[i + 3].width = 160;
            tv[i + 3].height = 128;
        }
    }
    camx = 398;
    if (global.flag[1055] > 0)
    {
        array_resize(playerid, 0);
        playerid[0] = "kris";
        startplayer = "kris";
        sword = true;
    }
    else
    {
        array_resize(playerid, 0);
        playerid[0] = "susie";
        startplayer = "susie";
    }
    gscreenw = 384;
    gscreenh = 160;
    gscreenx = 768;
    gscreeny = 192;
    playx = 3072;
    playy = 256;
    canswitch = false;
    depth = 99799;
    image_alpha = 1;
}
if (room == room_dw_puzzlecloset_3)
{
    if (global.flag[1150] == 0)
    {
        tv1 = instance_create(524, 32, obj_puzzlecloset_tvturnon);
        tv1.width = 384;
        tv1.height = 256;
    }
    skipcrt = true;
    camx = 396;
    camy = 0;
    array_resize(playerid, 0);
    playerid[0] = "kris";
    playerid[1] = "susie";
    playerid[2] = "ralsei";
    startplayer = "kris";
    playx = 2944;
    playy = 736;
    canswitch = true;
    if (global.flag[1150] < 4)
        nocamera = true;
    if (global.flag[1150] >= 1.5)
    {
        var roomstartx = 2688;
        var roomstarty = 608;
        playx = 2752;
        playy = 704;
        with (obj_board_camera)
        {
            warpx = 2304;
            warpy = 1376;
            var moveX = roomstartx - warpx - originX;
            var moveY = roomstarty - warpy - originY;
            with (obj_board_parent)
                setxy(x + moveX, y + moveY);
            layer_x(tileLayer, layer_get_x(tileLayer) + moveX);
            layer_y(tileLayer, layer_get_y(tileLayer) + moveY);
            if (layer_exists(assetLayer))
            {
                layer_x(assetLayer, layer_get_x(assetLayer) + moveX);
                layer_y(assetLayer, layer_get_y(assetLayer) + moveY);
            }
            if (layer_exists(tileLayer2))
            {
                layer_x(tileLayer2, layer_get_x(tileLayer2) + moveX);
                layer_y(tileLayer2, layer_get_y(tileLayer2) + moveY);
            }
        }
    }
    depth = 99799;
    image_alpha = 1;
}
if (room == room_dw_b3bs_rouxls_lanina)
{
    gscreenw = 384;
    gscreenh = 160;
    gscreenx = 128;
    gscreeny = 32;
    playx = 356;
    playy = 104;
    if (!scr_keyitemcheck(16))
        cantuse = true;
}
if (room == room_dw_b3bstest_big)
{
    playx = 96;
    playy = 128;
}
if (room == room_dw_b3bs_intro)
{
    playx = 128;
    playy = 192;
    gscreenw = 512;
    gscreenh = 160;
    gscreenx = 64;
    gscreeny = 96;
    image_alpha = 0;
    if (global.plot < 200)
    {
        canswitch = false;
        skipcamreset = true;
        dontdelete = true;
        cantuse = true;
        array_resize(playerid, 0);
        playerid[0] = "lancer";
        startplayer = "lancer";
        player = instance_create(playx, playy, obj_mainchara_board);
        player.freeroam = true;
        player.dontteam = true;
        player.canfreemove = true;
        player.controlled = 0;
        player.name = startplayer;
    }
    if (global.plot >= 125)
        cantuse = false;
}
if (room == room_dw_b3bs_lancerget)
{
    playx = -1;
    playy = -1;
    skipcrt = true;
    canswitch = false;
    array_resize(playerid, 0);
    playerid[0] = "lancer";
}
if (room == room_dw_b3bs_bibliox)
{
    scr_depth();
    playx = 304;
    playy = 176;
    gscreenw = 384;
    gscreenh = 160;
    gscreenx = 128;
    gscreeny = 64;
    canswitch = false;
    skipcamreset = true;
    camxoverride = 0;
    nocamera = true;
}
if (room == room_dw_b3bs_cheaterpippins)
{
    scr_depth();
    skipcrt = true;
    playx = 384;
    playy = 160;
    gscreenw = 288;
    gscreenh = 160;
    gscreenx = 256;
    gscreeny = 64;
    camx = 80;
    camy = 0;
    with (instance_create(gscreenx, gscreeny, obj_board_screen))
    {
        screenwidth = other.gscreenw;
        screenheight = other.gscreenh;
        depth = 100000;
    }
}
if (room == room_dw_b3bs_idcardpuzzle)
{
    scr_depth();
    playx = 320;
    playy = 192;
    gscreenw = 448;
    gscreenh = 160;
    gscreenx = 128;
    gscreeny = 64;
}
if (room == room_dw_b3bs_camerareminder)
{
    playx = 448;
    playy = 128;
    gscreenw = 384;
    gscreenh = 160;
    gscreenx = 128;
    gscreeny = 64;
    nostartchange = true;
}
if (room == room_dw_b3bs_sadshadowguys)
{
    skipcrt = true;
    playx = 192;
    playy = 224;
    gscreenw = 640;
    gscreenh = 192;
    gscreenx = 160;
    gscreeny = 96;
    camx = 160;
    camy = 0;
    with (instance_create(gscreenx, gscreeny, obj_board_screen))
    {
        screenwidth = other.gscreenw;
        screenheight = other.gscreenh;
        depth = 100000;
    }
}
if (room == room_dw_b3bs_mysterypuzzle)
{
    skipcrt = true;
    playx = 192;
    playy = 224;
    gscreenw = 352;
    gscreenh = 224;
    gscreenx = 128;
    gscreeny = 64;
    camx = 0;
    camy = 0;
    with (instance_create(gscreenx, gscreeny, obj_board_screen))
    {
        screenwidth = other.gscreenw;
        screenheight = other.gscreenh;
        depth = 100000;
    }
}
if (room == room_dw_b3bs_extrapuzzle)
{
    scr_depth();
    skipcrt = true;
    playx = 352;
    playy = 224;
    gscreenw = 352;
    gscreenh = 224;
    gscreenx = 224;
    gscreeny = 96;
    canswitch = false;
    camx = 80;
    camy = 0;
    with (instance_create(gscreenx, gscreeny, obj_board_screen))
    {
        screenwidth = other.gscreenw;
        screenheight = other.gscreenh;
        depth = 100000;
    }
}
if (room == room_dw_teevie_shadow_guys)
{
    skipcrt = true;
    playx = 1560;
    playy = 224;
    gscreenw = 1280;
    gscreenh = 160;
    gscreenx = 408;
    gscreeny = 96;
    camera = false;
    nocamera = true;
    canswitch = false;
    camx = 1194;
    camy = 0;
    with (instance_create(gscreenx, gscreeny, obj_board_screen))
    {
        screenwidth = other.gscreenw;
        screenheight = other.gscreenh;
        depth = 100000;
    }
}
if (room == room_dw_teevie_susiebridge)
{
    skipcrt = true;
    skipcrt = true;
    playx = 208;
    playy = 144;
    gscreenw = 384;
    gscreenh = 256;
    gscreenx = 160;
    gscreeny = 64;
    camera = false;
    nocamera = true;
    camx = 16;
    camy = 0;
    with (instance_create(gscreenx, gscreeny, obj_board_screen))
    {
        screenwidth = other.gscreenw;
        screenheight = other.gscreenh;
        depth = 100000;
    }
}
depth = 5;
if (room == room_dw_puzzlecloset_1 || room == room_dw_puzzlecloset_2 || room == room_dw_puzzlecloset_3)
    sprite_index = spr_ch3_dw_b3bs_console_pc;
mymarker = scr_dark_marker(x, y, sprite_index);
mymarker.depth = 99700;
swordinteract = 0;
