if (x < (camerax() - sprite_width) || x > (camerax() + camerawidth() + sprite_width) || y < (cameray() - sprite_height) || y > (cameray() + 480 + sprite_height))
{
    if (outbound)
    {
        instance_destroy();
        exit;
    }
}
else
{
    outbound = true;
}
if (con == 1)
{
    friction = 0.5;
    con++;
}
else if (con == 2)
{
    if (speed == 0 && gravity == 0)
    {
        gravity = 0.1;
        gravity_direction = direction - 180;
        friction = 0;
        if (split)
        {
            var _finaltime = 54 - timer;
            var _len = 0.5 * gravity * sqr(_finaltime);
            var _subfinalx = screenx() + lengthdir_x(_len, gravity_direction);
            var _subfinaly = screeny() + lengthdir_y(_len, gravity_direction);
            finalx = _subfinalx - (_subfinaly / 2);
        }
    }
    timer++;
    if (timer >= 40 && !split)
    {
        timer = 0;
        con++;
        if (playSound)
            snd_play(snd_explosion_firework);
    }
    growstart = image_xscale;
}
else if (con == 2.5)
{
    if (split == 1)
    {
        speed = 0;
        gravity = 0;
        sprite_index = spr_knight_bullet_star_top;
        timer = -10;
        split = 2;
    }
    timer++;
    splitease = scr_ease_out(clamp01(timer / 20), 4) * splitmax * image_xscale;
    if (timer == 20)
    {
        con = 3;
        timer = 0;
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
        for (i = 0; i < 6; i++)
        {
            var _xx = x;
            var _yy = y;
            if (split > 0)
            {
                if (i == 0 || i >= 4)
                {
                    _xx += ((splitmax * image_xscale) / 2);
                    _yy += (splitmax * image_xscale);
                }
                else
                {
                    _xx -= ((splitmax * image_xscale) / 2);
                    _yy -= (splitmax * image_xscale);
                }
            }
            d = scr_childbullet(x, y, obj_knight_pointing_starchild);
            d.image_angle = _angle;
            d.direction = _angle;
            d.speed = 1;
            d.friction = -0.1;
            d.image_xscale = image_xscale * 0.5;
            d.image_yscale = image_yscale * 0.5;
            d.deceleration = 0.15;
            if (i == 1 || i == 4)
                _angle += 57;
            else
                _angle += 66;
        }
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
