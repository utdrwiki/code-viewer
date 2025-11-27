scr_depth_board();
if (i_ex(obj_board_camera))
{
    if (obj_board_camera.con != 0)
        instance_destroy();
}
if (con == 0)
{
    if (visible == true)
        visible = false;
    else
        visible = true;
    timer++;
    if (timer == 12)
        con = 1;
}
if (con == 1)
{
    image_index += 0.25;
    if (image_index == 1)
    {
        snd_stop(snd_wing);
        snd_stop(snd_spearrise);
        snd_play_pitch(snd_spearrise, 1.2);
        if (type == 0)
        {
            var obj = 71;
            if (fatal == false)
                obj = 228;
            bullet = instance_create((x + 16) - 2 - 4, y + 16, obj);
            bullet.image_angle = 180;
            bullet.direction = 180;
            bullet.speed = 10;
            bullet = instance_create((x + 16) - 2 - 4, y + 16, obj);
            bullet.image_angle = 0;
            bullet.direction = 0;
            bullet.speed = 10;
            bullet = instance_create((x + 16) - 6, y + 16, obj);
            bullet.image_angle = 90;
            bullet.direction = 90;
            bullet.speed = 10;
            bullet = instance_create((x + 16) - 6, y + 16, obj);
            bullet.image_angle = 270;
            bullet.direction = 270;
            bullet.speed = 10;
        }
        else
        {
            instance_create(x, y, obj_board_enemy_bouncy);
        }
    }
    if (image_index >= 3)
        instance_destroy();
}
