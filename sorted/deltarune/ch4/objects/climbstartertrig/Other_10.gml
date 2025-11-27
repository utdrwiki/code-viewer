if (global.interact == 0 && !i_ex(obj_climb_kris) && obj_mainchara.visible == true)
{
    if (myinteract == 1)
    {
        if (global.flag[23] == 1 || global.plot >= 180)
        {
            global.interact = 1;
            myinteract = 3;
        }
        else
        {
            global.interact = 1;
            myinteract = 400;
        }
    }
}
