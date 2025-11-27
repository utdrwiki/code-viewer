layer_set_visible("TILES_Checkboard", false);
if (global.chapter == 2)
{
    var coody = instance_create(772, 194, obj_npc_room);
    coody.sprite_index = spr_npc_coody;
    coody.image_xscale = -2;
    with (coody)
        scr_depth();
    var elegance = instance_create(494, 86, obj_npc_room);
    elegance.sprite_index = spr_npc_mrelegance;
    elegance.image_xscale = -2;
    with (elegance)
        scr_depth();
    layer_set_visible("TILES_Checkboard", true);
    var mannequin = instance_create(834, 150, obj_npc_room);
    mannequin.sprite_index = spr_mannequin_ralsei;
    with (mannequin)
        scr_depth();
    var addison = instance_create(900, 156, obj_npc_room);
    addison.sprite_index = spr_npc_addison_blue;
    with (addison)
        scr_depth();
    if (scr_get_total_recruits(2) >= 9)
    {
        var music_shop = scr_dark_marker(605, 6, bg_dw_castle_music_shop);
        with (music_shop)
            scr_depth();
        var music_shop_solid1 = instance_create(633, 112, obj_solidblocksized);
        music_shop_solid1.image_xscale = 0.525;
        music_shop_solid1.image_yscale = 1.5;
        var music_shop_solid2 = instance_create(710, 120, obj_solidblocksized);
        music_shop_solid2.image_xscale = 1.675;
        music_shop_solid2.image_yscale = 1.3;
        var music_door = instance_create(music_shop.x + 35, music_shop.y + 120, obj_doorw_musfade);
        music_door.image_xscale = 4;
        music_door.image_yscale = 2;
    }
    else
    {
        sweetnpc = instance_create(598, 41, obj_npc_room_animated);
        sweetnpc.sprite_index = spr_npc_sweet;
        with (sweetnpc)
            scr_depth();
        capnnpc = instance_create(670, 74, obj_npc_room_animated);
        capnnpc.sprite_index = spr_npc_hatguy;
        with (capnnpc)
            scr_depth();
        kknpc = instance_create(743, 28, obj_npc_room_animated);
        kknpc.sprite_index = spr_npc_kk;
        with (kknpc)
            scr_depth();
    }
}
if (global.chapter == 4)
{
    var doll_npc = instance_create(914, 145, obj_npc_room);
    doll_npc.sprite_index = spr_npc_mannequin_gaudy;
    with (doll_npc)
        scr_depth();
    var has_fan_recruits = false;
    var coody_npc = instance_create(494, 240, obj_npc_room_animated);
    coody_npc.sprite_index = spr_npc_coody_leaf;
    with (coody_npc)
    {
        scr_depth();
        image_speed = 0.1;
    }
    if (global.flag[636] == 1)
    {
        has_fan_recruits = true;
        var swatch_npc = instance_create(452, 8, obj_npc_room_animated);
        swatch_npc.sprite_index = spr_npc_swatchling_fan;
        with (swatch_npc)
            scr_depth();
    }
    if (scr_flag_get(654) == 1)
    {
        has_fan_recruits = true;
        var shadow_npc = instance_create(524, 106, obj_npc_room_animated);
        shadow_npc.sprite_index = spr_npc_shadowman_fan;
        shadow_npc.image_speed = 0.1;
    }
    if (scr_flag_get(605) == 1)
    {
        var talk_flag = has_fan_recruits ? "has_recruits" : "no_recruits";
        var rudinn_npc = instance_create(421, 92, obj_npc_room_animated);
        rudinn_npc.sprite_index = spr_diamond_fan;
        with (rudinn_npc)
        {
            extflag = talk_flag;
            scr_depth();
            scr_flip("x");
            image_speed = 0.1;
            x = 516;
        }
    }
    if (scr_weaponcheck_equipped_any(22) == 0 && scr_weaponcheck_inventory(22) == 0)
        instance_create(0, 0, obj_npc_castle_addison);
}
