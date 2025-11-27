timer++;
if (timer < 3)
    exit;
if (con == 1)
    draw_sprite_ext(spr_rouxls_laser_pointer, 0, mouse_x, mouse_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (con == 0 || con == 2)
    draw_sprite_ext(spr_rouxls_laser_pointer, 0, _mouse_x, _mouse_y, 2, 2, image_angle, image_blend, image_alpha);
