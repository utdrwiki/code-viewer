if (global.chapter >= 2)
{
    var tallhat = instance_create(185, 95, obj_npc_room);
    tallhat.sprite_index = spr_npc_most_improved_1997_ch2;
    if (global.chapter >= 4)
        tallhat.sprite_index = spr_npc_most_improved_1997_ch4;
    if (global.chapter == 2)
    {
        with (obj_caterpillarchara)
        {
            follow = 0;
            visible = 0;
        }
        var aaron = instance_create(200, 95, obj_npc_room);
        aaron.sprite_index = spr_npc_aaron;
        var catti_mom = instance_create(36, 74, obj_npc_room_animated);
        catti_mom.sprite_index = spr_npc_catti_mom_no1;
        with (catti_mom)
            scr_depth();
        var catty_dad = instance_create(42, 120, obj_npc_room);
        catty_dad.sprite_index = spr_npc_catti_dad_diner;
        var catti = instance_create(240, 152, obj_npc_room_animated);
        catti.sprite_index = spr_npc_catty_ukelele;
        catti.depth = 4000;
        var jo = instance_create(240, 175, obj_npc_room);
        jo.sprite_index = spr_jockington_lt;
        var ficus = instance_create(55, 160, obj_npc_room);
        ficus.sprite_index = spr_npc_ficus;
        var diner_table = scr_marker(7, 172, bg_diner_table);
        diner_table.depth = ficus.depth - 100;
        var seat_back = scr_marker(236, 212, bg_diner_seat_back);
        seat_back.depth = jo.depth - 100;
    }
    if (global.chapter == 4)
    {
        nicecream_turn = true;
        nicecream_talk = false;
        nicecream_turn_timer = 0;
        bratty_turn = true;
        bratty_talk = false;
        bratty_turn_timer = 0;
        var hot_food = instance_create(108, 112, obj_diner_hot_food);
        var diner_table = scr_marker(7, 172, bg_diner_table);
        with (diner_table)
            scr_depth();
        nicecream = scr_marker(22, 180, spr_npc_nicecream_turn_back);
        nicecream.depth = diner_table.depth - 10;
        bratty = scr_marker(45, 185, spr_npc_bratty_turn_back);
        bratty.depth = diner_table.depth - 10;
        bratty_readable = instance_create(bratty.x + 8, bratty.y + 12, obj_readable_room1);
        var seat_back = scr_marker(16, 212, bg_diner_seat_back_left);
        seat_back.depth = bratty.depth - 100;
        var dresslion_npc = instance_create(245, 155, obj_npc_room);
        with (dresslion_npc)
        {
            depth = 97990;
            sprite_index = spr_npc_dresslion_alt;
        }
        var slime_npc = instance_create(275, 155, obj_npc_room);
        with (slime_npc)
        {
            depth = 97990;
            sprite_index = spr_npc_shamblingmass;
        }
        var froggit_npc = instance_create(159, 123, obj_npc_room);
        with (froggit_npc)
        {
            scr_depth();
            sprite_index = spr_npc_froggit_sit_up;
        }
        var table_marker = scr_marker(241, 179, bg_diner_table_right);
        table_marker.depth = dresslion_npc.depth - 10;
        var icee = instance_create(200, 170, obj_npc_room_animated);
        icee.sprite_index = spr_npc_icee_suit_platter;
        with (icee)
            scr_depth();
    }
}
else
{
    instance_destroy();
}
