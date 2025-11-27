var temph = other.hspeed;
var tempv = other.vspeed;
if (overpower)
{
    snd_stop(snd_noise);
    snd_play_pitch(snd_noise, 0.8);
    with (other)
    {
        repeat (other.overpower)
        {
            image_xscale *= 0.92;
            image_yscale *= 0.92;
        }
    }
    if (other.image_xscale < 0.5)
    {
        instance_destroy(other.id);
    }
    else
    {
        if (object_index == obj_bullet_snow && other.object_index == obj_bullet_submoon)
            other.slow_factor += (24 * sqr(overpower));
        if (object_index == obj_bullet_rain && other.object_index == obj_bullet_submoon)
            other.push = vspeed / 2;
    }
    instance_destroy();
    if (other.sprite_index == spr_lanino_moon)
    {
        repeat (3)
        {
            with (instance_create(x, y, obj_bulletparent))
            {
                hspeed = -2 + random(3) + temph;
                vspeed = (-3 - random(2)) + tempv;
                gravity = 0.25;
                sprite_index = spr_ball;
                image_speed = 0;
                image_blend = c_gray;
                image_xscale = 0.1;
                image_yscale = 0.1;
                scr_lerpvar("image_alpha", 1, 0, 30);
                scr_script_delayed(instance_destroy, 30);
            }
        }
    }
    if (other.sprite_index == spr_lanino_sun)
    {
        with (instance_create(x, y, obj_regularbullet))
        {
            active = false;
            spin = 1;
            spinspeed = random(5) - 0.25;
            direction = 70 + random(40);
            speed = 1 + random(1);
            image_xscale = 0.5;
            image_yscale = 0.5;
            sprite_index = spr_cakesmoke;
            scr_lerpvar("image_alpha", 1, 0, 30);
            scr_script_delayed(instance_destroy, 30);
        }
    }
}
