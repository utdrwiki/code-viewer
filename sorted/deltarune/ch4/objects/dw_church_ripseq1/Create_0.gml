con = 0;
timer = 0;
init = 0;
siner = 0;
chaser = 0;
layer_set_visible("DEBUG_ASSETS", 0);
if (scr_debug())
{
    scr_setparty(1, 1);
    if (keyboard_check(ord("P")))
    {
        setxy(2850, 1040, 1049);
        con = 3;
    }
}
var doaudio = true;
if (doaudio)
{
    snd_stop(global.currentsong[0]);
    snd_stop(global.currentsong[1]);
    song = "darkchurch_intro.ogg";
    global.currentsong[0] = snd_init(song);
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
    audio_sound_gain(global.currentsong[1], 0, 0 / fps);
    audio_sound_gain(global.currentsong[1], 0.7, 30000 / fps);
}
ripplemanager = instance_create(x, y, obj_church_ripple_area_manager);
ripplemanager.alwaysrip = true;
makerip = 0;
nextroom = 0;
