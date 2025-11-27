active = false;
shift = "none";
con = 0;
moving = 0;
tileLayer = layer_get_id("BOARD_Tiles");
tileLayer2 = layer_get_id("BOARD_Tiles_alt");
assetLayer = layer_get_id("BOARD_Assets");
warpx = 0;
warpy = 0;
playerX = 0;
playerY = 0;
timer = 0;
movespeed = 8;
gamescreenWidth = 384;
gamescreenHeight = 256;
extflag = 0;
movetype = 0;
init = false;
activecheck = 0;
instawarp = false;
camsavex = 0;
camsavey = 0;
instawarproomgoto = -4;
krissavex = 0;
krissavey = 0;
sussavex = 0;
sussavey = 0;
ralsavex = 0;
ralsavey = 0;
board_2_maze_state = 0;
ref = layer_get_id("BoardAreaReferences");
if (ref != -1)
    layer_set_visible(ref, 0);
roomStartingX = 0;
roomStartingY = 0;
if (room == room_adventureboardtest)
{
    roomStartingX = 128;
    roomStartingY = 320;
}
if (room == room_board_1 || room == room_board_1_sword)
{
    roomStartingX = 896;
    roomStartingY = 64;
}
if (room == room_board_2)
{
    roomStartingX = 1664;
    roomStartingY = 3136;
}
if (room == room_board_3 || room == room_board_3_sword)
{
    roomStartingX = 1280;
    roomStartingY = 320;
}
if (room == room_board_3b)
{
    roomStartingX = 1664;
    roomStartingY = 1600;
    if (global.flag[1055] == 6)
        roomStartingY = 1344;
}
if (room == room_board_dungeon_2)
{
    roomStartingX = 1280;
    roomStartingY = 1856;
}
if (room == room_board_dungeon_3)
{
    roomStartingX = 896;
    roomStartingY = 1344;
}
if (room == room_board_boattest)
{
    roomStartingX = 896;
    roomStartingY = 1600;
}
if (room == room_shadowmantle)
{
    roomStartingX = 128;
    roomStartingY = 64;
}
if (room == room_board_postshadowmantle || room == room_board_sword_intro)
{
    roomStartingX = 128;
    roomStartingY = 64;
}
if (room == room_board_tests || room == room_board_intro || room == room_board_gsa02_b0 || room == room_board_preshadowmantle || room == room_board_preshadowmantle_repeat)
{
    roomStartingX = 128;
    roomStartingY = 320;
}
if (room == room_board_prepostshadowmantle)
{
    roomStartingX = 128;
    roomStartingY = 320;
}
if (room == room_board_2_sword)
{
    roomStartingX = 2432;
    roomStartingY = 3648;
}
if (room == room_dw_b3bs_bibliox)
{
    roomStartingX = 128;
    roomStartingY = 96;
}
if (room == room_dw_puzzlecloset_3)
{
    roomStartingX = 2688;
    roomStartingY = 608;
}
if (i_ex(obj_board_instawarp_helper) && obj_board_instawarp_helper.camx != 0 && obj_board_instawarp_helper.camy != 0)
{
    roomStartingX = obj_board_instawarp_helper.camx;
    roomStartingY = obj_board_instawarp_helper.camy;
}
var skipmove = 0;
if (room == room_dw_b3bstest || room == room_dw_b3bstest_big)
    skipmove = true;
if (i_ex(obj_b3bs_console))
    skipmove = true;
originX = layer_get_x(tileLayer);
originY = layer_get_y(tileLayer);
if (!skipmove)
{
    var moveX = 128 - roomStartingX - originX;
    var moveY = 64 - roomStartingY - originY;
    with (obj_board_parent)
        setxy(x + moveX, y + moveY);
    layer_x(tileLayer, layer_get_x(tileLayer) + moveX);
    layer_y(tileLayer, layer_get_y(tileLayer) + moveY);
    layer_x(assetLayer, layer_get_x(assetLayer) + moveX);
    layer_y(assetLayer, layer_get_y(assetLayer) + moveY);
    layer_x(tileLayer2, layer_get_x(tileLayer2) + moveX);
    layer_y(tileLayer2, layer_get_y(tileLayer2) + moveY);
}
if (room == room_board_dungeon_2)
{
    dontfollow = instance_create(room_width, room_height, obj_board_trigger);
    obj_board_trigger.visible = true;
    obj_board_trigger.image_alpha = 0.5;
    dontfollow.extflag = "dontfollow";
}
