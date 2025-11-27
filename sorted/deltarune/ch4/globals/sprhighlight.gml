function scr_sprhighlight(arg0, arg1 = -1, arg2 = false)
{
    var __highlight = instance_create(arg0.x, arg0.y, obj_sprhighlight);
    __highlight.target = arg0;
    __highlight.outline_only = arg2;
    if (arg1 == -1)
        __highlight.image_blend = scr_get_outline_color(arg0);
    else
        __highlight.image_blend = arg1;
    return __highlight;
}
