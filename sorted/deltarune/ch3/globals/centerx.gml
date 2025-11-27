function centerx()
{
    var truexcenter;
    if (argument_count == 0)
    {
        var x1 = x - (sprite_get_xoffset(sprite_index) * image_xscale);
        var x2 = x1 + sprite_width;
        truexcenter = (x1 + x2) / 2;
    }
    if (argument_count == 1)
    {
        var x1 = x - (sprite_get_xoffset(argument0.sprite_index) * argument0.image_xscale);
        var x2 = x1 + (sprite_get_width(argument0.sprite_index) * argument0.image_xscale);
        truexcenter = (x1 + x2) / 2;
    }
    if (argument_count == 2)
    {
        if (argument[1] != 0)
            truexcenter = (bbox_left + bbox_right) / 2;
    }
    return truexcenter;
}
