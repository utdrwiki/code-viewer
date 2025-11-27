bg_speed = 1;
bg_speed_y = 1;
bg_speed_max = 1;
bg_speed_y_max = 1;
bg_speed_target = 0;
bg_speed_y_target = 0;
bg_surface = -4;
girder_sprite[0] = -4;
girder_sprite[1] = -4;
girder_sprite[2] = -4;
girder_sprite[3] = -4;
girder_sprite[4] = -4;
depth = layer_get_depth("BGCOLOR") - 20;

clean_up = function()
{
    if (surface_exists(bg_surface))
        surface_free(bg_surface);
    for (var i = 0; i < array_length_1d(girder_sprite); i++)
    {
        if (sprite_exists(girder_sprite[i]))
            sprite_delete(girder_sprite[i]);
    }
};
