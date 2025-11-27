function scr_sizeexact(arg0, arg1)
{
    if (!sprite_exists(sprite_index))
    {
        debug_message("Can't size, no sprite");
        exit;
    }
    var _w = sprite_get_width(sprite_index);
    var _h = sprite_get_width(sprite_index);
    image_xscale = arg0 / _w;
    image_yscale = arg1 / _h;
}
