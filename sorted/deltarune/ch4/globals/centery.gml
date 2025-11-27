function centery()
{
    var trueycenter;
    if (argument_count == 0)
    {
        var y1 = y - (sprite_get_yoffset(sprite_index) * image_yscale);
        var y2 = y1 + sprite_height;
        trueycenter = (y1 + y2) / 2;
    }
    if (argument_count == 1)
    {
        var y1 = y - (sprite_get_yoffset(argument0.sprite_index) * argument0.image_yscale);
        var y2 = y1 + (sprite_get_height(argument0.sprite_index) * argument0.image_yscale);
        trueycenter = (y1 + y2) / 2;
    }
    if (argument_count == 2)
    {
        if (argument[1] != 0)
            trueycenter = (bbox_top + bbox_bottom) / 2;
    }
    return trueycenter;
}
