if (kris == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kris = id;
    }
}
if (kr_real == 0)
{
    with (obj_mainchara)
        other.kr_real = id;
}
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (kris.y <= 256)
        {
            con = 1;
            var closetime;
            for (var i = 0; i < 2; i++)
            {
                door[i] = instance_create(board_tilex(5 + i), board_tiley(7), obj_board_solid);
                closetime = 6;
                with (door[i])
                {
                    visible = true;
                    sprite_index = spr_board_door_down_glacier;
                    image_speed = 0;
                    scr_lerpvar("image_index", 0, sprite_get_number(sprite_index) - 1, closetime);
                    scr_darksize(id);
                    scr_depth_board();
                }
                door[i + 2] = instance_create(board_tilex(5 + i), board_tiley(0), obj_board_solid);
                with (door[i + 2])
                {
                    visible = true;
                    sprite_index = spr_board_door_up_glacier;
                    image_speed = 0;
                    scr_lerpvar("image_index", 0, sprite_get_number(sprite_index) - 1, closetime);
                    scr_darksize(id);
                    scr_depth_board();
                }
            }
            snd_play_delay(snd_board_door_close, closetime);
        }
    }
    if (con == 2 && obj_board_camera.con == 0)
    {
        if (kris.y > board_tiley(0.5))
        {
            con = 3;
            var closetime;
            for (var i = 0; i < 2; i++)
            {
                door[i + 2] = instance_create(board_tilex(5 + i), board_tiley(0), obj_board_solid);
                closetime = 6;
                with (door[i + 2])
                {
                    visible = true;
                    sprite_index = spr_board_door_up_glacier;
                    image_speed = 0;
                    scr_lerpvar("image_index", 0, sprite_get_number(sprite_index) - 1, closetime);
                    scr_darksize(id);
                    scr_depth_board();
                }
            }
            snd_play_delay(snd_board_door_close, closetime);
        }
    }
    if (con == 3)
    {
        var count = 0;
        with (obj_board_glacier_switch3)
        {
            if (extflag == "b2d_firstswitches")
            {
                if (pressed)
                    count++;
            }
        }
        if (count >= 2)
        {
            with (obj_board_glacier_switch3)
            {
                if (extflag == "b2d_firstswitches")
                    used = true;
            }
            con = 4;
            var opentime = 6;
            for (var i = 0; i < 4; i++)
            {
                with (door[i])
                {
                    scr_lerpvar("image_index", image_index, 0, opentime);
                    scr_doom(id, opentime + 1);
                }
            }
            snd_play(snd_board_secret_normal);
            snd_play(snd_board_door_close);
        }
    }
}
if (con < 2)
{
    if (i_ex(obj_board_enemy_deer))
    {
        if (obj_board_enemy_deer.follow == 1)
        {
            con = 2;
            if (con > 0)
            {
                safe_delete(door[2]);
                safe_delete(door[3]);
            }
        }
    }
}
else
{
}
