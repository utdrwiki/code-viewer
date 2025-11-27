if (shoot_sequence)
{
    shoot_sequence_timer++;
    screen_index += image_speed;
    if (shoot_sequence_timer == 1)
    {
        current_screen_sprite = 3996;
        image_speed = 0.2;
    }
    if (shoot_sequence_timer == 10)
    {
        current_screen_sprite = 2711;
        image_speed = 0;
        screen_index = 0;
    }
    if (shoot_sequence_timer == 17)
    {
        screen_index = 1;
        var _bullet_pos = new Vector2(x + (tvwidth / 2), y + (tvheight / 2));
        var tv_bullet = instance_create(_bullet_pos.x, _bullet_pos.y, obj_overworld_spade);
        with (tv_bullet)
        {
            effect = 1;
            snd_play_x(snd_wing, 1, 1.4);
            image_alpha = 0.5;
            sprite_index = spr_starbullet_test;
            image_xscale = 2;
            image_yscale = 2;
            hspeed = ((obj_mainchara.x + 16 + random_range(-30, 30)) - _bullet_pos.x) / 48;
            vspeed -= 8;
            gravity = 0.5;
            scr_doom(id, 60);
            target = 3;
        }
    }
    if (shoot_sequence_timer == 32)
    {
        current_screen_sprite = 3996;
        image_speed = 0.2;
    }
    if (shoot_sequence_timer == 48)
        screen_alpha = 0;
}
