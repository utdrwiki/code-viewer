event_inherited();
timer++;
if (nosfx == false)
{
    if (timer == 3)
    {
        snd_stop(snd_knight_fallingsword);
        snd_play_x(snd_knight_fallingsword, 1, 1);
    }
    if (timer > 2 && timer < 20)
        snd_pitch(_snd, 3.3 - ((timer - 3) / 5));
    if (timer == 31)
    {
        if (finalsword == false)
        {
        }
        else
        {
            snd_play_x(snd_knight_fallingsword_big, 1, 1);
        }
    }
}
else if (timer == 1)
{
    _snd = snd_play(snd_heavy_passing);
    snd_volume(snd_heavy_passing, 1, 0);
}
i = max_old - 1;
while (i > 0)
{
    old_x[i] = old_x[i - 1];
    old_y[i] = old_y[i - 1];
    old_angle[i] = old_angle[i - 1];
    i--;
}
old_x[0] = x;
old_y[0] = y;
old_angle[0] = image_angle;
if (alarm[0] == -1)
    speed = scr_approach(speed, 18, 0.6 + (speed_gain * sign(speed)));
if (speed && finalsword)
    speed += 2.4;
