function scr_msgno_end(arg0 = 0)
{
    if (i_ex(obj_writer))
    {
        with (obj_writer)
        {
            if (msgno == arg0)
            {
                if (reachedend)
                    return true;
                else
                    return false;
            }
        }
    }
    else
    {
        return true;
    }
}
