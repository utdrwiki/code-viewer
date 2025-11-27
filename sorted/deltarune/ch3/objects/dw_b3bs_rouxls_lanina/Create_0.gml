depth = 999999;
animindex = 0;
ver = 0;
timer = 0;
if (scr_flag_get(1059) == 0)
{
    with (obj_dw_b3bs_idcardpuzzle_pond)
        instance_destroy();
    freeze = 0;
    elnina = scr_board_marker(384, 96, spr_board_elnina_cry, 0.125);
    with (elnina)
        scr_depth_board();
    lanino = scr_board_marker(352, 128, spr_board_lanino_cry, 0.125);
    with (lanino)
        scr_depth_board();
    lanino.image_xscale = -2;
}
else
{
    ver = 1;
    with (obj_dw_b3bs_rouxls_lanina_elninapondprogress)
        instance_destroy();
    puz = instance_create(x, y, obj_board_event_bridgepuzzle);
    puz.puzzleid = 1;
    puz.alwaysactive = true;
    for (var i = 0; i < 3; i++)
    {
        for (var ii = 0; ii < 3; ii++)
            instance_create(416 + (32 * i), 32 + (32 * ii), obj_board_watertile);
    }
    if (global.flag[1106] == 1)
    {
        with (obj_board_resettile)
            instance_destroy();
        safe_delete(puz);
        with (obj_board_bridgespawner)
            instance_destroy();
        for (var i = 0; i < 3; i++)
        {
            with (instance_create(224 + (i * 32), 128, obj_board_bridge_placed))
            {
                active = true;
                sprite_index = spr_board_bridge_1x;
                image_index = 1;
                image_speed = 0;
                scr_darksize();
                depth = 999799;
            }
        }
    }
}
if (global.flag[1108] > 0)
{
    for (var i = 0; i < global.flag[1108]; i++)
    {
        var trash = instance_find(obj_board_flowers, irandom(instance_number(obj_board_flowers) - 1));
        with (trash)
            instance_destroy();
    }
}
