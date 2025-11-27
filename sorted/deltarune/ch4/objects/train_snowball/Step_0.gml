if (falling)
{
    fall_timer++;
    var _factor = clamp(fall_timer / fall_duration, 0, 1);
    x = lerp(old_x, fall_x, _factor);
    y = lerp(old_y, fall_y, _factor) + (sin(_factor * pi) * -fall_height);
    if (fall_timer >= fall_duration)
    {
        falling = false;
        fall_timer = 0;
        snd_play(snd_noise);
    }
}
