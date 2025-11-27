init_door = function(arg0, arg1)
{
    var sprite_name = asset_get_index("spr_dw_ranking_door_" + arg0);
    if (sprite_name == -1)
    {
        sprite_name = "spr_dw_ranking_door_a";
        show_debug_message("Error: could not find sprite fo ranking door " + arg0);
    }
    var door_sprite = scr_dark_marker(x, y, sprite_name);
    with (door_sprite)
        scr_depth();
    if (!arg1)
    {
        door_sprite.image_index = 1;
        var collider = instance_create(x, 240, obj_solidblocksized);
        with (collider)
        {
            image_xscale = 2.5;
            image_yscale = 1;
        }
        var readable = instance_create(x + 20, 240, obj_readable_room1);
        readable.extflag = "locked_door_" + arg0;
        with (readable)
        {
            image_xscale = 3;
            image_yscale = 2;
        }
    }
};
