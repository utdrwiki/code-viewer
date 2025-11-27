function scr_array_sort(arg0, arg1)
{
    if (arg1)
    {
        array_sort(arg0, function(arg0, arg1)
        {
            return arg0 - arg1;
        });
    }
    else
    {
        array_sort(arg0, function(arg0, arg1)
        {
            return arg1 - arg0;
        });
    }
    return arg0;
}
