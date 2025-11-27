if (!i_ex(obj_homealone_heart))
    exit;
if (hit_heart)
{
    hit_timer++;
    if (hit_timer == 1)
    {
        global.interact = 1;
        image_index = 1;
        snd_play(snd_hurt1);
        snd_play(snd_wing);
        with (obj_homealone_heart)
        {
            image_angle = -45;
            hspeed = 6;
            gravity = 2;
        }
    }
    if (hit_timer == 8)
    {
        with (obj_homealone_heart)
        {
            gravity = 0;
            vspeed = 0;
            friction = 0.5;
        }
    }
    if (hit_timer == 10)
    {
        with (obj_homealone_heart)
            hspeed = 0;
    }
    if (hit_timer == 26)
    {
        image_index = 0;
        snd_play(snd_noise);
        global.interact = 0;
        with (obj_homealone_heart)
            image_angle = 0;
        hit_heart = false;
    }
}
else if (!hit_active)
{
    if (point_in_rectangle(obj_homealone_heart.x, obj_homealone_heart.y, x, y - (sprite_height / 2) - 8, x + (sprite_width / 2), (y - (sprite_height / 2)) + 8))
    {
        hit_heart = true;
        hit_active = true;
    }
}
else if (!point_in_rectangle(obj_homealone_heart.x, obj_homealone_heart.y, x, y - (sprite_height / 2) - 8, x + (sprite_width / 2), (y - (sprite_height / 2)) + 8))
{
    hit_active = false;
    hit_timer = 0;
}
