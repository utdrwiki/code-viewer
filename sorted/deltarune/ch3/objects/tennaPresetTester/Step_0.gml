if (right_p())
{
    ind++;
    tenna.preset = ind;
    debug_print("tenna preset=" + string(ind));
}
if (left_p())
{
    ind--;
    tenna.preset = ind;
    debug_print("tenna preset=" + string(ind));
}
if (up_p())
    tenna.preset = 19;
