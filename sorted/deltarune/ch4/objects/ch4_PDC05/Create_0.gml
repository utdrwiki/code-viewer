con = -1;
customcon = 0;
toriel_marker = -4;
susie_marker = -4;
door_marker = -4;
leaf_fall = false;
leaf_fall_timer = 0;
susie_change = false;
clothes_fly = false;
clothes_fly_timer = 0;
susie_clothes_marker = scr_marker(267, 314, spr_susie_clothes_fly);
kris_clothes_marker = scr_marker(315, 320, spr_kris_clothes_fly);
block_church = global.plot < 290;
if (block_church)
{
    var door_block = instance_create(280, 300, obj_solidblockLight);
    with (door_block)
        image_xscale = 2;
    var door_readable = instance_create(door_block.x, door_block.y, obj_readable_room1);
    with (door_readable)
    {
        image_xscale = 2;
        extflag = "locked_church_door";
    }
}
with (obj_npc_room)
    instance_destroy();
with (obj_npc_room_animated)
    instance_destroy();
if (global.plot >= 30 && global.plot < 40)
{
    con = 0;
    snd_free_all();
    toriel_marker = scr_marker(340, 328, spr_toriel_walk_down_church);
    with (toriel_marker)
        scr_depth();
    susie_marker = scr_marker(277, 302, spr_susie_walk_down_church);
    with (susie_marker)
        scr_depth();
    door_marker = scr_marker(283, 264, spr_church_door);
    with (door_marker)
        depth = 96770;
    door_marker.image_index = 1;
    susie_clothes_marker.visible = 0;
    kris_clothes_marker.visible = 0;
    var milk_npc = instance_create(510, 250, obj_npc_room);
    milk_npc.sprite_index = spr_npc_milklooker;
    with (milk_npc)
        scr_depth();
    if (i_ex(obj_church_event))
        obj_church_event.depth = door_marker.depth + 10;
    with (obj_mainchara)
    {
        x = 305;
        y = 309;
    }
    with (obj_caterpillarchara)
        instance_destroy();
}
else
{
    if (global.plot < 100)
    {
        susie_clothes_marker.sprite_index = spr_susie_clothes_land;
        susie_clothes_marker.x = 202;
        susie_clothes_marker.y = 347;
        kris_clothes_marker.sprite_index = spr_kris_clothes_land;
        kris_clothes_marker.x = 379;
        kris_clothes_marker.y = 353;
        susie_clothes_readable = instance_create(susie_clothes_marker.x, susie_clothes_marker.y, obj_readable_room1);
        kris_clothes_readable = instance_create(kris_clothes_marker.x, kris_clothes_marker.y, obj_readable_room1);
        with (susie_clothes_marker)
            depth = 900000;
        with (kris_clothes_marker)
            depth = 900000;
    }
    else
    {
        with (susie_clothes_marker)
            instance_destroy();
        with (kris_clothes_marker)
            instance_destroy();
    }
    instance_destroy();
}
