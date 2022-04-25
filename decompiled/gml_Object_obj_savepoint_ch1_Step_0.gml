if (myinteract == 3)
{
    if (instance_exists(mydialoguer) == 0)
    {
        instance_create_ch1(0, 0, obj_savemenu_ch1)
        myinteract = 0
    }
}
