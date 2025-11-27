if (con < 2)
    exit;
pal_swap_set(spr_palette_noelle_room, palette_index, false);
draw_sprite(bg_noellehouse_noelle, 0, 0, 0);
draw_tilemap(vent_tiles, -camerax(), -cameray());
for (var i = 0; i < array_length_1d(marker_sprites); i++)
{
    marker_sprites[i][1] += marker_sprites[i][3];
    draw_sprite_ext(marker_sprites[i][0], marker_sprites[i][1], marker_sprites[i][2].x, marker_sprites[i][2].y, 1, 1, 0, marker_sprites[i][5], marker_sprites[i][4]);
}
for (var i = 0; i < array_length_1d(snowflakes); i++)
{
    snowflakes[i].image_index += snowflakes[i].image_speed;
    draw_sprite_ext(snowflakes[i].sprite_index, snowflakes[i].image_index, snowflakes[i].x, snowflakes[i].y, 1, 1, 0, snowflakes[i].image_blend, snowflakes[i].image_alpha);
}
draw_sprite(spr_noellehouse_vent_closed_noelle_cover, 0, 245, 62);
pal_swap_reset();
