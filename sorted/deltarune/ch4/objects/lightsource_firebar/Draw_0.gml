draw_set_color(c_dkgray);
d_line_width(x - (width * 1.5), y, x + (width * 1.5), y, biggerLight * 2);
draw_sprite(spr_bullet_ghostfire, global.turntimer / 4, x + width, y);
draw_sprite(spr_bullet_ghostfire, global.turntimer / 4, x - width, y);
