visible = 0;
radius = 90;
con = 0;
image_xscale = 2;
image_yscale = 2;
scr_depth();
depth += 19;
encounterno = 126;
encounterflag = 586;
if (global.flag[encounterflag] != 0)
{
    debug_message(string(object_get_name(object_index)) + " destroyed because global.flag[" + string(encounterflag) + "]=" + string(global.flag[encounterflag]));
    with (scr_dark_marker(x, y, sprite_index))
    {
        image_speed = 0;
        image_index = 1;
        depth = other.depth;
    }
    instance_destroy();
}
