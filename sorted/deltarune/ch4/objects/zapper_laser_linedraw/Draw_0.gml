if (global.turntimer < 1)
    instance_destroy();
total = scr_approach(total, 1, clamp((1 - total) * 0.2, 0.01, 1));
d_line_width_color(obj_growtangle.x - (165 * total), (obj_growtangle.y + (obj_growtangle.sprite_height * 0.5)) - 2, obj_growtangle.x + (165 * total), (obj_growtangle.y + (obj_growtangle.sprite_height * 0.5)) - 2, 4, 49152, 49152);
d_line_width_color(obj_growtangle.x - (165 * total), (obj_growtangle.y - (obj_growtangle.sprite_height * 0.5)) + 2, obj_growtangle.x + (165 * total), (obj_growtangle.y - (obj_growtangle.sprite_height * 0.5)) + 2, 4, 49152, 49152);
