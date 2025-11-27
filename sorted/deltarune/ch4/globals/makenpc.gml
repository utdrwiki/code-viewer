function scr_makenpc(arg0 = "", arg1 = "", arg2 = false)
{
    var _mylayer = layer_get_id(arg0);
    if (_mylayer == -1)
    {
        debug_print("Warning: Check Output Console");
        debug_message("scr_makenpc(" + arg0 + "," + arg1 + ") Result: Layer Not Found");
        return -4;
    }
    var sourcenpc = layer_sprite_get_id(_mylayer, arg1);
    if (sourcenpc == -1)
    {
        var _result = "scr_makenpc(\"" + arg0 + "\",\"" + arg1 + "\") Result: Sprite Not Found";
        debug_message(_result);
        debug_print("Warning: Check Output Console");
        return -4;
    }
    var _mysprite = layer_sprite_get_sprite(sourcenpc);
    var _myx = layer_sprite_get_x(sourcenpc);
    var _myy = layer_sprite_get_y(sourcenpc);
    var _myxscale = layer_sprite_get_xscale(sourcenpc);
    var _myyscale = layer_sprite_get_yscale(sourcenpc);
    var _myalpha = layer_sprite_get_alpha(sourcenpc);
    var _myangle = layer_sprite_get_angle(sourcenpc);
    var _myblend = layer_sprite_get_blend(sourcenpc);
    var _myspeed = layer_sprite_get_speed(sourcenpc);
    var _myindex = layer_sprite_get_index(sourcenpc);
    var _npc = instance_create_depth(0, 0, 0, obj_trigger_interact);
    _npc.marker = scr_marker_ext(_myx, _myy, _mysprite, _myxscale, _myyscale, 0, _myindex, _myblend, undefined, undefined, undefined, _myalpha);
    var truex = _npc.marker.bbox_left;
    var truey = _npc.marker.bbox_top;
    var truexscale = _npc.marker.bbox_right - _npc.marker.bbox_left;
    var trueyscale = _npc.marker.bbox_bottom - _npc.marker.bbox_top;
    setxy(truex, truey, _npc);
    _npc.markerxoffset = truex - _npc.marker.x;
    _npc.markeryoffset = truey - _npc.marker.y;
    _npc.markerstick = true;
    scr_sizeexact(truexscale, trueyscale, _npc);
    if (arg2)
    {
        _npc.visible = true;
        _npc.image_alpha = 1;
    }
    _npc.strict = true;
    _npc.issolid = true;
    _npc.talked = 0;
    scr_depth_alt(_npc.marker);
    return _npc;
}

function scr_makenpc_fromasset(arg0, arg1 = false)
{
    var sourcenpc = arg0;
    var _mysprite = layer_sprite_get_sprite(sourcenpc);
    var _myx = layer_sprite_get_x(sourcenpc);
    var _myy = layer_sprite_get_y(sourcenpc);
    var _myxscale = layer_sprite_get_xscale(sourcenpc);
    var _myyscale = layer_sprite_get_yscale(sourcenpc);
    var _myalpha = layer_sprite_get_alpha(sourcenpc);
    var _myangle = layer_sprite_get_angle(sourcenpc);
    var _myblend = layer_sprite_get_blend(sourcenpc);
    var _myspeed = layer_sprite_get_speed(sourcenpc);
    var _myindex = layer_sprite_get_index(sourcenpc);
    var _npc = instance_create_depth(0, 0, 0, obj_trigger_interact);
    _npc.marker = scr_marker_ext(_myx, _myy, _mysprite, _myxscale, _myyscale, 0, _myindex, _myblend, undefined, undefined, undefined, _myalpha);
    var truex = _npc.marker.bbox_left;
    var truey = _npc.marker.bbox_top;
    var truexscale = _npc.marker.bbox_right - _npc.marker.bbox_left;
    var trueyscale = _npc.marker.bbox_bottom - _npc.marker.bbox_top;
    setxy(truex, truey, _npc);
    _npc.markerxoffset = truex - _npc.marker.x;
    _npc.markeryoffset = truey - _npc.marker.y;
    _npc.markerstick = true;
    scr_sizeexact(truexscale, trueyscale, _npc);
    if (arg1)
    {
        _npc.visible = true;
        _npc.image_alpha = 1;
    }
    _npc.strict = true;
    _npc.issolid = true;
    _npc.talked = 0;
    scr_depth_alt(_npc.marker);
    return _npc;
}
