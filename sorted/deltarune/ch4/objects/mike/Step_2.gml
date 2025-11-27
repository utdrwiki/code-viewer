if (i_ex(readable))
{
    var _xx = sprite_width * 0.1;
    var _yy = sprite_height - 40;
    if (act == 1 || act == 3)
        _yy = -100000;
    with (readable)
    {
        image_xscale = 4;
        x = other.x + _xx;
        y = other.y + _yy;
    }
}
if (act == 0)
{
    x = clamp(x, 0, room_width - sprite_width);
    y = clamp(y, 0, room_height - sprite_height);
}
var ob = collision_rectangle(bbox_left + xoff, bbox_top + yoff, bbox_right + xoff, bbox_bottom + yoff, obj_mike, 0, 1);
if (ob && act == 0 && ob.act == 0)
{
    blush = 1;
    with (obj_mike_minigame_tv)
    {
        if (aww == 0)
            aww = 1;
    }
}
else
{
    blush = 0;
}
