with (obj_sprhighlight)
{
    if (auto_color)
        image_blend = scr_get_outline_color(target);
    else
        image_blend = other.highlight_color;
    darkness_tint = other.tint;
}
with (obj_floorshadow)
    image_alpha = other.strength;
