with (obj_board_trigger)
{
    if (extflag == "1")
    {
        var amt = round(abs(sin((other.timer + 0) / 60)) * 8) / 8;
        amt = clamp(amt, 0.5, 1);
        var safecolor = 13199616;
        var mycol = merge_color(c_black, safecolor, amt);
        draw_sprite_ext(spr_pxwhite, 0, x, y, image_xscale * 16, image_yscale * 16, 0, mycol, 1);
    }
    if (extflag == "2")
    {
        var amt = round(abs(sin((other.timer + 30) / 60)) * 8) / 8;
        amt = clamp(amt, 0.5, 1);
        var safecolor = 16239425;
        var mycol = merge_color(c_black, safecolor, amt);
        draw_sprite_ext(spr_pxwhite, 0, x, y, image_xscale * 16, image_yscale * 16, 0, mycol, 1);
    }
    if (extflag == "3")
    {
        var amt = round(abs(sin((other.timer + 60) / 60)) * 8) / 8;
        amt = clamp(amt, 0.5, 1);
        var safecolor = 6991872;
        var mycol = merge_color(c_black, safecolor, amt);
        draw_sprite_ext(spr_pxwhite, 0, x, y, image_xscale * 16, image_yscale * 16, 0, mycol, 1);
    }
    if (extflag == "4")
    {
        var amt = round(abs(sin((other.timer + 90) / 60)) * 8) / 8;
        amt = clamp(amt, 0.5, 1);
        var safecolor = 2815226;
        var mycol = merge_color(c_black, safecolor, amt);
        draw_sprite_ext(spr_pxwhite, 0, x, y, image_xscale * 16, image_yscale * 16, 0, mycol, 1);
    }
}
