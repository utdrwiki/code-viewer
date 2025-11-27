scr_depth();
dk = -4;
panel_sprite = 2925;
panel_alpha = 0;
panel_rot = -45;
panel_x = 191;
panel_y = 1128;
panel_fall = false;
panel_fall_timer = 0;
if (global.chapter == 3 && global.plot < 340)
{
    if (!snd_is_playing(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init("mus_birdnoise.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
    }
    dk = snd_loop(snd_smile);
    snd_volume(dk, 0, 0);
    snd_pitch(dk, 0.15);
}
