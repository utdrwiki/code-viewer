if (myinteract == 3)
{
    if (i_ex(mydialoguer) == false)
    {
        global.interact = 0;
        myinteract = 0;
        with (obj_mainchara)
            onebuffer = 5;
        if (makepoints)
        {
            var points = itemidchest;
            global.flag[1044] += points;
            global.flag[1117] += points;
            snd_stop(snd_item);
            snd_play_pitch(snd_item, 1.2);
            var _display = instance_create(centerx(), centery() - 20, obj_dw_points_get_display);
            _display.init(points);
            makepoints = false;
        }
    }
}
