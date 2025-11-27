draw_self();
draw_set_color(c_black);
draw_set_font(scr_84_get_font("main"));
var _tx = (image_xscale > 0) ? (x + 7) : (x + sprite_width + 22);
draw_set_alpha(image_alpha);
draw_text_transformed(_tx, y + 6, stringsetloc("HAHA!! I LOVE\nWATCHING TV!!", "obj_ilovetv_slash_Draw_0_gml_7_0"), 1, 1, 0);
draw_set_alpha(1);
draw_set_color(c_white);
