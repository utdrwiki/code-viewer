image_alpha = 0.1;
var _list = ds_list_create();
var _num = instance_place_list(x, y, 1285, _list, false);
if (_num > 0)
{
    for (var i = 0; i < _num; i++)
    {
        with (ds_list_find_value(_list, i))
        {
            if (!negasoliddisable)
            {
                other.image_alpha = 1;
                active = other.activate;
            }
        }
    }
}
ds_list_destroy(_list);
image_alpha = 0;
