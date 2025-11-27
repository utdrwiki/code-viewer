with (obj_mike_battle)
{
    obj_mike_attack_controller.mike_small = id;
    with (instance_create(xstart + 80, y + 25, obj_mike_battle))
    {
        sprite_index = spr_mike_big;
        x = xstart + 300;
        image_xscale = 2;
        image_yscale = 2;
        type = 1;
        depth = other.depth - 1;
        obj_mike_attack_controller.mike_big = id;
    }
    with (instance_create(xstart + 80, y - 100, obj_mike_battle))
    {
        sprite_index = spr_mike_med;
        x = xstart + 300;
        image_xscale = 2;
        image_yscale = 2;
        type = 1;
        obj_mike_attack_controller.mike_medium = id;
    }
}
