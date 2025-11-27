con = -1;
if (global.chapter == 2 && global.plot >= 200 && global.flag[443] == 0 && global.flag[444] == 0)
{
    con = 0;
}
else if (global.chapter >= 4)
{
    rainy_active = global.plot >= 100 && global.plot < 300;
    rainy_init = false;
    rainy_splash = false;
    rainy_timer = 0;
    rainy_siner = 0;
    susie_check = false;
    susie_facing = "";
    if (scr_flag_get(457) == 0)
    {
        var library_collider = instance_create(1000, 85, obj_solidblockLight);
        library_collider.image_xscale = 2;
        var library_sign = instance_create(1010, 85, obj_readable_room1);
    }
    if (global.chapter == 4)
    {
        if (global.plot >= 100)
        {
            if (global.plot < 300)
            {
                if (scr_flag_get(1551) == 0 && !scr_sideb_active() && scr_flag_get(706) == 0)
                {
                    susie_check = true;
                    con = 10;
                }
            }
            with (obj_readable_room1)
            {
                if (x >= 50)
                    instance_destroy();
            }
            with (obj_doorparent)
            {
                if (x < 610 || (x > 980 && x < 1010))
                {
                    var readable = instance_create(x, y, obj_readable_room1);
                    readable.image_xscale = image_xscale;
                    instance_destroy();
                }
            }
            if (global.plot < 300)
            {
                if (rainy_active)
                    rainy_splash = true;
            }
        }
        with (obj_doorparent)
        {
            if (x < 250)
            {
                var readable = instance_create(x, y, obj_readable_room1);
                readable.image_xscale = image_xscale;
                instance_destroy();
            }
        }
        var closed_sign = scr_marker(243, 61, spr_police_station_closed);
        closed_sign.depth = 939990;
        closed_sign.image_speed = 0.1;
        if (global.plot >= 300)
        {
            closed_sign.image_speed = 0;
            closed_sign.image_index = 1;
        }
        if (global.plot >= 40 && global.plot < 100)
        {
            var catti_npc = instance_create(1218, 67, obj_npc_room);
            with (catti_npc)
            {
                scr_depth();
                sprite_index = spr_npc_catti_ladder;
            }
            var catti_mom_marker = scr_marker(1180, 27, spr_npc_catti_mom_no1_tree);
            with (catti_mom_marker)
            {
                scr_depth();
                image_speed = 0.15;
            }
            var catti_dad_marker = scr_marker(1240, 35, spr_npc_catti_dad_tree);
            with (catti_dad_marker)
                scr_depth();
            var jo_npc = instance_create(1184, 88, obj_npc_room);
            with (jo_npc)
            {
                sprite_index = spr_jockington_rt;
                scr_depth();
            }
            var napstablook_npc = instance_create(236, 142, obj_npc_room);
            with (napstablook_npc)
            {
                extflag = "napstablook";
                sprite_index = spr_npc_napstablook_police_ground;
                scr_depth();
            }
            snailcar_npc = instance_create(285, 127, obj_npc_room_animated);
            with (snailcar_npc)
            {
                sprite_index = spr_npc_snailcar;
                image_speed = 0.1;
                scr_depth();
            }
            snail_hit = false;
            var mouse_npc = instance_create(680, 98, obj_npc_room);
            with (mouse_npc)
            {
                sprite_index = spr_npc_wrapmouse;
                scr_depth();
            }
        }
    }
}
else
{
    instance_destroy();
}
