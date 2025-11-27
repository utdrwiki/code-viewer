function k_d()
{
    with (obj_dialoguer)
    {
        if (argument_count > 0)
        {
            var stayer = instance_create_depth(x, y, depth + 1, obj_writer_stay);
            stayer.side = side;
            stayer.xoff = xoff;
            stayer.yoff = yoff;
            stayer.boxwidth = boxwidth;
            stayer.boxheight = boxheight;
            stayer.cur_jewel = cur_jewel;
            scr_doom(stayer, argument0);
        }
        instance_destroy();
    }
    with (obj_writer)
        instance_destroy();
}
