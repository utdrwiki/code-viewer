if (i_ex(target))
{
    var maxblend = clamp(blendindex, 0, 1);
    target.image_blend = merge_color(color1, color2, maxblend);
}
if (!i_ex(target))
    instance_destroy();
