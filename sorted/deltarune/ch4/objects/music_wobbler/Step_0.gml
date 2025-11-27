if (!snd_is_playing(global.currentsong[1]))
{
    global.currentsong[0] = snd_init("castletown.ogg");
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
}
if (auto)
{
    if (init == 0)
    {
        init = 1;
        active = true;
        strength = 0;
        timer = -1200;
    }
    if (timer < 180)
        timer++;
    strength = remap_clamped(320, 640, 0, 0.1, camerax()) * max(0, timer / 180);
}
if (scr_debug() && sunkus_kb_check_pressed(77))
{
    if (!snd_is_playing(global.currentsong[1]))
    {
        global.currentsong[0] = snd_init("castletown.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1);
    }
    else
    {
        active = !active;
    }
    siner = 0;
}
if (active && snd_is_playing(global.currentsong[1]))
{
    siner++;
    if (strength < 30 && !auto)
        strength += 0.5;
    snd_pitch(global.currentsong[1], 1 + (sin(siner / 4) * 0.05 * (strength / 30)));
}
if (!active && strength > 0)
{
    strength -= 3;
    snd_pitch(global.currentsong[1], 1 + (sin(siner / 4) * 0.05 * (strength / 30)));
}
