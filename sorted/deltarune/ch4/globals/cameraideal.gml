function scr_cameraideal(arg0 = obj_mainchara.x, arg1 = obj_mainchara.y)
{
    if (!instance_exists(obj_mainchara))
        return [0, 0, 0];
    var camx = camerax();
    var camy = cameray();
    var idealcamx, idealcamy;
    with (obj_mainchara)
    {
        var roomw = room_width;
        var roomh = room_height;
        var vieww = view_wport[0];
        var viewh = view_hport[0];
        var nudger = instance_place(arg0, arg1, obj_camera_nudger);
        if (i_ex(nudger))
        {
            if (nudger.lerpstrength != -4)
                nudgelerp = nudger.lerpstrength;
            var _yoff = -2;
            if (nudger.yamt > 0)
                _yoff = 2;
            var _xoff = -2;
            if (nudger.xamt > 0)
                _xoff = 2;
            nudgex = lerp(nudgex, nudger.xamt + _yoff, nudgelerp);
            nudgey = lerp(nudgey, nudger.yamt + _yoff, nudgelerp);
            nudgex = clamp(nudgex, abs(nudger.xamt) * -1, abs(nudger.xamt));
            nudgey = clamp(nudgey, abs(nudger.yamt) * -1, abs(nudger.yamt));
        }
        else
        {
            var _yoff = -2;
            if (nudgey < 0)
                _yoff = 2;
            var _xoff = -2;
            if (nudgex < 0)
                _xoff = 2;
            if (abs(0 - nudgex) > 1)
                nudgex = lerp(nudgex, 0 + _xoff, nudgelerp);
            else
                nudgex = 0;
            if (abs(0 - nudgey) > 1)
                nudgey = lerp(nudgey, 0 + _yoff, nudgelerp);
            else
                nudgey = 0;
        }
        idealcamx = clamp((arg0 - floor((vieww / 2) - (initwd / 2))) + nudgex, 0, roomw - vieww);
        idealcamy = clamp((arg1 - floor((viewh / 2) - (initht / 2))) + nudgey, 0, roomh - viewh);
        var clamper = instance_place(x, y, obj_camera_clamper);
        if (i_ex(clamper))
        {
            var lclamp = 0;
            var rclamp = roomw - vieww;
            var uclamp = 0;
            var dclamp = roomh - viewh;
            if (clamper.xmin != -4)
                lclamp = clamper.xmin;
            if (clamper.xmax != -4)
                rclamp = clamper.xmax;
            if (clamper.ymin != -4)
                uclamp = clamper.ymin;
            if (clamper.ymax != -4)
                dclamp = clamper.ymax;
            idealcamx = clamp(idealcamx, lclamp, rclamp);
            idealcamy = clamp(idealcamy, uclamp, dclamp);
        }
    }
    return [round(idealcamx), round(idealcamy), point_distance(camx, camy, idealcamx, idealcamy)];
}
