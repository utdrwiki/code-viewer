function scr_setchar(arg0 = 0, arg1 = 0, arg2 = 0)
{
    scr_losechar();
    if (arg0)
        scr_getchar(2);
    if (arg1)
        scr_getchar(3);
    if (arg2)
        scr_getchar(4);
}
