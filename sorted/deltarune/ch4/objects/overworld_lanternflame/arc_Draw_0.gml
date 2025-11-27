var shadow_scale;
if (bouncy == 1)
    shadow_scale = lerp(1.2, 0.6, abs(fakey) / 100);
else
    shadow_scale = lerp(1, 0.6, abs(fakey) / 200);
if (con != 0)
    draw_sprite_ext(spr_fire_shadow, 0, x - 1, y - 2, shadow_scale, shadow_scale, 0, c_white, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y + fakey, image_xscale, image_yscale, 0, c_white, image_alpha);
