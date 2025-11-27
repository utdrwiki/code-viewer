if (myinteract == 3)
{
    global.interact = 1;
    myinteract++;
}
if (myinteract == 4 && !d_ex())
{
    global.interact = 0;
    myinteract = 0;
    if (taken)
    {
        global.flag[1278] = 2;
        instance_destroy();
    }
    else
    {
        image_alpha = 1;
    }
}
