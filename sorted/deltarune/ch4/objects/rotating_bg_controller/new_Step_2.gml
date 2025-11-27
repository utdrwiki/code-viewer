if (obj_rotating_tower_controller_new.use_background_map)
{
    with (obj_rotating_tower_controller_new)
    {
        var bg = layer_get_id(background_name);
        layer_x(bg, -360 + ((tower_angle + 360) % 360));
    }
    exit;
}
