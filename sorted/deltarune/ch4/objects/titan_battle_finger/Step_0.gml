damage = 90;
target = 4;
if (!i_ex(obj_heart))
    exit;
with (obj_collidebullet)
{
    if (variable_instance_exists(id, "parent_id"))
    {
        if (place_meeting(x, y, other.id) && parent_id != other.master.id)
            instance_destroy();
    }
}
var hx = obj_heart.x + 10;
var hy = obj_heart.y + 10;
var cur_weak_dist = (weak_dist - (weak_off[image_index] * 2)) + weak_bonus;
var myx = x + lengthdir_x(cur_weak_dist, image_angle);
var myy = y + lengthdir_y(cur_weak_dist, image_angle);
if (point_distance(myx, myy, hx, hy) < (obj_darkshape_light_aura.radius + 8))
{
    light = scr_approach(light, 1, 0.035);
    if (!irandom(2))
    {
        with (instance_create_depth(myx + random_range(-12, 12), myy + random_range(-12, 12), depth + 2, obj_particle_generic))
        {
            image_blend = c_white;
            direction = point_direction(obj_heart.x + 10, obj_heart.y + 10, x, y);
            speed = 1 + random(3);
            shrink_rate = 0.2;
        }
    }
}
else
{
    light = scr_approach(light, 0, light_rate);
}
if (light >= 1)
{
    instance_destroy();
    snd_play(snd_explosion_firework);
    master.fingers_broken++;
    if (master.fingers_broken == 4)
        master.master.selfdestruct(master);
    for (var aa = 0; aa < 2; aa++)
    {
        for (var bb = -1; bb < 5; bb++)
        {
            if (bb > 0 && aa == 0)
                scr_script_delayed(snd_play_pitch, bb * 2, 261, 0.75);
            if (aa == 0)
            {
                with (instance_create(x + lengthdir_x(20 * bb, image_angle) + irandom_range(-5, 5), y + lengthdir_y(20 * bb, image_angle) + irandom_range(-5, 5), obj_darkshape_greenblob))
                {
                    size = 1;
                    prime_me();
                }
            }
            with (instance_create(x + lengthdir_x(20 * bb, image_angle) + irandom_range(-15, 15), y + lengthdir_y(20 * bb, image_angle) + irandom_range(-15, 15), obj_battle_marker))
            {
                destroyoncomplete = true;
                sprite_index = spr_finisher_explosion;
                image_index = 0;
                image_speed = 0;
                image_alpha = 0;
                image_angle = irandom(360);
                image_xscale = 0.5;
                image_yscale = 0.5;
                direction = irandom(360);
                speed = 8;
                scr_lerpvar("speed", 8, 1, 8);
                scr_lerpvar("image_xscale", 0.5, 0.25, 4 * ((0.25 * bb) + 0.5));
                scr_lerpvar("image_yscale", 0.5, 0.25, 4 * ((0.25 * bb) + 0.5));
                scr_var("image_speed", (0.075 * bb) + 0.4);
                scr_var("image_alpha", 1);
            }
        }
    }
}
