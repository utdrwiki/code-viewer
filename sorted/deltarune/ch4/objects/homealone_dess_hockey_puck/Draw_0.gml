if (!is_thrown && t == 0)
    draw_self();
if (t == 1)
{
    create_puck(obj_homealone_heart.x, obj_homealone_heart.y, depth);
    base_alpha = 1;
}
if (t >= 1)
{
    var base_x = x + 10;
    var base_y = y - 10;
    xDist = base_x - bounce_xpos;
    yDist = base_y - bounce_ypos;
    smear_width = 1;
    smear_length = abs(sqrt(sqr(xDist) + sqr(yDist)));
    smear_angle = degtorad(point_direction(base_x, base_y, bounce_xpos, bounce_ypos));
    alph = 0.1 / smear_length;
    base_alpha -= 0.25;
    for (var i = 0; i < smear_length; i += smear_width)
        draw_sprite_ext(spr_noellehouse_dess_hockey_puck_smear, 0, base_x + (cos(smear_angle) * i) + (cos(smear_angle) * (smear_width / 2)), (base_y - (sin(smear_angle) * i)) + (sin(smear_angle) * (smear_width / 2)), 1, 1, 0, c_white, base_alpha * ((t / 8) + (i / smear_length)));
    if (t == 2)
    {
        bounce = true;
        snd_play(snd_hurt1);
        with (obj_noellehouse_dess)
            hit_heart = true;
    }
    if (base_alpha <= 0)
    {
        if (loop)
        {
            t = 0;
            g = 0;
        }
        else
        {
            throw_choco = false;
            t = 0;
            g = 0;
            is_thrown = true;
        }
    }
}
if (bounce)
{
    bounce_timer++;
    if (bounce_timer >= 2)
    {
        var velocity = bounce_timer * 4;
        with (bounce_bottle)
        {
            var ypos = clamp(obj_homealone_heart.y + 100, y, 130);
            if (obj_homealone_heart.image_angle < 0)
                hspeed = (y != ypos) ? -2 : 0;
            else
                hspeed = (y != ypos) ? 2 : 0;
            y = scr_movetowards(y, ypos, velocity);
        }
    }
}
