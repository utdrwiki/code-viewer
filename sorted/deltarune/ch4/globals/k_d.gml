function k_d(arg0 = 0)
{
    with (obj_dialoguer)
    {
        if (arg0 > 0)
        {
            var _stayer = instance_create_depth(x, y, depth + 1, obj_writer_stay);
            _stayer.side = side;
            _stayer.xoff = xoff;
            _stayer.yoff = yoff;
            _stayer.boxwidth = boxwidth;
            _stayer.boxheight = boxheight;
            _stayer.cur_jewel = cur_jewel;
            scr_doom(_stayer, arg0);
        }
        instance_destroy();
    }
    with (obj_writer)
        instance_destroy();
}
