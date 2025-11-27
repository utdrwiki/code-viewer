function scr_oflash_ext(arg0 = sprite_index, arg1 = image_index, arg2 = x, arg3 = y, arg4 = image_xscale, arg5 = image_yscale, arg6 = image_speed, arg7 = 15, arg8 = 0, arg9 = 16777215, arg10 = -4)
{
    var _oflash = instance_create(arg2, arg3, obj_oflash_ext);
    _oflash.sprite_index = arg0;
    _oflash.image_index = arg1;
    _oflash.image_xscale = arg4;
    _oflash.image_yscale = arg5;
    _oflash.image_speed = arg6;
    _oflash.fadetime = arg7;
    _oflash.myblend = arg8;
    _oflash.image_blend = arg9;
    _oflash.target = arg10;
    return _oflash;
}
