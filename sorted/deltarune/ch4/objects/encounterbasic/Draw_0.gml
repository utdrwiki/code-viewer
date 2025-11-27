if (global.chapter == 4 && (global.encounterno == 176 || global.encounterno == 186))
{
    with (obj_marker)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_self();
        d3d_set_fog(false, c_black, 0, 0);
    }
    with (obj_afterimage)
        instance_destroy();
}
