function scr_tensionheal(arg0)
{
    global.tension += arg0;
    if (global.tension > global.maxtension)
        global.tension = global.maxtension;
    if (global.chapter == 3 && i_ex(obj_gameshow_battlemanager))
        obj_gameshow_battlemanager.tpgained += arg0;
    if (global.chapter == 3)
    {
        obj_battlecontroller.mercytotal += arg0;
        if (obj_battlecontroller.mercytotal < 0)
            obj_battlecontroller.mercytotal = 0;
        if (obj_battlecontroller.mercytotal >= 250)
            obj_battlecontroller.mercytotal = 250;
    }
}
