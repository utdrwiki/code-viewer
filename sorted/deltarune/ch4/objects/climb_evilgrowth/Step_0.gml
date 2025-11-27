if (damagecon == 1)
{
    if (!invincible)
    {
        damagecon = 2;
        active = 0;
    }
    else
    {
        damagecon = 0;
    }
}
if (damagecon == 2)
{
    timer = 0;
    image_blend = c_white;
    var animation = instance_create(x + 20, y + 20, obj_animation);
    animation.sprite_index = spr_attack_cut1;
    animation.depth = depth - 10;
    animation.image_xscale = 2;
    animation.image_yscale = 2;
    if (i_ex(obj_rotating_tower_controller_new))
    {
        animation.x = obj_rotating_tower_controller_new.krisx;
        animation.y = obj_rotating_tower_controller_new.krisy;
    }
    snd_play_x(snd_swing, 0.4, 1.2);
    snd_play_x(snd_laz_c, 0.3, 1.2);
    if (i_ex(obj_rotating_tower_controller_new))
        scr_shakeobj_tower();
    else
        scr_shakeobj();
    hp--;
    if (hp > 0)
    {
        damagecon = 0;
        with (obj_climb_kris)
        {
            fallingcon = 1;
            fallingtimer = 20;
        }
    }
    else
    {
        snd_play(snd_explosion, 0.5);
        damagecon = 3;
        eyetimer = 16;
    }
}
if (damagecon == 3)
{
    timer++;
    if (timer >= 8)
    {
        var animation = instance_create(x + 20, y + 20, obj_animation);
        animation.sprite_index = spr_attack_slap2;
        animation.image_blend = c_white;
        animation.image_speed = 0.5;
        animation.depth = depth - 1;
        animation.image_xscale = 2;
        animation.image_yscale = 2;
        if (i_ex(obj_rotating_tower_controller_new))
        {
            animation.x = obj_rotating_tower_controller_new.krisx;
            animation.y = obj_rotating_tower_controller_new.krisy;
        }
        animation = instance_create(x + 20, y + 20, obj_animation);
        animation.sprite_index = spr_attack_slap2;
        animation.image_blend = c_black;
        animation.image_speed = 0.5;
        animation.depth = depth - 1;
        animation.image_xscale = 3;
        animation.image_yscale = 3;
        if (i_ex(obj_rotating_tower_controller_new))
        {
            animation.x = obj_rotating_tower_controller_new.krisx;
            animation.y = obj_rotating_tower_controller_new.krisy;
        }
        with (animation)
            scr_afterimage();
        snd_play_x(snd_swing, 1, 0.5);
        snd_play_x(snd_damage, 0.5, 0.5);
        snd_play_x(snd_punchmed, 0.4, 1);
        damagecon = 4;
    }
}
image_index = max(0, (floor(current_time / 150) % 4) - 1);
if (progresscon == 0 && hp == 2)
{
    progresscon = 1;
    with (obj_climb_animationmarker)
    {
        if (index == 221 && place_meeting(x, y, other))
            event_user(10);
    }
    obj_rotating_tower_controller_new.tower_xshake = 5;
    eyetimer = 8;
    var e = instance_create(200, obj_climb_kris.y + 6, obj_climb_explosion);
    e.dowing = true;
}
else if (progresscon == 1 && hp == 1)
{
    progresscon = 2;
    with (obj_climb_animationmarker)
    {
        if (index == 222 && place_meeting(x, y, other))
            event_user(10);
    }
    var e = instance_create(440, obj_climb_kris.y + 6, obj_climb_explosion);
    e.image_xscale = -1;
    e.dowing = true;
    obj_rotating_tower_controller_new.tower_xshake = 5;
    eyetimer = 12;
}
if (eyetimer > 0)
{
    if (eyetimer < 16)
    {
        eyetimer--;
        eyey -= eyetimer;
    }
    else
    {
        eyey = 0;
    }
}
if (damagecon == 4)
{
    timer += 1;
    image_alpha -= 0.05;
    obj_rotating_tower_controller_new.tower_xshake = clamp(20 - (timer * 0.5), 0, 3) * (((floor(20 - timer) % 2) * 2) - 1);
}
