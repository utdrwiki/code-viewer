function scr_checklocation(arg0 = id, arg1, arg2, arg3 = 0)
{
    if (!i_ex(arg0))
    {
        debug_message("target instance does not exist");
        return false;
    }
    if (abs(arg0.x - arg1) <= arg3 && abs(arg0.y - arg2) <= arg3)
        return true;
    else
        return false;
}
