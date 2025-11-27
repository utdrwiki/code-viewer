walkaway = false;
finished_walking = scr_flag_get(1021) == 1;
sparkle = -4;
if (!finished_walking)
{
    couch_marker = scr_dark_marker(x, y, spr_dw_couch_walk);
    with (couch_marker)
    {
        sprite_index = spr_dw_couch;
        depth = 100000;
    }
    couch_readable = instance_create(x + 20, (y + (sprite_get_height(spr_dw_couch_walk) * 2)) - 40, obj_readable_room1);
    with (couch_readable)
        image_xscale = 14;
    couch_collider = instance_create(x, (y + (sprite_get_height(spr_dw_couch_walk) * 2)) - 60, obj_solidblock);
    with (couch_collider)
    {
        image_yscale = 2;
        image_xscale = 16;
    }
}

show_sparkle = function()
{
    sparkle = scr_dark_marker(x + 156, y + 150, spr_shine_white);
    with (sparkle)
    {
        scr_depth();
        image_speed = 0.08;
    }
};

hide_sparkle = function()
{
    with (sparkle)
        instance_destroy();
};
