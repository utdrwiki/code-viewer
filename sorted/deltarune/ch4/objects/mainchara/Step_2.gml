if (global.darkzone == 1)
{
    if (instance_exists(obj_camera_advanced))
    {
        obj_camera_advanced.cutscene = cutscene;
        with (obj_camera_advanced)
            event_user(0);
    }
    else if (cutscene == 0 && !instance_exists(obj_shake))
    {
        var roomw = room_width;
        var roomh = room_height;
        var vieww = view_wport[0];
        var viewh = view_hport[0];
        var krx = initwd / 2;
        var kry = initht / 2;
        var nudger = instance_place(x, y, obj_camera_nudger);
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
        var camx = clamp((x - floor((vieww / 2) - krx)) + nudgex, 0, roomw - vieww);
        var camy = clamp((y - floor((viewh / 2) - kry)) + nudgey, 0, roomh - viewh);
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
            camx = clamp(camx, lclamp, rclamp);
            camy = clamp(camy, uclamp, dclamp);
        }
        camerax_set(camx);
        cameray_set(camy);
    }
}
if (global.darkzone == 0)
{
    if (global.plot >= 245 || global.chapter >= 2)
    {
        if (instance_exists(obj_camera_advanced))
        {
            obj_camera_advanced.cutscene = cutscene;
            with (obj_camera_advanced)
                event_user(0);
        }
        else if (cutscene == 0 && !instance_exists(obj_shake))
        {
            __view_set(e__VW.Object, 0, -4);
            wd = (x - floor(__view_get(e__VW.WView, 0) / 2)) + 11;
            ht = (y - floor(__view_get(e__VW.HView, 0) / 2)) + 17;
            __view_set(e__VW.XView, 0, wd);
            __view_set(e__VW.YView, 0, ht);
            if (__view_get(e__VW.XView, 0) < 0)
                __view_set(e__VW.XView, 0, 0);
            if (__view_get(e__VW.XView, 0) > (room_width - __view_get(e__VW.WView, 0)))
                __view_set(e__VW.XView, 0, room_width - __view_get(e__VW.WView, 0));
            if (__view_get(e__VW.YView, 0) < 0)
                __view_set(e__VW.YView, 0, 0);
            if (__view_get(e__VW.YView, 0) > (room_height - __view_get(e__VW.HView, 0)))
                __view_set(e__VW.YView, 0, room_height - __view_get(e__VW.HView, 0));
        }
    }
}
if (bg == 1)
{
    with (obj_backgrounderparent)
        event_user(0);
}

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
