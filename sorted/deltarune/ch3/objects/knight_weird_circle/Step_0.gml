if (hellzone)
{
    if (alarm[1] > 13)
        alarm[1] = 13;
}
timer++;
if (alarm[1])
{
    r += (191 / rgb_rate);
    g += (191 / rgb_rate);
    b += (191 / rgb_rate);
    if (alarm[1] < 16 && (alarm[1] % 4) == 0)
        scr_afterimage_grow_attached(id, image_blend, false);
}
