draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(x, y, stringsetloc("JUST!", "obj_just_text_slash_Draw_0_gml_3_0"));
draw_set_halign(fa_left);
timer++;
if (timer == 31)
    instance_destroy();
if (!i_ex(obj_heart) || global.turntimer < 2)
    instance_destroy();
