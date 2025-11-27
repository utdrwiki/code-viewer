draw_self();
if (active)
{
    var drawglow = false;
    var keycount = array_length(key);
    siner++;
    if (obj_board_inventory.sunmoonstone)
        drawglow = true;
    if (drawglow)
    {
        var sinamout = abs(round(sin((siner - 4) / 15) * 4) / 4) * 4;
        sinamout = clamp(sinamout, 0, 3);
        draw_sprite_ext(spr_board_bigdoor_glow, sinamout, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
    }
    var keynum = obj_board_inventory.keycount;
    for (var i = 0; i < array_length(key); i++)
    {
        with (key[i])
        {
            if (keynum > 0)
            {
                var sinamout = abs(round(sin((other.siner + (i * 4)) / 15) * 4) / 4) * 4;
                sinamout = clamp(sinamout, 0, 3);
                draw_sprite_ext(spr_board_keyhole_glow, sinamout, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
            }
            keynum--;
        }
    }
}
