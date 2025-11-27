con = -1;
customcon = 0;
if (global.plot >= 280 && global.plot < 290)
{
    con = 0;
    scr_flag_set(1591, 0);
    scr_setparty(1, 1, 0);
}
else
{
    instance_destroy();
}
