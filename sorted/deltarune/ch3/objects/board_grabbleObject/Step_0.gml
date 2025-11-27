scr_depth_board();
if (grabcount == 1 && breakable == 1)
{
    if (extflag == "shell")
    {
        with (obj_b2quiz2)
            made = 2;
        debug_print("shell destroyed");
    }
    with (instance_create(x, y, obj_board_breakpoof))
    {
        depth = other.depth;
        if (other.extflag == "shell")
            image_blend = #9296FF;
    }
    snd_play(snd_break1);
    instance_destroy();
}
