if (heart_setup && con == 1)
{
    heart_setup = false;
    con = 99;
    if (!i_ex(obj_homealone_vent_loader))
    {
        heart = instance_create(obj_mainchara.x, obj_mainchara.y, obj_homealone_heart);
        with (obj_mainchara)
        {
            y = -200;
            cutscene = 1;
            freeze = 1;
            visible = 0;
        }
    }
}
