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
        if (kris.x > board_tilex(2))
        {
            con = 1;
            var closetime;
            for (var i = 0; i < 2; i++)
            {
                snd_volume(global.currentsong[1], 0, 30);
                door[i] = instance_create(board_tilex(0), board_tiley(3 + i), obj_board_solid);
                closetime = 6;
                with (door[i])
                {
                    visible = true;
                    sprite_index = spr_board_door_left_glacier;
                    image_speed = 0;
                    scr_lerpvar("image_index", 0, sprite_get_number(sprite_index) - 1, closetime);
                    scr_darksize(id);
                    scr_depth_board();
                }
            }
            snd_play_delay(snd_board_door_close, closetime);
        }
    }
}
else
{
}
