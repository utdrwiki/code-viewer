if (color == 1)
{
    z_charge_nolimit = z_hold - 35;
    if (z_charge_nolimit >= 0)
    {
        var scale = abs(sin(z_charge_nolimit / 10));
        draw_sprite_ext(sprite_index, 0, x - (scale * 10), y - (scale * 10), 1 + scale, 1 + scale, image_angle, image_blend, 0.3);
        scale = abs(sin(z_charge_nolimit / 14));
        draw_sprite_ext(sprite_index, 0, x - 2 - (scale * 10), y - 2 - (scale * 10), 1.2 + scale, 1.2 + scale, image_angle, image_blend, 0.3);
    }
    if (z_hold >= 15)
    {
        z_charge = z_hold - 15;
        if (z_charge >= 35)
            z_charge = 35;
        for (var i = 0; i < 4; i += 1)
        {
            rotx = (i * 90) + (z_charge * 5);
            xx = sin(degtorad(rotx)) * (35 - z_charge);
            yy = cos(degtorad(rotx)) * (35 - z_charge);
            draw_sprite_ext(spr_yheart_charge, 0, (x + 9) - xx, (y + 10) - yy, 4 - ((z_charge * 2) / 35), 4 - ((z_charge * 2) / 35), 0, c_white, z_charge / 5);
        }
    }
}
with (obj_darkshape_light_aura)
{
    var i = 0.25;
    while (i <= 0.5)
    {
        draw_set_alpha((0.5 - (i * 0.5)) * 0.5);
        d_circle_color(other.x + 9, other.y + 9, (radius * i * 2) + (sin(timer) * 0.5), 16777215, 16777215, false);
        i += max(0.025, 0.1 - (((power(i * 10, 1.035) / 10) - 0.25) / 3));
    }
    draw_set_alpha(1);
}
draw_self();
if (global.chapter == 4 && i_ex(obj_sound_of_justice_enemy) && i_ex(obj_spearblocker))
{
}
