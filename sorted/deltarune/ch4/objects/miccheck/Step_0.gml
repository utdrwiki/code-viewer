if (myinteract == 3)
{
    if (!i_ex(mydialoguer))
    {
        if (scr_is_valid_mic_platform())
        {
            if (!nomic)
                instance_create(0, 0, obj_micmenu);
            else
                global.interact = 0;
        }
        else
        {
            global.interact = 0;
        }
        myinteract = 0;
    }
}
