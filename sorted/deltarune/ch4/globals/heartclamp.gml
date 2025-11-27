function scr_heartclamp(arg0 = 0, arg1 = 0)
{
    if (i_ex(obj_growtangle))
    {
        with (obj_heart)
        {
            var xthick = (obj_growtangle.image_xscale * 2) + 1;
            var ythick = (obj_growtangle.image_yscale * 2) + 1;
            x = clamp(x, scr_get_box(2) + xthick + arg0, scr_get_box(0) - (20 + xthick + arg0));
            y = clamp(y, scr_get_box(1) + ythick + arg1, scr_get_box(3) - (20 + ythick + arg1));
        }
    }
}
