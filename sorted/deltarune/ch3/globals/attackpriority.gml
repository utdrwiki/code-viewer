function scr_attackpriority(arg0)
{
    if (i_ex(obj_battlecontroller))
    {
        if (obj_battlecontroller.attackpriority < arg0)
        {
            obj_battlecontroller.attackpriority = arg0;
            return true;
        }
        else
        {
            return false;
        }
    }
    else
    {
        return false;
    }
}
