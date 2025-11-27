bg_surface = -4;
starry_wall_sprite = -4;
star_anim = 0;
star_anim_speed = 0.25;
bg_speed = 1;
bg_speed_y = 1;
bg_speed_max = 1.5;
bg_speed_y_max = 1.5;
xadj = 0;
yadj = 0;
wall_dark = 9997923;
wall_light = 8643752;

clean_up = function()
{
    if (surface_exists(bg_surface))
        surface_free(bg_surface);
    if (sprite_exists(starry_wall_sprite))
        sprite_delete(starry_wall_sprite);
};
