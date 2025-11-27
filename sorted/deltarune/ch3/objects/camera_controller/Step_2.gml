if (camcontrol)
{
    if (mode == 0)
    {
        obj_mainchara.cutscene = true;
        var wd = (obj_mainchara.x + 11) - 320;
        var ht = (obj_mainchara.y + 17) - 240;
        var resetval = true;
        with (obj_camera_clamper)
        {
            if (place_meeting(x, y, obj_mainchara))
            {
                resetval = false;
                other.xmin = xmin;
                other.ymin = ymin;
                other.xmax = xmax;
                other.ymax = ymax;
            }
        }
        if (resetval)
        {
            xmin = 0;
            ymin = 0;
            xmax = room_width - 320;
            ymax = room_height - 240;
        }
        if (!i_ex(obj_shake))
        {
            camerax_set(clamp(wd, xmin, xmax));
            cameray_set(clamp(ht, ymin, ymax));
        }
    }
    if (mode == 1)
    {
        obj_mainchara.cutscene = true;
        if (!i_ex(obj_shake))
        {
            camerax_set(clamp(round(xpos), xmin, xmax));
            cameray_set(clamp(round(ypos), ymin, ymax));
        }
    }
}
