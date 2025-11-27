function scr_shakescreen(arg0 = 4, arg1 = 4)
{
    var shaker = instance_create(x, y, obj_shake);
    if (i_ex(shaker))
    {
        shaker.shakex = arg0;
        shaker.shakey = arg1;
    }
}
