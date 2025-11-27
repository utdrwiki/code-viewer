if (con == 0)
{
    snd_play(snd_wing);
    image_alpha = 0.75;
    con = 1;
    hitcount++;
    alarm[0] = 28;
    if (hitcount == 1)
    {
        xtarget = obj_growtangle.x + 45;
        ytarget = obj_growtangle.y - 45;
        with (obj_dbulletcontroller)
        {
            n = 1;
            special++;
        }
    }
    if (hitcount == 2)
    {
        xtarget = obj_growtangle.x - 45;
        ytarget = obj_growtangle.y - 45;
        with (obj_dbulletcontroller)
        {
            n = 1;
            special++;
        }
    }
    if (hitcount == 3)
    {
        xtarget = obj_growtangle.x - 45;
        ytarget = obj_growtangle.y + 45;
        with (obj_dbulletcontroller)
        {
            n = 1;
            special++;
        }
    }
    if (hitcount == 4)
    {
        xtarget = obj_growtangle.x + 45;
        ytarget = obj_growtangle.y + 45;
        hitcount = 0;
        with (obj_dbulletcontroller)
        {
            n = 1;
            special++;
        }
    }
}
