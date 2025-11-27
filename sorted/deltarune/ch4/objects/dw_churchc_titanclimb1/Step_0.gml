if (!init)
{
    for (var i = 0; i < 3; i++)
        global.hp[i] = global.maxhp[i];
    scr_tempsave();
    init = 1;
    with (obj_mainchara)
    {
        var found = 0;
        with (obj_climb_marker)
        {
            if (found == 0)
            {
                if (image_index == 1)
                {
                    found = 1;
                    with (instance_create(x + 20, y + 20, obj_climb_kris))
                    {
                        var roomw = room_width;
                        var roomh = room_height;
                        var vieww = view_wport[0];
                        var viewh = view_hport[0];
                        var camx = clamp(x - floor(vieww / 2), 0, roomw - vieww);
                        var camy = clamp(y - floor(viewh / 2), 0, roomh - viewh);
                        var lclamp = 0;
                        var rclamp = roomw - vieww;
                        var uclamp = 0;
                        var dclamp = roomh - viewh;
                        camx = clamp(camx, lclamp, rclamp);
                        camy = clamp(camy, uclamp, dclamp);
                        camerax_set(camx);
                        cameray_set(camy);
                        startofroom = true;
                    }
                    global.interact = 0;
                }
            }
        }
        camerax_set(0);
        if (found)
        {
            visible = false;
            freeze = true;
            cutscene = true;
        }
    }
    with (obj_climb_kris)
        forceclimb = true;
}
timer++;
if (con == 0 && timer >= 45)
{
    con = 1;
    timer = 0;
    with (obj_climb_kris)
        forceclimb = false;
}
