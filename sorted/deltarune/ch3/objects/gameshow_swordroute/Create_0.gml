setxy(0, 0);
if (room == room_board_sword_intro)
{
    if (global.flag[1055] >= 6 && global.flag[1278] == 1)
    {
        soda = instance_create(436, 354, obj_swordroute_event_susiesoda);
        soda.depth = 99990;
        soda.image_blend = merge_color(c_white, c_black, 0.5);
    }
}
if (scr_debug())
    scr_setparty(0, 0, 0);
kris = 1185;
kris.freeze = true;
kris.fun = true;
kris.sprite_index = spr_krisu_holdcontroller;
highlight = instance_create(x, y, obj_sprhighlight);
highlight.target = 1185;
highlight.match_depth = false;
highlight.depth = 0;
highlight.mustbevisible = false;
highlight.outline_only = true;
if (room != room_board_sword_intro)
{
    with (kris)
        setxy(300, 298);
    global.facing = 2;
}
with (kris)
    visible = false;
with (obj_mainchara)
    var cutscene = 1;
depth = 99980;
gameconsole = scr_dark_marker(202, 322, spr_gameshow_console);
gameconsole.depth = 99985;
gameconsole.image_blend = merge_color(c_black, c_white, 0.5);
couch = scr_dark_marker(0, 452, spr_gameshow_couch);
couch.depth = 950000;
couch.visible = false;
bg = scr_dark_marker(0, 0, spr_gameshow_swordroutebg);
bg.depth = 99994;
lilkris = 0;
if (!variable_global_exists("swordscreencolor"))
    global.swordscreencolor = c_black;
screenalpha = 0.5;
colorchange = 0;
colorchangetime = 5;
screencolor = global.swordscreencolor;
newcolor = global.swordscreencolor;
krishadow = 1;
shadowfade = 0;
skip = false;
skiponce = false;
nochange = 0;
drawshadow = true;
disableshadow = false;
god = false;
drawui = true;
depth = 5000;
var playable = true;
if (room == room_board_sword_intro)
{
    if (global.plot < 121)
        global.plot = 121;
    drawui = false;
    obj_board_controller.drawcrt = false;
    global.swordscreencolor = c_black;
    newcolor = 0;
    screencolor = c_black;
    skip = true;
    kris.fun = false;
    kris.freeze = false;
    if (global.plot >= 121 && global.plot <= 129 && global.flag[1055] == 1)
        playable = false;
    if (global.plot >= 160 && global.plot < 180 && global.flag[1055] == 3)
        playable = false;
    if (global.plot >= 180 && global.flag[1055] > 2 && global.flag[1055] < 6)
        playable = true;
    if (global.flag[1055] >= 6)
        playable = false;
    if (playable)
    {
        var cutscene = instance_create(282, 322, obj_swordroute_consolestarter);
    }
    else
    {
        with (instance_create(0, 0, obj_board_solid))
        {
            image_xscale = 100;
            image_yscale = 100;
        }
        with (obj_mainchara_board)
        {
            controlled = 0;
            visible = false;
        }
    }
}
if (room == room_board_1_sword_trees || room == room_board_dungeon_2 || room == room_board_sword_intro)
{
    var sol = instance_create(0, 376, obj_solidblocksized);
    sol.image_xscale = 50;
    sol = instance_create(0, 308, obj_solidblocksized);
    sol.image_xscale = 50;
    sol = instance_create(-34, 348, obj_solidblocksized);
    var door = instance_create(620, 320, obj_doorAny);
    door.doorEntrance = "A";
    door.doorFadeMusic = 1;
    door.doorRoom = room_dw_console_room;
}
global.flag[7] = 1;
if (room == room_board_2_sword)
{
    drawui = true;
    colorchange = true;
    screencolor = c_black;
    newcolor = screencolor;
    global.swordscreencolor = screencolor;
    skip = true;
}
if (room == room_board_3_sword || room == room_board_dungeon_3)
{
    drawui = true;
    colorchange = true;
    screencolor = c_black;
    global.swordscreencolor = screencolor;
    skip = true;
}
if (room == room_board_preshadowmantle || room == room_board_preshadowmantle_repeat)
{
    drawui = true;
    if (global.plot < 180)
        global.plot = 180;
    colorchange = true;
    newcolor = screencolor;
    global.swordscreencolor = screencolor;
    colorchange = 5;
    skip = true;
    if (room == room_board_preshadowmantle)
        drawui = true;
}
if (room == room_board_prepostshadowmantle)
{
    colorchange = true;
    screencolor = #0033FF;
    newcolor = screencolor;
    global.swordscreencolor = screencolor;
    skip = true;
    drawui = true;
}
if (room == room_board_preshadowmantle || room == room_board_preshadowmantle_repeat || room == room_shadowmantle || room == room_board_postshadowmantle || room == room_board_prepostshadowmantle || room == room_board_1_sword_trees)
{
    with (obj_mainchara_board)
    {
        xp = 0;
        swordlv = 5;
        xptolevel = 68;
        sword = true;
    }
}
if (room == room_board_dungeon_2)
{
    if (global.plot < 160)
        global.plot = 160;
    with (obj_mainchara_board)
    {
        facing = 2;
        swordlv = 2;
        xp = 0;
    }
}
debugdraw = 0;
if (room == room_board_1_sword || room == room_board_1_sword_trees || room == room_board_2_sword || room == room_board_dungeon_2 || room == room_board_dungeon_3)
{
    global.flag[6] = 0;
    global.flag[7] = 1;
}
if (room == room_board_1_sword || room == room_board_dungeon_2 || room == room_board_dungeon_3)
{
    screencolor = c_black;
    newcolor = 0;
    screencolor = c_black;
    colorchange = -1;
}
if (room == room_board_1_sword_trees)
    screencolor = #FFF800;
killcount = 0;
siner = 0;
if (!playable)
{
    global.flag[7] = 0;
    with (obj_gameshow_swordroute)
    {
        depth = 999980;
        bg.depth = 999994;
        gameconsole.depth = 999985;
    }
    with (obj_mainchara_board)
        ignoredepth = 1;
    with (obj_board_controller)
        depth = 999980;
    with (obj_marker)
    {
        if (x == 0 && y == 380)
            depth = 999979;
    }
    with (obj_mainchara)
    {
        ignoredepth = 1;
        depth = 999979;
    }
}
