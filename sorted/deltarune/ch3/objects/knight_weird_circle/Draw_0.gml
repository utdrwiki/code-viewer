if (alarm[0] && (alarm[0] % 2) < 1)
    exit;
image_blend = make_color_rgb(r, g, b);
for (a = 0; a < sprite_height; a++)
    draw_sprite_part_ext(sprite_index, image_index, 0, a, sprite_width, 1, (x - 24) + (sin((a + timer) * 0.5) * 2), (y - 6) + a, 1, 1, image_blend, image_alpha);
if (alarm[1] < 6 && alarm[1] > -1)
    draw_sprite_ext(sprite_index, image_index, x, y, 1 - (alarm[1] * 0.165), 1 - (alarm[1] * 0.165), image_angle, c_black, image_alpha);
