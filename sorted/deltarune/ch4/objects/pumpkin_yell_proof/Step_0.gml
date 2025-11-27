if (init == 0)
{
    snd_stop(snd_pumpkin_scream);
    snd_stop(snd_pumpkin_scream_mama);
    screamsound = snd_loop(snd_pumpkin_scream_mama);
    init = 1;
    screamcon = 3;
}
snd_pitch(screamsound, 1 + (mercy / 34));
jumptimer++;
if (jumptimer >= jumpthreshold)
{
    var audiopos = audio_sound_get_track_position(screamsound);
    audio_sound_set_track_position(screamsound, audiopos + random_range(-3, 3));
    jumptimer = 0;
    jumpthreshold = 2 + random(17);
}
if (screamcon == 0)
{
}
if (screamcon == 1)
{
    snd_pause(screamsound);
    screamcon = 0;
}
if (screamcon == 2)
{
    snd_resume(screamsound);
    screamcon = 3;
}
if (screamcon == 3)
{
    x += random_range(-1, 1);
    y += random_range(-1, 1);
}
if (scr_debug())
{
    if (keyboard_check_pressed(vk_backspace))
        init = 0;
    if (keyboard_check_pressed(vk_space))
        screamcon = choose(1, 2);
    if (up_h())
        mercy++;
    if (down_h())
        mercy--;
    if (mercy >= 100)
        mercy = 100;
    if (mercy < 0)
        mercy = 0;
    image_xscale = 2 - (mercy / 100);
    image_yscale = 2 - (mercy / 100);
}
