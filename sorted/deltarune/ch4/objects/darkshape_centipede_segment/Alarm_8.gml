with (scr_afterimage_grow())
{
    if (other.image != 0)
    {
        sprite_index = other.shrink_sprite;
        image_index = other.image;
    }
    else
    {
        image_index = other.image_index;
    }
    fade *= 2;
    xrate *= 0.5;
    yrate *= 0.5;
}
xscale *= 2;
yscale *= 2;
