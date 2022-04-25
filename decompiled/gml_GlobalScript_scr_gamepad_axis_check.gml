scr_gamepad_axis_check = function(argument0, argument1) //gml_Script_scr_gamepad_axis_check
{
    axis_value = (instance_exists(obj_time) ? obj_time.axis_value : 0.4)
    __returnvalue = 0
    if (argument1 == 0)
    {
        if (gamepad_axis_value(argument0, gp_axislv) >= axis_value)
            __returnvalue = 1
    }
    if (argument1 == 1)
    {
        if (gamepad_axis_value(argument0, gp_axislh) >= axis_value)
            __returnvalue = 1
    }
    if (argument1 == 2)
    {
        if (gamepad_axis_value(argument0, gp_axislv) <= (-axis_value))
            __returnvalue = 1
    }
    if (argument1 == 3)
    {
        if (gamepad_axis_value(argument0, gp_axislh) <= (-axis_value))
            __returnvalue = 1
    }
    return __returnvalue;
}

