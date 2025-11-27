if (global.chapter >= 4)
{
    if (scr_flag_get(765) > 0)
    {
        var window_marker = scr_marker(1514, 6, spr_town_mid_child_left);
        with (window_marker)
            scr_depth();
    }
    if (global.chapter == 4)
    {
        with (obj_npc_room)
            instance_destroy();
        if (global.plot >= 300)
        {
            var lay_id = layer_get_id("BACKGROUND");
            var back_id = layer_background_get_id(lay_id);
            layer_background_sprite(back_id, 2456);
            with (obj_readable_room1)
                instance_destroy();
            with (obj_solidblock)
            {
                if (x == 120 && y >= 100)
                    instance_destroy();
            }
        }
        else
        {
            if (global.plot < 100)
            {
                var catty_npc = instance_create(123, 62, obj_npc_room_animated);
                catty_npc.sprite_index = spr_npc_catty_milk;
                with (catty_npc)
                    scr_depth();
            }
            else
            {
                milk_npc = instance_create(132, 100, obj_npc_room);
                milk_npc.sprite_index = spr_alley_milk;
                with (milk_npc)
                    scr_depth();
            }
            var milk_npc = instance_create(166, 115, obj_npc_room);
            milk_npc.sprite_index = spr_npc_milklooker;
            with (milk_npc)
                scr_depth();
        }
    }
}
