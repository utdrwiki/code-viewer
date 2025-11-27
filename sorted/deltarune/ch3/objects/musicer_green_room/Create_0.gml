if (global.plot < 121)
    exit;
if (global.plot >= 150 && global.plot < 160)
    exit;
var _track_id = "greenroom_detune.ogg";
var _pitch = 1;
if (global.plot >= 280 && room == room_dw_green_room)
{
    _track_id = "tv_results_screen.ogg";
    _pitch = 0.4;
}
if (!snd_is_playing(global.currentsong[1]))
{
    global.currentsong[0] = snd_init(_track_id);
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, _pitch);
}
