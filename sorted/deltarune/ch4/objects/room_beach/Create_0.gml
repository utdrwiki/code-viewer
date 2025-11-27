con = -1;
customcon = 0;
timer = 0;
canrest = false;
oceansong[0] = -1;
oceansong[1] = -1;
if (global.chapter == 2)
{
    if (global.flag[258] == 0)
        instance_create(90, 54, obj_npc_clamguy);
}
if (global.chapter == 4)
{
    susie_talk = false;
    skip_stones = false;
    if (global.plot >= 290)
        depth = 98000;
    with (obj_npc_room)
        instance_destroy();
    if (global.plot < 300)
    {
        if (scr_flag_get(425) == 1)
        {
            if (scr_flag_get(771) == 0)
            {
                canrest = true;
                susie_talk = true;
            }
            if (scr_flag_get(771) == 1)
            {
                scr_flag_set(771, 2);
                var bird_npc = instance_create(355, 92, obj_npc_room);
                bird_npc.sprite_index = spr_normalnpc;
                with (bird_npc)
                    scr_depth();
            }
        }
        else if (scr_flag_get(771) < 3)
        {
            canrest = true;
            skip_stones = true;
            rock_fall = false;
            rock_fall_timer = 0;
            rock_marker = scr_marker(410, 90, spr_beach_stone);
            with (rock_marker)
                scr_depth();
            rock_marker.visible = 0;
        }
    }
}
