smokekill = 5;
spikes = instance_create(80, 400, obj_solidblock);
with (spikes)
{
    scr_darksize();
    sprite_index = spr_spiketile;
    image_speed = 0;
    visible = true;
    image_index = 0;
}
boardswitch = instance_create(480, 176, obj_board_switchtile);
con = 0;
endcon = 0;
if (global.flag[1055] >= 6)
{
    scr_marker_ext(128, 64, spr_pxwhite, 416, 256, undefined, undefined, c_black, 99801);
    endcon = 1;
    global.flag[1212] = 2;
}
if (global.flag[1212] >= 1)
{
    with (obj_board_event_bridgepuzzle)
        instance_destroy();
    with (obj_board_bridgespawner)
        instance_destroy();
    with (obj_board_resettile)
        instance_destroy();
    con = 1;
}
if (global.flag[1212] == 2)
{
    boardswitch.used = true;
    boardswitch.pressed = true;
    boardswitch.image_index = 1;
    with (spikes)
    {
        other.spikes = scr_marker_ext(x, y, sprite_index, 2, 2, 0, 1);
        other.spikes.depth = 99000;
        instance_destroy();
    }
    con = 99;
}
