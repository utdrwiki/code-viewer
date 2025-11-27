if (camera_lock)
{
    if (camera_block == -4)
    {
        camera_block = instance_create(1860, 0, obj_solidblocksized);
        with (camera_block)
            image_yscale = 20;
    }
    with (obj_mainchara)
        cutscene = 1;
    if (left_exit_block == -4)
    {
        if (obj_mainchara.x >= 2200 && obj_mainchara.x < 7410)
            camera_set_view_pos(view_get_camera(0), (obj_mainchara.x - (view_wport[0] / 2)) + 18, cameray());
    }
    else if (obj_mainchara.x >= 3100 && obj_mainchara.x < 7410)
    {
        camera_set_view_pos(view_get_camera(0), (obj_mainchara.x - (view_wport[0] / 2)) + 18, cameray());
    }
}
