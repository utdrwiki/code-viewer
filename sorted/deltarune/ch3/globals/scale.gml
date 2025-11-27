function scr_scale()
{
    if (argument_count == 1)
    {
        image_xscale = argument0;
        image_yscale = argument0;
    }
    if (argument_count == 2)
    {
        with (argument1)
        {
            image_xscale = argument0;
            image_yscale = argument0;
        }
    }
}

function scr_set_scale()
{
    if (argument_count == 2)
    {
        image_xscale = argument0;
        image_yscale = argument1;
    }
    if (argument_count == 3)
    {
        with (argument2)
        {
            image_xscale = argument0;
            image_yscale = argument1;
        }
    }
}
