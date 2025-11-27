fulltimer++;
if (behavior == "prepare")
{
    image_index = scr_approach(image_index, 2.8, 0.2);
    if (push_left)
    {
        x -= push_left;
        push_left *= 0.8;
        if (push_left < 1)
            push_left = 1;
    }
    if (image_index == 2.8)
        timer++;
    if (timer == 16)
    {
        push_left = 4;
        behavior = "slash";
        timer = 0;
        image_index = 3;
    }
}
if (behavior == "slash")
{
    if (timer < 20)
        image_index = scr_approach(image_index, 5.6, 0.4);
    timer++;
    if (push_left)
    {
        x += push_left;
        push_left *= 0.9;
    }
    if ((timer % 2) == 0 && timer < 24)
    {
        var offset = sin(timer + individuality) * 100;
        var temptime = timer;
        snd_play_pitch(snd_smallswing, 3);
        with (instance_create((scr_get_box(0) + 50 + random(20)) - (timer * 2), scr_get_box(1) + (scr_get_box(5) * 0.5) + offset, obj_roaringknight_slash))
        {
            direction = 240 + random(60);
            with (scr_fire_bullet(x, y, obj_bullet_knight_tunnelslash, choose(direction, direction + 180), 0, spr_roaringknight_slash_tunnel))
            {
                image_angle = other.direction;
                alarm[0] = 32 + (temptime * 4);
            }
        }
    }
    if (timer == 20)
        image_index--;
    if (timer == 24)
    {
        sprite_index = spr_roaringknight_point_ol;
        image_index = 0;
    }
    if (timer > 32 && timer < 56)
    {
        image_index = scr_approach(image_index, 4, 0.35);
        push_left = 1;
    }
}
if ((fulltimer % 2) == 0)
{
    fade = scr_afterimage();
    fade.image_alpha = 0.6;
    fade.fadeSpeed = 0.04;
    fade.hspeed = 4;
}
