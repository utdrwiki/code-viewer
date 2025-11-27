if (drawnote >= 0 && d_ex())
{
    var xx = 0;
    var yy = 0;
    with (obj_dialoguer)
    {
        xx = camerax() + 40 + 10;
        yy = ((cameray() + 40) - 12) + 310;
        if (side == 0)
        {
            xx = camerax() + 40 + 10;
            yy = (cameray() + 40) - 12;
        }
    }
    draw_sprite_ext(spr_dw_church_susiesnote_dialoguer, drawnote, xx, yy, 2, 2, 0, c_white, 1);
}
