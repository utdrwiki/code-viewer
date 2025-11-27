function scr_joystick(arg0, arg1)
{
    var ___x = arg0;
    var ___y = arg1;
    var ___n = sqrt(sqr(___x) + sqr(___y));
    return radtodeg(arctan2(-___y / ___n, ___x / ___n));
}
