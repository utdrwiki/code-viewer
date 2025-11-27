with (obj_trigger)
{
    if (extflag == "BLACKOUT")
    {
        with (instance_create(x, y, obj_solidblock))
        {
            visible = true;
            depth = layer_get_depth("RIPPLEWALLS") - 10;
            sprite_index = spr_pxwhite;
            scr_sizeexact(other.sprite_width, other.sprite_height);
            image_blend = c_black;
            image_alpha = 0;
            scr_lerpvar("image_alpha", 0, 1, 6);
        }
        var _list = ds_list_create();
        var _num = instance_place_list(x, y, 769, _list, false);
        if (_num > 0)
        {
            for (var i = 0; i < _num; i++)
                instance_destroy(ds_list_find_value(_list, i));
        }
        ds_list_destroy(_list);
        instance_destroy();
    }
}
