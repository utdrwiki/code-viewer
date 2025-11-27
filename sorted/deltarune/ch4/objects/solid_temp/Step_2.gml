if (active)
{
    with (mysolid)
    {
        x = other.x;
        y = other.y;
        image_xscale = other.image_xscale;
        image_yscale = other.image_yscale;
        image_angle = other.image_angle;
        sprite_index = other.sprite_index;
        image_index = other.image_index;
    }
}
else
{
    with (mysolid)
    {
        if (x == other.x)
        {
            x = room_width + room_height;
            y = x;
        }
    }
}
