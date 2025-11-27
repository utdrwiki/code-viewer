siner += 0.2;
if (bg_active)
    palette_index = sin(siner / 4);
else
    palette_index = 0;
draw_set_alpha(1);
for (var i = 0; i < array_length(layer_names); i++)
    pal_swap_set_layer(4884, palette_index, layer_names[i], false);
pal_swap_set(bg_town_church_palette, palette_index, false);
draw_set_alpha(1);
draw_sprite(spr_church, 0, 220, 0);
pal_swap_reset();
if (window_active)
    draw_set_alpha(window_alpha + (sin(siner / 4) * 0.8));
else
    draw_set_alpha(window_alpha);
draw_sprite(spr_town_church_window_invert_tall, 0, 292, 110);
draw_sprite(spr_town_church_window_invert_circle, 0, 281, 195);
draw_sprite(spr_town_church_window_invert_short, 0, 246, 257);
draw_sprite(spr_town_church_window_invert_short, 0, 335, 257);
draw_set_alpha(1);
if (bg_active)
    overlay_marker.image_alpha = 0.4 + (palette_index * 0.3);
else
    overlay_marker.image_alpha = 0;
