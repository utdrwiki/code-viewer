con = 0;
timer = 0;
made = false;
active = false;
puz = instance_create(2720, 1536, obj_board_event_bridgepuzzle);
puz.puzzleid = 1;
with (puz)
    setxy_board();
if (global.flag[1150] >= 3)
{
    con = 999;
    with (obj_board_bridgespawner)
        instance_destroy();
    with (obj_board_resettile)
    {
        if (puzzleid == 1)
            instance_destroy();
    }
    with (obj_board_solvedtrigger)
        instance_destroy();
    instance_create(2816, 1536, obj_board_bridge_placed);
    instance_create(2816, 1568, obj_board_bridge_placed);
    instance_create(2848, 1568, obj_board_bridge_placed);
    instance_create(2880, 1568, obj_board_bridge_placed);
    instance_create(2912, 1568, obj_board_bridge_placed);
    with (obj_board_bridge_placed)
    {
        setxy_board();
        active = true;
        sprite_index = spr_board_bridge_1x;
        image_index = 1;
        image_speed = 0;
        scr_darksize();
        depth = 999799;
    }
}
