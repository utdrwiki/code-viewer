if (global.turntimer < 1)
    instance_destroy();
total = scr_approach(total, 1, clamp((1 - total) * 0.2, 0.01, 1));
draw_line_width_color(obj_growtangle.x - (165 * total), (obj_growtangle.y + (obj_growtangle.sprite_height * 0.5)) - 2, obj_growtangle.x + (165 * total), (obj_growtangle.y + (obj_growtangle.sprite_height * 0.5)) - 2, 4, #00C000, #00C000);
draw_line_width_color(obj_growtangle.x - (165 * total), (obj_growtangle.y - (obj_growtangle.sprite_height * 0.5)) + 2, obj_growtangle.x + (165 * total), (obj_growtangle.y - (obj_growtangle.sprite_height * 0.5)) + 2, 4, #00C000, #00C000);
