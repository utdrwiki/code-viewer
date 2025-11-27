visible = true;
if (instance_exists(rotator_target))
{
    x = rotator_target.x + 16 + lengthdir_x(len, place);
    y = rotator_target.y + 16 + lengthdir_y(len, place);
    place += place_speed;
    len += len_speed;
}
else
{
    instance_destroy();
}
if (_type == 0)
{
    timer++;
    if (timer == 20)
        len_speed = 8;
    if (timer > 20)
        len_speed -= 0.3;
    if (len_speed < -6)
        len_speed = -6;
}
if (_type == 1)
{
    timer++;
    if (timer == 1)
        place_speed = 0;
    if (timer > 20)
        len_speed -= 0.6;
    if (len_speed < -6)
        len_speed = -6;
}
if (_type == 2)
{
    if (con == 1)
        timer++;
    if (timer == 1)
        len_speed = 10;
}
if (_type == 3)
{
    if (con == 1)
        timer++;
    if (timer == 1)
        len_speed = 5;
    if (timer == 31)
        len_speed = 0;
    if (timer == 46)
        len_speed = -5;
    if (timer == 76)
        len_speed = 0;
    if (timer == 91)
        len_speed = 5;
    if (timer == 121)
        len_speed = 0;
    if (timer == 136)
        len_speed = -5;
    if (timer == 166)
        len_speed = 0;
}
if (_type == 4)
{
    if (con == 1)
        timer++;
    if (timer >= 1 && timer < 13)
        len = lerp(len, 14, timer / 20);
    if (timer == 16)
    {
        if (!audio_is_playing(snd_board_mantle_dash_fast))
            snd_play(snd_board_mantle_dash_fast);
        len_speed = 16;
    }
    if (timer == 17)
    {
        mask_index = spr_shadow_mantle_fire;
        active_hitbox = true;
    }
}
if (_type == 4.5)
{
    if (con == 1)
        timer++;
    if (timer >= 1 && timer < 17)
        len = lerp(len, 14, timer / 26);
    if (timer == 21)
    {
        if (!audio_is_playing(snd_board_mantle_dash_fast))
            snd_play(snd_board_mantle_dash_fast);
        len_speed = 16;
    }
    if (timer == 22)
    {
        mask_index = spr_shadow_mantle_fire;
        active_hitbox = true;
    }
}
if (_type == 5)
{
    if (con == 1)
        timer++;
    if (timer >= 1 && timer < 8)
        len = lerp(len, 14, timer / 10);
    if (timer == 10)
    {
        if (!audio_is_playing(snd_board_mantle_dash_fast))
            snd_play(snd_board_mantle_dash_fast);
        len_speed = 16;
    }
    if (timer == 11)
    {
        mask_index = spr_shadow_mantle_fire;
        active_hitbox = true;
    }
}
alpha_timer++;
if (_type == 3 && alpha_timer == 190)
    instance_destroy();
if (_type != 3 && alpha_timer == 50)
    instance_destroy();
for (i = 5; i > 0; i -= 1)
{
    remx[i] = remx[i - 1];
    remy[i] = remy[i - 1];
}
remx[0] = x;
remy[0] = y;
