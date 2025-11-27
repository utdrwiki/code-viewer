function scr_enemy_drawhurt_generic()
{
    if (state == 3 && hurttimer >= 0)
        draw_sprite_ext(hurtsprite, 0, x + shakex + hurtspriteoffx, y + hurtspriteoffy, 2, 2, 0, image_blend, 1);
}
