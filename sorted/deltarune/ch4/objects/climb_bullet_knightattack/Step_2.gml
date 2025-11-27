var xx = camerax();
var yy = cameray();
timer++;
if (config == 0)
{
    fallspeed = 2;
    if (timer == 1)
    {
        var fadeintime = clamp(delay, 4, 10);
        image_alpha = 0;
        scr_lerpvar("image_alpha", 0, 1, fadeintime, 2, "in");
        snd_play(snd_spearappear);
        snd_stop(snd_spearappear);
    }
    if (timer < delay)
        y = yy + 60;
    if (timer == delay)
    {
        snd_stop(snd_chargeshot_fire);
        snd_play(snd_chargeshot_fire, 1, 1.4);
        gravity = fallspeed;
    }
    if (timer > delay)
    {
        if ((timer % 2) == 0)
            scr_afterimagefast();
        if (y > (yy + 480 + 120))
            instance_destroy();
    }
}
