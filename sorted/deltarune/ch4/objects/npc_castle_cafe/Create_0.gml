if (global.chapter < 4)
{
    var jukebox = scr_marker(44, 82, bg_dw_castle_cafe_juke);
    with (jukebox)
        scr_depth();
    var table_a = scr_marker(42, 230, bg_dw_castle_cafe_table);
    with (table_a)
        scr_depth();
    var table_b = scr_marker(260, 230, bg_dw_castle_cafe_table);
    with (table_b)
        scr_depth();
    var table_c = scr_marker(140, 325, bg_dw_castle_cafe_table);
    with (table_c)
        scr_depth();
    var table_collider_a = instance_create(table_a.x + 8, table_a.y + 10, obj_soliddark);
    table_collider_a.image_xscale = 1.9;
    table_collider_a.image_yscale = 1.3;
    var table_collider_b = instance_create(table_b.x + 8, table_b.y + 10, obj_soliddark);
    table_collider_b.image_xscale = 1.9;
    table_collider_b.image_yscale = 1.3;
    var table_collider_c = instance_create(table_c.x + 8, table_c.y + 10, obj_soliddark);
    table_collider_c.image_xscale = 1.9;
    table_collider_c.image_yscale = 1.3;
    var counter = scr_marker(365, 110, bg_dw_castle_cafe_counter);
    counter.depth = 98000;
    tm_con = -1;
    t_con = -1;
    if (global.chapter == 1)
    {
        var topchef = instance_create(395, 70, obj_npc_room);
        topchef.sprite_index = spr_topchef;
    }
    if (global.chapter >= 2)
    {
        if (global.chapter == 2 && global.plot < 200)
        {
            var topchef = instance_create(405, 70, obj_npc_room);
            topchef.sprite_index = spr_topchef;
        }
        else
        {
            var swatchlingA = instance_create(418, 62, obj_npc_room);
            swatchlingA.sprite_index = spr_npc_swatchling_cafe;
            with (swatchlingA)
                scr_depth();
            if (global.flag[636] == 1)
            {
                var swatchlingB = instance_create(517, 187, obj_npc_room);
                swatchlingB.sprite_index = spr_npc_swatchling_down;
                with (swatchlingB)
                    scr_depth();
            }
            if (global.flag[642] == 1 && global.flag[632] == 1)
            {
                var tm = instance_create(237, 23, obj_npc_room);
                tm.sprite_index = spr_npc_tasquemanager;
                tm.image_xscale = -2;
            }
            if (global.flag[632] == 1)
            {
                var tasqueA = instance_create(255, 63, obj_npc_room);
                tasqueA.sprite_index = spr_tasque_idle;
            }
        }
    }
}
else
{
    kk_timer = 0;
    kk_flip = false;
    tm_note = false;
    tm_timer = 0;
    sweet_note = false;
    sweet_timer = 0;
    for (var i = 0; i < 6; i++)
    {
        var _light = scr_dark_marker(178 + (i * 76), 10, spr_dw_castle_cafe_light);
        with (_light)
        {
            image_speed = 0.2;
            scr_depth();
        }
        var _beam = scr_dark_marker(178 + (i * 76), 10, spr_dw_castle_cafe_light_beam);
        with (_beam)
        {
            image_speed = 0.2;
            image_alpha = 0.5;
        }
        _beam.depth = _light.depth + 1;
    }
    var _curtains = scr_marker(146, 0, spr_dw_castle_cafe_curtain);
    _curtains.depth = 98590;
    if (global.flag[642] == 1)
    {
        tm_note = true;
        tm_marker = scr_dark_marker(190, 28, spr_npc_tm_sing);
        with (tm_marker)
        {
            scr_depth();
            image_speed = 0.2;
        }
    }
    if (scr_recruited_all_previous())
    {
        sweet_note = true;
        kk_flip = true;
        kk_marker = scr_dark_marker(320, 10, spr_npc_kk_highhat);
        with (kk_marker)
        {
            scr_depth();
            image_speed = 0;
        }
        var drum_marker = scr_dark_marker(310, 50, spr_susie_drum_isolate);
        with (drum_marker)
            scr_depth();
        sweet_marker = scr_dark_marker(460, 80, spr_npc_sweet_sing);
        with (sweet_marker)
        {
            scr_depth();
            image_speed = 0.1;
        }
        var saxman_marker = scr_dark_marker(525, 40, spr_shadowman_sax_a);
        with (saxman_marker)
        {
            scr_depth();
            image_speed = 0.2;
        }
    }
    var swatchlingA = instance_create(715, 60, obj_npc_room);
    swatchlingA.sprite_index = spr_npc_swatchling_cafe;
    with (swatchlingA)
        scr_depth();
    if (global.flag[642] == 1 && global.flag[632] == 1 && global.flag[654] == 1)
    {
        swatchlingA.sprite_index = spr_npc_swatchling_cafe_neko;
        var shadowguy_dancerA = instance_create(226, 270, obj_npc_room_animated);
        with (shadowguy_dancerA)
        {
            extflag = "shadowguy_dance";
            sprite_index = spr_npc_shadowguy_cat_dance;
            scr_flip("x");
            x = 226;
            scr_depth();
        }
        var tasque_dancerA = instance_create(263, 150, obj_npc_room_animated);
        with (tasque_dancerA)
        {
            extflag = "tasque_dance";
            sprite_index = spr_npc_tasque_dance;
            scr_flip("x");
            x = 263;
            scr_depth();
        }
        var tasque_dancerB = instance_create(263, 150, obj_npc_room_animated);
        with (tasque_dancerB)
        {
            extflag = "tasque_dance";
            sprite_index = spr_npc_tasque_dance;
            x = 263;
            scr_depth();
        }
        var tasque_dancerC = instance_create(589, 150, obj_npc_room_animated);
        with (tasque_dancerC)
        {
            extflag = "tasque_dance";
            sprite_index = spr_npc_tasque_dance;
            scr_flip("x");
            x = 589;
            scr_depth();
        }
        var shadowguy_dancerB = instance_create(580, 148, obj_npc_room_animated);
        with (shadowguy_dancerB)
        {
            extflag = "shadowguy_dance";
            sprite_index = spr_npc_shadowguy_cat_dance;
            scr_depth();
        }
    }
}
