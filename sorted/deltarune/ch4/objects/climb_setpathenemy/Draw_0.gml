if (i_ex(obj_climb_enemyspawner))
{
    dodraw = obj_climb_enemyspawner.dodraw;
}
else
{
}
if (dodraw)
    draw_sprite_ext(sprite_index, (current_time / 4) % 3, x + 20, y + 20, 1, 1, dir * 90, c_white, image_alpha);
