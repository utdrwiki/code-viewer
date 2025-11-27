function scr_afterimage_grow_attached()
{
    with (scr_afterimage_grow())
    {
        target = argument[0];
        image_blend = argument[1];
        if (argument_count > 2)
        {
            if (argument[2] == true)
                depth = other.depth - 1;
        }
    }
}
