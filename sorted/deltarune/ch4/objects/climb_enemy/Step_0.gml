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
    if (i_ex(obj_rotating_tower_controller_new))
    {
        var flash = scr_oflash_tower();
        flash.x += flashadjustmentx + 40;
        flash.y += flashadjustmenty;
    }
    else
    {
        var flash = scr_oflash();
        flash.x += flashadjustmentx;
        flash.y += flashadjustmenty;
    }
    var animation = instance_create(x + 20, y + 20, obj_animation);
    animation.sprite_index = spr_attack_cut1;
    animation.depth = depth - 10;
    animation.image_xscale = 2;
    animation.image_yscale = 2;
    if (i_ex(obj_rotating_tower_controller_new))
    {
        animation.x = obj_rotating_tower_controller_new.tower_x;
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
        damagecon = 3;
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
            animation.x = obj_rotating_tower_controller_new.tower_x;
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
            animation.x = obj_rotating_tower_controller_new.tower_x;
            animation.y = obj_rotating_tower_controller_new.krisy;
        }
        with (animation)
            scr_afterimage();
        snd_play_x(snd_swing, 1, 0.5);
        snd_play_x(snd_damage, 0.5, 0.5);
        snd_play_x(snd_punchmed, 0.4, 1);
        if (i_ex(obj_rotating_tower_controller_new))
        {
            var cut = scr_afterimage_cut_half_tower();
            cut.x += effectadjustmentx + 40;
            cut.y += effectadjustmenty;
        }
        else
        {
            var cut = scr_afterimage_cut_half();
            cut.x += effectadjustmentx;
            cut.y += effectadjustmenty;
        }
        instance_destroy();
    }
}
