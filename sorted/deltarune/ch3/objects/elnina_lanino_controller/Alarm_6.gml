if (balloonend == 1)
{
    talked = 1;
    talktimer = 0;
    if (global.mnfight == 2)
    {
        talked = 0;
        afterbulletcon = 0;
        with (obj_battlecontroller)
        {
            noreturn = 0;
            reset = 0;
            scr_mnendturn();
        }
        with (obj_lanino_enemy)
            talking = false;
        with (obj_elnina_enemy)
            talking = false;
        if (excon == 1)
        {
            battlemsg_set = true;
            excon = 2;
            with (obj_face)
                instance_destroy();
            global.fc = 22;
            if (global.choice == 0)
                global.battlemsg[0] = stringsetloc("* Did someone mess with the humidity!?", "obj_elnina_lanino_controller_slash_Alarm_6_gml_23_0");
            if (global.choice == 1)
                global.battlemsg[0] = stringsetloc("* Hey, is it me or is it getting hot in here?", "obj_elnina_lanino_controller_slash_Alarm_6_gml_24_0");
        }
    }
}
else
{
    talked = 0.6;
    talktimer = 0;
    if (global.mnfight == 2)
    {
        talked = 0;
        afterbulletcon = 0;
    }
}
