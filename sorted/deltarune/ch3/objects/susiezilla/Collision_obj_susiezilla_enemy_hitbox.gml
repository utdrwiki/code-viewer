if (deadcon > 0)
    exit;
dashCon = 0;
slide = 0;
hit_me = 1;
if (invinciblecon == 1)
    hit_me = 0;
if (hit_me == 1)
{
    health_count -= other.damage;
    health_count_prev_timer = health_count_prev_timer_set;
    if (health_count <= 0 && deadcon == 0)
    {
        health_count = 0;
        deadcon = 1;
    }
    hurtcon = 1;
    hurttimer = 0;
    sprite_index = spr_susiezilla_hurt;
    image_index = 0;
    hspeed = 0;
    snd_play(snd_swing);
    snd_play(snd_hurt1);
    instance_create(x, y, obj_shake);
    if (other.hit_direction == -1)
    {
        var _hit_direction = -1;
        if (other.x < x)
            _hit_direction = 1;
        image_xscale = _hit_direction * -2;
        speed = 8 * _hit_direction;
        friction = 2;
    }
    else if (other.hit_direction > 0)
    {
        image_xscale = -2;
        speed = 8;
        friction = 2;
    }
    else
    {
        image_xscale = 2;
        speed = -8;
        friction = 2;
    }
    if (other.knockback)
        event_user(2);
    if (other.destroy_on_hit)
    {
        with (other)
            instance_destroy();
    }
    if (other.give_hurt > 0)
        hurt_length = other.give_hurt;
    if (other.give_invincibility > 0)
    {
        invinciblecon = 1;
        invincibilitytimer = -30;
    }
}
