var sendaway = true;
if (active)
{
    if (edge)
        sendaway = false;
    else
        sendaway = true;
    var _list = ds_list_create();
    var _num = instance_place_list(x, y, 264, _list, false);
    if (_num > 0)
    {
        for (var i = 0; i < _num; i++)
        {
            if (ds_list_find_value(_list, i).edge != edge)
                sendaway = true;
        }
    }
    ds_list_destroy(_list);
}
if (sendaway == false)
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
        x = room_width + room_height;
        y = x;
    }
}
