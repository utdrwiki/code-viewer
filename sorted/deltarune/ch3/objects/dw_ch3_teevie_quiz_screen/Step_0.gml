event_inherited();
if (shoot_sequence)
{
    shoot_sequence_timer++;
    if (shoot_sequence_timer == 1)
    {
        var _current_screen_tile = bullet_pos_list[bullet_pos_index];
        var _tv_height = tvheight;
        var _tv_width = tvwidth;
        var _xpos = x + (_current_screen_tile.x * tvwidth);
        var _ypos = y + (_current_screen_tile.y * tvheight);
        var _shooter = instance_create(_xpos, _ypos, obj_dw_ch3_teevie_shooter);
        with (_shooter)
            init(_current_screen_tile, _tv_height, _tv_width);
        shooter_list[array_length_1d(shooter_list)] = _shooter;
    }
    if (shoot_sequence_timer == 6)
    {
        bullet_pos_index++;
        if (bullet_pos_index < array_length_1d(bullet_pos_list))
        {
            shoot_sequence_timer = 0;
        }
        else
        {
            shoot_sequence = false;
            shoot_sequence_timer = 0;
            bullet_pos_index = 0;
        }
    }
}
