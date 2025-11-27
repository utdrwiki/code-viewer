var kris = instance_place(x, y, obj_mainchara);
if (i_ex(kris))
{
    if (push_up)
        kris.y -= push_up;
    if (push_down)
        kris.y += push_down;
    if (push_left)
        kris.x -= push_left;
    if (push_right)
        kris.x += push_right;
}
if (push_cat)
{
    var _list = ds_list_create();
    var _num = instance_place_list(x, y, 1235, _list, false);
    if (_num > 0)
    {
        for (var i = 0; i < _num; i++)
        {
            var thiscat = ds_list_find_value(_list, i);
            if (push_up)
                thiscat.y -= push_up;
            if (push_down)
                thiscat.y += push_down;
            if (push_left)
                thiscat.x -= push_left;
            if (push_right)
                thiscat.x += push_right;
            with (thiscat)
                scr_caterpillar_interpolate_old();
        }
    }
    ds_list_destroy(_list);
}
