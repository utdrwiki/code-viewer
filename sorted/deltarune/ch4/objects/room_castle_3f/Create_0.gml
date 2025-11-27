if (scr_tenna_alt_plot())
{
    var door_block = instance_create(1280, 240, obj_solidblockDark);
    with (door_block)
        image_xscale = 3;
    var door_readable = instance_create(door_block.x, door_block.y, obj_readable_room1);
    with (door_readable)
    {
        image_xscale = 5;
        extflag = "tv_closed";
    }
    var door_marker = scr_dark_marker(1242, 88, spr_dw_door_tenna_closed);
    with (door_marker)
        scr_depth();
}
