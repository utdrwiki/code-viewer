draw_set_alpha(image_alpha);
if (type == 0)
    draw_sprite_ext(spr_susiezilla_circle, 0, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
if (type == 1)
    ossafe_fill_rectangle_color(x, cameray() + 192, x + (camerawidth() / 6), (cameray() + cameraheight()) - 101, c_red, c_red, c_red, c_red, false);
draw_set_alpha(1);
