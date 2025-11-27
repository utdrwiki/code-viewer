if (image_xscale < 0.5)
    image_xscale += 0.05;
draw_self();
draw_set_font(fnt_mainbig);
image_alpha2 += 0.1;
if (con == 0)
    draw_text_color(x - 42, y + 40, stringsetloc("HIT IT!", "obj_bell_enemy_tuning_box_slash_Draw_0_gml_10_0"), c_white, c_white, c_white, c_white, image_alpha2);
draw_sprite_ext(spr_undertale_combat_thing2, 0, (x + bar_x) - 137 - 7 - 60, y - 32, 0.5, 0.5, 0, c_white, image_alpha3);
showval(camerax() + 40, cameray() + 40, "bar_x");
