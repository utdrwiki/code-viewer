con = 0;
init = 0;
depth = 5100;
global.screenshot = sprite_create_from_surface(application_surface, camerax(), cameray(), __view_get(e__VW.WView, 0), __view_get(e__VW.HView, 0), 0, 0, 0, 0);
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
rewind = false;
rewind_start = 0;
rewind_timer = 0;
tenna_arrive = false;
tenna_arrive_timer = 0;
orchhit_pitch = 1;
retry_game = false;
retry_timer = 0;
boardfail = 0;
replayversion = false;
quitversion = false;
replaywin = false;
quittimer = 0;
quitcon = 0;
susiezillafix = 0;
inbattle = 0;

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
