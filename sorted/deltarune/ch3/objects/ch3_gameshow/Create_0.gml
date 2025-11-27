if (scr_debug())
{
    if (!(scr_havechar(2) && scr_havechar(3)))
    {
        scr_losechar();
        scr_getchar(2);
        scr_getchar(3);
        room_restart();
    }
    global.flag[7] = 1;
}
global.facing = 2;
kris = 1185;
kris.freeze = true;
ralsei = 0;
susie = 0;
init = 0;
with (obj_mainchara)
    cutscene = 1;
depth = 100000;
gameconsole = scr_dark_marker(202, 322, spr_gameshow_console);
gameconsole.depth = 99985;
wires = scr_dark_marker(gameconsole.x + 84, gameconsole.y + 24, spr_controllerwires_ksr);
wires.depth = gameconsole.depth - 1;
couch = scr_dark_marker(0, 452, spr_gameshow_couch);
couch.depth = 94980;
playerpodiums = scr_dark_marker(128, 438, spr_gameshow_playerpodiums);
playerpodiums.depth = couch.depth + 1;
bgfloor = scr_dark_marker(0, 318, spr_gameshow_floor);
bgfloor.depth = 99994;
bgwall = scr_dark_marker(0, 0, spr_gameshow_wall);
bgwall.depth = 99995;
tvframe = scr_dark_marker(96, 0, spr_gameshow_tvframe);
tvframe.depth = 99990;
tenna = instance_create(484, 576, obj_actor_tenna);
tenna.preset = 0;
tenna.depth = couch.depth + 200;
tenna.auto_depth = 0;
tenna.sprite_index = spr_tenna_faceaway;
kris_board = 0;
susie_board = 0;
ralsei_board = 0;
kr_healthbar = 0;
su_healthbar = 0;
ra_healthbar = 0;
inventory = 0;
scoreboard = 0;
talkcon = 0;
invulnerable = 0;
couchsolid = instance_create(couch.x, couch.y + 20, obj_solidblocksized);
couchsolid.image_xscale = sprite_get_width(couch.sprite_index) / 20;
if (room == room_board_1)
{
    pausetime = 15;
    transition = instance_create(0, 0, obj_board_transition);
    transition.prefill = 1;
    transition.con = 2;
    transition.timer = 13;
}
boardmusic = "board_zelda.ogg";
if (room == room_board_2)
    boardmusic = "tenna_island.ogg";
if (room == room_board_3)
    boardmusic = "ch3_board3.ogg";
if (room == room_board_3b)
    boardmusic = "ch3_board3.ogg";
