pan_in = 0;
hold = 20;
pan_out = 0;
pan_x = 0;
sus_mult = 1;
pan_mult = 0;
with (obj_susiezilla_gamecontroller)
{
    if (wave == 4)
        other.pan_x = (width * 0.5) - 480;
    if (wave == 8)
        other.pan_x = (width * 0.5) - 520;
}
alarm[0] = 40;
