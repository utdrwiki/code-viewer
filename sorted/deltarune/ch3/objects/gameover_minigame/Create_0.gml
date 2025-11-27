con = 0;
init = 0;
depth = 5100;
with (obj_chefs_scoretxt)
    instance_destroy();
if (room == room_dw_susiezilla && i_ex(obj_minigame_quit_ui) && obj_minigame_quit_ui.canceltimer >= obj_minigame_quit_ui.canceltime)
    global.screenshot = sprite_create_from_surface(application_surface, 0, 0, __view_get(e__VW.WView, 0), __view_get(e__VW.HView, 0), 0, 0, 0, 0);
else
    global.screenshot = sprite_create_from_surface(application_surface, camerax(), cameray(), __view_get(e__VW.WView, 0), __view_get(e__VW.HView, 0), 0, 0, 0, 0);
with (obj_chef_controls_ui)
    con = 2;
timer = 0;
staticindex = 0;
tone_saturation = 1;
tone_brightness = 1;
tone_factor = 0;
staticalpha = 0;
grayalpha = 0;
tenna = 0;
blackalpha = 0;
countdown = false;
countdown_timer = 0;
countdown_text = 3;
tenna_arrive = false;
tenna_arrive_timer = 0;
orchhit_pitch = 1;
retry_game = false;
retry_timer = 0;
boardfail = 0;
if (room == room_board_1 || room == room_board_2 || room == room_board_3)
    boardfail = 1;
drawblackbg = global.fighting;
replayversion = false;
quitversion = false;
replaywin = false;
quittimer = 0;
quitcon = 0;
susiezillafix = 0;
inbattle = 0;
if (i_ex(obj_gameshow_battlemanager))
    inbattle = 1;
if (room == room_dw_chef)
    countdown_text = 0;

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
