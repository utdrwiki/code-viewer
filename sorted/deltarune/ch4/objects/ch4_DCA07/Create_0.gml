con = -1;
customcon = 0;
hide_elixir = false;
hide_elixir_con = 0;
if (global.plot >= 160)
{
    con = (global.plot < 170) ? 0 : 99;
    if (global.plot < 242)
    {
        gerson_npc = instance_find(obj_npc_gerson, 0);
        if (scr_flag_get(868) == 1)
        {
            var guei_npc_a = instance_create(290, 584, obj_npc_room_animated);
            with (guei_npc_a)
            {
                extflag = "guei_study";
                sprite_index = spr_npc_guei;
                scr_flip("x");
                x = 403;
                y = 596;
                scr_depth();
            }
            var guei_npc_b = instance_create(580, 172, obj_npc_room_animated);
            with (guei_npc_b)
            {
                extflag = "guei_top";
                sprite_index = spr_npc_guei;
                scr_depth();
            }
        }
    }
    table_items = ["tea", "elixir", "guard", "scarf"];
    readable_list = [];
    item_markers = [];
    item_x_offsets = [6, 62, 108, 140];
    item_y_offsets = [-4, -10, 4, -6];
    for (var i = 0; i < 4; i++)
    {
        var _sprite = asset_get_index("spr_dw_item_" + table_items[i]);
        item_markers[i] = scr_dark_marker(384 + item_x_offsets[i], 1000 + item_y_offsets[i], _sprite);
        with (item_markers[i])
            depth = 89230;
    }
    var table_sparkle = scr_dark_marker(480, 990, spr_shine_white);
    with (table_sparkle)
    {
        depth = 89000;
        image_speed = 0.1;
    }
    var table_readable = instance_create(380, 990, obj_readable_room1);
    with (table_readable)
    {
        extflag = "gerson_shop";
        image_xscale = 10;
        image_yscale = 2;
    }
    if (scr_flag_get(841) == 2)
    {
        with (obj_readable_room1)
        {
            if (extflag == "elixir")
                instance_destroy();
        }
        with (item_markers[1])
            instance_destroy();
    }
    knight_talk = false;
    knight_talk_con = 0;
}
else
{
    instance_destroy();
}
