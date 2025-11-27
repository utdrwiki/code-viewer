function scr_depth(arg0 = id, arg1 = 0)
{
    with (arg0)
        depth = 100000 - ((y * 10) + (sprite_height * 10) + (arg1 * 10));
}
