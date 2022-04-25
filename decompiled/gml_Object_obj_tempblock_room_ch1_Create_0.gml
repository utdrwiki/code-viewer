block = instance_create_ch1(x, y, obj_soliddark_ch1)
block.image_xscale = image_xscale
block.image_yscale = image_yscale
destroymarker = 0
if (room == room_forest_area5_ch1)
{
    talkto = instance_create_ch1(x, y, obj_readable_room1_ch1)
    talkto.image_xscale = image_xscale
    talkto.image_yscale = image_yscale
    tree = instance_create_ch1((x - 40), (y - 120), obj_blocktree_bg_ch1)
    with (tree)
        scr_depth_ch1()
    if (global.flag[237] > 0)
    {
        with (tree)
            instance_destroy()
        with (block)
            instance_destroy()
    }
}
