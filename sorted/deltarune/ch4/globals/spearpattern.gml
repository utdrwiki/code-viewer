function scr_spearpattern(arg0, arg1, arg2, arg3, arg4)
{
    var _argument0 = arg0;
    var _argument1 = arg1;
    var _argument2 = arg2;
    if (is_string(arg0))
    {
        if (arg0 == "u")
            _argument0 = 270;
        if (arg0 == "d")
            _argument0 = 90;
        if (arg0 == "r")
            _argument0 = 180;
        if (arg0 == "l")
            _argument0 = 0;
        if (arg0 == "dr")
            _argument0 = 135;
        if (arg0 == "dl")
            _argument0 = 45;
        if (arg0 == "ur")
            _argument0 = 225;
        if (arg0 == "ul")
            _argument0 = 315;
        if (arg0 == "right1")
        {
            _argument0 = 75;
            _argument1 = -36;
            _argument2 = 270;
        }
        if (arg0 == "right2")
        {
            _argument0 = 75;
            _argument1 = 36;
            _argument2 = 270;
        }
        if (arg0 == "up1")
        {
            _argument0 = -36;
            _argument1 = -75;
        }
        if (arg0 == "up2")
        {
            _argument0 = 50;
            _argument1 = -75;
            _argument2 = -3;
        }
        if (arg0 == "left1")
        {
            _argument0 = -75;
            _argument1 = -36;
            _argument2 = 90;
        }
        if (arg0 == "left2")
        {
            _argument0 = -75;
            _argument1 = 36;
            _argument2 = 90;
        }
        if (arg0 == "down1")
        {
            _argument0 = -36;
            _argument1 = 75;
            _argument2 = 180;
        }
        if (arg0 == "down2")
        {
            _argument0 = 36;
            _argument1 = 75;
            _argument2 = 180;
        }
        if (arg0 == "diag1")
        {
            _argument0 = 90;
            _argument1 = -90;
            _argument2 = 315;
        }
        if (arg0 == "diag2")
        {
            _argument0 = -90;
            _argument1 = -90;
            _argument2 = 45;
        }
        if (arg0 == "diag3")
        {
            _argument0 = -90;
            _argument1 = 90;
            _argument2 = 135;
        }
        if (arg0 == "diag4")
        {
            _argument0 = 90;
            _argument1 = 90;
            _argument2 = 225;
        }
    }
    list_attackdirection[attackcountmax] = _argument0;
    list_attackspeed[attackcountmax] = _argument1;
    list_attackframes[attackcountmax] = _argument2;
    list_attackspecial[attackcountmax] = arg3;
    list_attackwait[attackcountmax] = arg4;
    if (argument_count == 6)
        list_attackspecial2[attackcountmax] = argument5;
    attackcountmax++;
}
