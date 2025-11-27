function scr_assetloc(arg0 = "", arg1 = "")
{
    var _mylayer = layer_get_id(arg0);
    if (_mylayer == -1)
    {
        debug_print("Warning: Check Output Console");
        debug_message("scr_makenpc(" + arg0 + "," + arg1 + ") Result: Layer Not Found");
        return -4;
    }
    var sourceAsset = layer_sprite_get_id(_mylayer, arg1);
    if (sourceAsset == -1)
    {
        var _result = "scr_makenpc(\"" + arg0 + "\",\"" + arg1 + "\") Result: Sprite Not Found";
        debug_message(_result);
        debug_print("Warning: Check Output Console");
        return -4;
    }
    var _myx = layer_sprite_get_x(sourceAsset);
    var _myy = layer_sprite_get_y(sourceAsset);
    var _mysprite = layer_sprite_get_sprite(sourceAsset);
    var _myxscale = layer_sprite_get_xscale(sourceAsset);
    var _myyscale = layer_sprite_get_yscale(sourceAsset);
    var _myalpha = layer_sprite_get_alpha(sourceAsset);
    var _myangle = layer_sprite_get_angle(sourceAsset);
    var _myblend = layer_sprite_get_blend(sourceAsset);
    var _myspeed = layer_sprite_get_speed(sourceAsset);
    var _myindex = layer_sprite_get_index(sourceAsset);
    return [_myx, _myy, _mysprite, _myxscale, _myyscale, _myalpha, _myblend, _myspeed, _myindex];
}
