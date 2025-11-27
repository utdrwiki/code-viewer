if (global.chapter == 4)
{
    if (global.plot >= 40 && global.plot < 100)
    {
        var snowy_npc = instance_create(148, 59, obj_npc_room);
        with (snowy_npc)
        {
            sprite_index = spr_snowy_ut;
            scr_depth();
        }
        var snowy_dad_npc = instance_create(181, 57, obj_npc_room);
        with (snowy_dad_npc)
        {
            sprite_index = spr_npc_snowy_dad_behind;
            scr_depth();
        }
    }
}
