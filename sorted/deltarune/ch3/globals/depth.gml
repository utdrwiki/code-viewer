function scr_depth()
{
    if (argument_count > 0)
    {
        with (argument0)
            depth = 100000 - ((y * 10) + (sprite_height * 10));
    }
    else
    {
        depth = 100000 - ((y * 10) + (sprite_height * 10));
    }
}
