event_inherited();
radius = 22;
light = 0;

do_shrivel = function()
{
    if (light > 0.8)
        image = 8;
    else if (light > 0.6)
        image = 6;
    else if (light > 0.4)
        image = 4;
    else if (light > 0.2)
        image = 2;
    else
        image = 0;
};

do_pushback = function()
{
    with (obj_darkshape)
    {
        if (id != other.id && point_distance(x, y, other.x, other.y) < (other.radius * other.scalefactor))
        {
            var tempangle = point_direction(other.x, other.y, x, y);
            x += lengthdir_x(1, tempangle);
            y += lengthdir_y(1, tempangle);
        }
    }
};

check_death = function()
{
    var hx = obj_heart.x + 10;
    var hy = obj_heart.y + 10;
    if (light == 1)
    {
        snd_play(snd_chargeshot_fire);
        with (instance_create_depth(x, y, depth - 1, obj_battle_marker))
        {
            destroyoncomplete = true;
            sprite_index = spr_shockwave_explosive;
            image_blend = c_red;
            image_speed = 0.5;
            image_xscale = 2;
            image_yscale = 2;
        }
        for (var aa = 0; aa < 5; aa++)
        {
            with (scr_fire_bullet(x, y, obj_regularbullet, (scr_at_player(x, y) - 60) + (30 * aa) + random_range(-5, 5), 1.5 + random(1.5), spr_darkshape_mine_bullet))
            {
                image_speed = 0.5;
                image_xscale = 0.25;
                image_yscale = choose(4, -4);
                scr_lerpvar("image_xscale", image_xscale, 1, 10);
                scr_lerpvar("image_yscale", image_yscale, 1, 10);
                scr_lerpvar("speed", speed, speed * 4, 30);
                updateimageangle = true;
            }
        }
        instance_destroy();
    }
};

chase_heart = function()
{
    var hx = obj_heart.x + 10;
    var hy = obj_heart.y + 10;
    if (i_ex(obj_heart))
    {
        if (point_distance(x, y, hx, hy) < 64 || light > 0)
        {
            if (light == 0.01)
                snd_play_pitch(snd_swallow, 0.65);
            speed = scr_approach(speed, 0, speed * 0.05);
            light = scr_approach(light, 1, 0.025);
        }
        else
        {
            speed = scr_approach(speed, speed_max * speed_max_multiplier, accel * speed_max_multiplier * (1 - light));
        }
        var anglediff = angle_difference(direction, point_direction(x, y, hx, hy));
        direction -= clamp(sign(anglediff) * tracking_val, -abs(anglediff), abs(anglediff));
    }
};

image_xscale = 0.65;
image_yscale = 0.65;
scalefactor = 0.65;
alarm[0] = 60;
