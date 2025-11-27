scr_depth_board();
if (grabcount > 0)
{
    bomb = instance_create(x, y, obj_board_bomb);
    bomb.fatal = false;
    bomb.con = 2;
    instance_destroy();
}
if (place_meeting(x, y, obj_board_hazard) || place_meeting(x, y, obj_board_puzzlebombbullet))
{
    cloud = instance_create(x + 6, y, obj_shadow_mantle_cloud);
    cloud.type = 0;
    cloud.fatal = false;
    cloud.depth = depth - 10;
    snd_stop(snd_board_bomb);
    snd_play(snd_board_bomb);
    instance_destroy();
}
