con = -1;
var book_pillar = instance_create(640, 265, obj_npc_sign);
book_pillar.sprite_index = spr_castle_book_pillar;
with (book_pillar)
{
    image_xscale = 2;
    image_yscale = 2;
    scr_depth();
}
var bakery_readable = instance_create(1240, 560, obj_readable_room1);
with (bakery_readable)
{
    image_xscale = 2;
    image_yscale = 2;
    extflag = "bakery_sign";
}
if (global.chapter == 2 && global.plot >= 200 && global.flag[443] == 0)
    con = 0;
if (global.chapter == 4)
{
    if (global.plot >= 240 && global.flag[1661] > 0)
    {
        scr_losechar();
        with (obj_savepoint)
        {
            if (y < 300)
                instance_destroy();
        }
        with (obj_doorAny)
        {
            doorSpecial = "lancer_parade";
            init = 0;
        }
        var entrance_door = -4;
        with (obj_doorX)
        {
            if (y >= 1500)
                entrance_door = id;
        }
        if (entrance_door != -4)
        {
            var new_door = instance_create(entrance_door.x, entrance_door.y, obj_doorX_musfade);
            new_door.image_xscale = entrance_door.image_xscale;
            new_door.image_yscale = entrance_door.image_yscale;
            with (entrance_door)
                instance_destroy();
        }
        exit;
    }
    else
    {
        var layerarray = layer_get_all();
        for (var i = 0; i < array_length(layerarray); i++)
        {
            if (layer_get_name(layerarray[i]) != "PROPS_Stanchions")
                continue;
            var elements = layer_get_all_elements(layerarray[i]);
            var j = array_length(elements) - 1;
            while (j >= 0)
            {
                if (layer_get_element_type(elements[j]) != 2)
                {
                }
                else
                {
                    var __inst = layer_instance_get_instance(elements[j]);
                    var __name = object_get_name(__inst.object_index);
                    instance_destroy(__inst);
                }
                j--;
            }
            break;
        }
    }
    if (scr_flag_get(793) == 0)
    {
        con = 10;
        lancer_jump_timer = 0;
        lancer_marker = scr_dark_marker(1085, 1054, spr_lancer_lt);
        with (lancer_marker)
            depth = 70000;
    }
    if (scr_recruited_all_in_chapter(2))
        instance_create(0, 0, obj_npc_nubert);
    var music_block = instance_create(520, 560, obj_solidblocksized);
    with (music_block)
        image_xscale = 2;
    var music_readable = instance_create(music_block.x, music_block.y, obj_readable_room1);
    with (music_readable)
    {
        extflag = "closed_shop";
        image_xscale = 3;
    }
    if (scr_tenna_alt_plot())
    {
        with (obj_castle_tv)
        {
            sprite_index = spr_dw_castle_tv_closed;
            scr_depth();
        }
        var tv_block = instance_create(960, 560, obj_solidblocksized);
        with (tv_block)
            image_xscale = 2;
        var tv_readable = instance_create(tv_block.x, tv_block.y, obj_readable_room1);
        with (tv_readable)
        {
            extflag = "closed_tv";
            image_xscale = 3;
        }
    }
    var rudinn_main_npc = instance_create(687, 752, obj_npc_room);
    with (rudinn_main_npc)
    {
        extflag = "rudinn";
        sprite_index = spr_npc_diamond_sleepy;
        scr_flip("x");
        x = 687;
        scr_depth();
    }
    if (scr_flag_get(658) > 0)
    {
        var rudinn_npc = instance_create(300, 682, obj_npc_room);
        with (rudinn_npc)
        {
            extflag = "watercooler_rudinn";
            sprite_index = spr_diamond_overworld;
            scr_flip("x");
            scr_depth();
            x = 300;
        }
        var rudinn_ranger_npc = instance_create(393, 682, obj_npc_room);
        with (rudinn_ranger_npc)
        {
            extflag = "watercooler_rudinn_ranger";
            sprite_index = spr_diamond_knight_overworld;
            scr_depth();
        }
        var watercooler_npc = instance_create(318, 677, obj_npc_room);
        with (watercooler_npc)
        {
            extflag = "watercooler";
            sprite_index = spr_watercooler;
            scr_depth();
        }
    }
    var recruited_swatchling = scr_flag_get(636) == 1;
    var recruited_zapper = scr_flag_get(656) == 1;
    var recruited_ribbick = scr_flag_get(657) == 1;
    if (recruited_swatchling && recruited_zapper && recruited_ribbick)
    {
        var zapper_npc = instance_create(1107, 640, obj_npc_zapper);
        with (zapper_npc)
        {
            scr_flip("x");
            x = 1137;
            scr_depth();
        }
        var ribbick_npc = instance_create(978, 732, obj_npc_room_animated);
        with (ribbick_npc)
        {
            extflag = "ribbick";
            sprite_index = spr_npc_ribbick_flag;
            scr_depth();
        }
        var swatchling_npc = instance_create(1131, 652, obj_npc_room_animated);
        with (swatchling_npc)
        {
            extflag = "swatchling";
            sprite_index = spr_npc_swatchling_sweep;
            scr_depth();
            image_speed = 0.4;
        }
        var rabbick_npc = instance_create(1247, 734, obj_npc_room_animated);
        with (rabbick_npc)
        {
            extflag = "rabbick";
            sprite_index = spr_npc_rabbick_flag;
            scr_depth();
        }
    }
}
