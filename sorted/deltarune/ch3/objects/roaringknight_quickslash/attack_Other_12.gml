x = obj_growtangle.x - abs(x - obj_growtangle.x);
image_xscale = abs(image_xscale) * -1;
if (image_alpha == 0)
{
    knight.image_alpha = 0;
    image_alpha = 1;
}
if (image_index >= 4)
    image_index = 1;
else
    image_index = 4;
animtimer = 0;
slash_anim_count++;
if (final_slash_anim)
    recoil = 6;
else
    x += 2;
aetimer = -1;
