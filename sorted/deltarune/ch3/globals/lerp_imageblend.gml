function scr_lerp_imageblend()
{
    var lerpblend = instance_create(x, y, obj_lerpimageblend);
    lerpblend.target = argument0;
    lerpblend.color1 = argument1;
    lerpblend.color2 = argument2;
    var ___time = argument3;
    if (argument_count > 4)
    {
        var _style = argument4;
        var _ease = argument5;
        lerpblend.mylerp = scr_lerp_var_instance(lerpblend, "blendindex", 0, 1, ___time, _style, _ease);
    }
    else
    {
        lerpblend.mylerp = scr_lerp_var_instance(lerpblend, "blendindex", 0, 1, ___time);
    }
    with (lerpblend)
        alarm_set(0, ___time);
    return lerpblend;
}
