function scr_animation(arg0, arg1, arg2, arg3 = 1, arg4 = 0)
{
    var __anim = instance_create(arg0, arg1, obj_animation);
    with (__anim)
    {
        sprite_index = arg2;
        image_speed = arg3;
        image_index = arg4;
    }
    return __anim;
}

function scr_dark_animation(arg0, arg1, arg2, arg3 = 1, arg4 = 0)
{
    var __anim = scr_animation(arg0, arg1, arg2, arg3, arg4);
    with (__anim)
    {
        image_xscale = 2;
        image_yscale = 2;
    }
    return __anim;
}
