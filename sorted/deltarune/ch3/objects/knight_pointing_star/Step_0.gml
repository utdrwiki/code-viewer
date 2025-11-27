if (x < (camerax() - (sprite_width / 2)) || y < (cameray() - (sprite_height / 2)) || y > (cameray() + 480 + (sprite_height / 2)))
{
    instance_destroy();
    exit;
}
if (!init)
{
    if (difficulty == 0)
        sprite_index = spr_knight_bullet_star_easy;
    init = true;
}
grazetimer++;
if ((grazetimer % 4) == 0)
    grazed = 0;
if (con == 0)
{
    image_xscale += growspeed;
    image_yscale += growspeed;
}
else if (con == 1)
{
    friction = 0.5;
    con++;
}
else if (con == 2)
{
    mask_index = spr_knight_bullet_star_mask;
    if (speed == 0)
    {
        gravity = 0.1;
        gravity_direction = direction - 180;
        friction = 0;
    }
    timer++;
    if (timer >= 40)
    {
        timer = 0;
        con++;
        if (playSound)
            snd_play(snd_explosion_firework);
    }
    growstart = image_xscale;
    if (difficulty == 2)
    {
    }
}
else if (con == 3)
{
    timer++;
    image_xscale = growstart + clamp01(timer / 2);
    image_yscale = growstart + clamp01(timer / 2);
    if (timer == 3)
    {
        var _angle = 90;
        var _count = 6;
        if (difficulty == 2)
        {
            _angle += side;
            _count = 2;
        }
        for (i = 0; i < 6; i++)
        {
            d = scr_childbullet(x, y, obj_knight_pointing_starchild);
            d.image_angle = _angle;
            d.direction = _angle;
            if (difficulty == 0 && (i % 2) == 1)
            {
                d.speed = 1;
                d.lifetime = 30;
            }
            else
            {
                d.speed = 4;
            }
            d.image_xscale = image_xscale * 0.5;
            d.image_yscale = image_yscale * 0.5;
            d.deceleration = 0.15;
            if (difficulty == 2 && (i % 3) > 0)
            {
                d.difficulty = -1;
                d.lifetime = 30;
                d.speed = 2;
                if (i == 1 || i == 4)
                {
                    d.speed /= 3;
                    d.minspeed /= 3;
                    d.deceleration /= 3;
                }
                else
                {
                    d.speed *= 2/3;
                    d.minspeed *= 2/3;
                    d.deceleration *= 2/3;
                }
                d.sprite_index = spr_knight_starchild_trail;
            }
            else
            {
                d.difficulty = difficulty;
            }
            if (i == 1 || i == 4)
                _angle += ((difficulty == 2) ? 180 : 48);
            else
                _angle += ((difficulty == 2) ? 0 : 66);
        }
        active = false;
    }
    if (timer >= 4)
    {
        image_xscale = (sprite_width + 16) / sprite_get_width(sprite_index);
        image_yscale = (sprite_height + 16) / sprite_get_height(sprite_index);
        var _aimage = scr_afterimage();
        _aimage.fadeSpeed *= 3;
        instance_destroy();
    }
}
