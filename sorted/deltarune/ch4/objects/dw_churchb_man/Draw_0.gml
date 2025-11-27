if (scr_debug())
{
    var count = 0;
    var space = 10;
    var border = 8;
    var _cx = camerax();
    var _cy = cameray();
    var showtrigs = keyboard_check(ord("P"));
    if (showtrigs)
    {
        with (obj_trigger_interact)
        {
            ossafe_fill_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);
            draw_set_font(fnt_main);
            draw_text(x + 4, y, extflag);
            draw_text(x + 4, y + 12, string(myinteract));
        }
        with (obj_mainchara)
        {
            if (image_blend == c_black)
            {
                draw_set_color(c_red);
                ossafe_fill_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);
                draw_set_color(c_white);
            }
        }
    }
}
