var badge_alpha = 1;
var col = 16777215;
if (extflag == "a")
    col = 65535;
if (extflag == "b")
    col = 255;
if (extflag == "c")
    col = 8388736;
if (extflag == "d")
    col = 32768;
if (extflag == "e")
    col = 4235519;
if (col == 16777215)
    badge_alpha = 0;
if (dir == 0)
    draw_sprite_ext(sprite_index, image_index, x + 120, y, -2, 2, 0, c_white, 1);
if (dir == 1)
    draw_self();
var xpos = (x + 70) - 8;
var ypos = y + 60 + 4 + 4 + 4;
if (dir == 1)
    xpos -= 10;
if (view_current == 0 && global.interact == 0)
    siner++;
draw_sprite_ext(spr_pxwhite, 0, xpos, ypos, 6, 8, 0, merge_color(col, #21277C, 0.4), badge_alpha);
draw_sprite_ext(spr_pxwhite, 0, xpos + 2, ypos - 2, 2, 12, 0, merge_color(col, #21277C, 0.4), badge_alpha);
draw_sprite_ext(spr_pxwhite, 0, xpos + 2, ypos, 2, 8, 0, merge_color(col, #21277C, 0), badge_alpha);
draw_sprite_ext(spr_pxwhite, 0, xpos + 2, ypos + 2, 2, 2, 0, c_white, sin(siner / 30) * 0.5);
draw_sprite_ext(spr_pxwhite, 0, (xpos + 2) - 2, (ypos + 2) - 2, 2, 2, 0, c_white, sin(siner / 30) * 0.25);
draw_sprite_ext(spr_pxwhite, 0, xpos + 2 + 2, ypos + 2 + 2, 2, 2, 0, c_white, sin(siner / 30) * 0.25);
