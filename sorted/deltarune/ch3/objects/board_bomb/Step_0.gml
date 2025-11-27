if (i_ex(obj_board_camera))
{
    if (obj_board_camera.con != 0)
        instance_destroy();
}
if (con == 2)
{
    scr_depth_board();
    timer++;
    if (timer > 10)
        image_index++;
    if (timer == 20)
    {
        cloud = instance_create(x + 6, y, obj_shadow_mantle_cloud);
        cloud.type = type;
        cloud.fatal = fatal;
        cloud.depth = depth - 10;
        snd_stop(snd_board_bomb);
        snd_play(snd_board_bomb);
        instance_destroy();
    }
}
