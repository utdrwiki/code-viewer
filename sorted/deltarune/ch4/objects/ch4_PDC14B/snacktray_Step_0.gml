if (collision_circle(x + (sprite_get_width(sprite_index) / 2), y + (sprite_get_height(sprite_index) / 2), 5, obj_mainchara, false, true))
{
    if (con == 1)
    {
        if (abs(obj_mainchara.x - current_x_pos) > 10 || abs(obj_mainchara.y - current_y_pos) > 5)
        {
            con = 99;
            current_x_pos = obj_mainchara.x;
            current_y_pos = obj_mainchara.y;
            snd_play(snd_splat);
            alarm[0] = 30;
        }
    }
}
