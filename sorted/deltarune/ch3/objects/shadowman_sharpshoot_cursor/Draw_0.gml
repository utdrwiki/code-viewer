if (!i_ex(obj_battlecontroller) || (i_ex(obj_battlecontroller) && obj_battlecontroller.victory == true))
    exit;
siner++;
draw_sprite_ext(sprite_index, image_index, x + (sin(siner / 4) * 2), y + (cos(siner / 4) * 2), image_xscale + 0.5, image_yscale + 0.5, image_angle, image_blend, image_alpha / 4);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha / 3);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale - 0.5, image_yscale - 0.5, image_angle, image_blend, image_alpha / 1.5);
if (disableactui == true)
    exit;
draw_set_halign(fa_center);
scr_84_set_draw_font("mainbig");
draw_text(camerax() + (camerawidth() / 2), cameray() + 10, stringsetloc("AMMO", "obj_shadowman_sharpshoot_cursor_slash_Draw_0_gml_10_0"));
draw_text((camerax() + (camerawidth() / 2)) - 15, cameray() + 43, string(ammo) + " x");
draw_sprite(spr_shadowman_sharpshoot_heart, 0, camerax() + (camerawidth() / 2) + 26, cameray() + 62);
draw_set_halign(fa_left);
