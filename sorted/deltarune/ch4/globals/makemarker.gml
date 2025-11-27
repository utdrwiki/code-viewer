function scr_makemarker(arg0 = "", arg1 = "", arg2 = depth, arg3 = -1, arg4 = false, arg5 = -1, arg6 = false)
{
    var _mylayer = layer_get_id(arg0);
    if (_mylayer == -1)
    {
        debug_print("Warning: Check Output Console");
        debug_message("scr_makenpc(" + arg0 + "," + arg1 + ") Result: Layer Not Found");
        return -4;
    }
    var sourcesprite = layer_sprite_get_id(_mylayer, arg1);
    if (sourcesprite == -1)
    {
        var _result = "scr_makenpc(\"" + arg0 + "\",\"" + arg1 + "\") Result: Sprite Not Found";
        debug_message(_result);
        debug_print("Warning: Check Output Console");
        return -4;
    }
    var _mysprite = layer_sprite_get_sprite(sourcesprite);
    var _myx = layer_sprite_get_x(sourcesprite);
    var _myy = layer_sprite_get_y(sourcesprite);
    var _myxscale = layer_sprite_get_xscale(sourcesprite);
    var _myyscale = layer_sprite_get_yscale(sourcesprite);
    var _myalpha = layer_sprite_get_alpha(sourcesprite);
    var _myangle = layer_sprite_get_angle(sourcesprite);
    var _myblend = layer_sprite_get_blend(sourcesprite);
    var _myspeed = layer_sprite_get_speed(sourcesprite);
    var _myindex = layer_sprite_get_index(sourcesprite);
    var _marker = scr_marker_ext(_myx, _myy, _mysprite, _myxscale, _myyscale, _myspeed, _myindex, _myblend, arg2, arg3, arg5, _myalpha);
    if (arg4)
    {
        var mysolid = instance_create(0, 0, obj_solidblock);
        var truex = _marker.bbox_left;
        var truey = _marker.bbox_top;
        var truexscale = _marker.bbox_right - _marker.bbox_left;
        var trueyscale = _marker.bbox_bottom - _marker.bbox_top;
        if (arg6 && scr_debug())
        {
            mysolid.sprite_index = spr_pxwhite;
            mysolid.image_blend = c_red;
            mysolid.image_alpha = 0.4;
            mysolid.visible = true;
            mysolid.depth = 0;
        }
        setxy(truex, truey, mysolid);
        scr_sizeexact(truexscale, trueyscale, mysolid);
        with (mysolid)
            scr_stickto(_marker, 0);
    }
    return _marker;
}
