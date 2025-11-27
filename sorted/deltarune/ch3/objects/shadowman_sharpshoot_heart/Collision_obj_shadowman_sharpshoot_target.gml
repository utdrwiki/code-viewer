if (i_ex(obj_shadowman_sharpshoot_target) && obj_shadowman_sharpshoot_target.type == 5)
    exit;
if (con == 0 && other.hittable == 1)
{
    con = 1;
    savey = other.parentid.y + 70 + irandom(35);
    event_user(0);
    if (other.type == 4)
    {
        with (obj_actor_tenna)
        {
            nose_sintimer = 0;
            nose_magnitude = 100;
            threepartmode = true;
            hitflash = 2;
        }
        snd_stop(snd_bump);
        snd_stop(snd_punch_ish_1);
        snd_play_x(snd_punch_ish_1, 0.5, 1.1);
        snd_play_x(snd_bump, 1.2, 0.7);
        if (obj_actor_tenna.lightemupcon != 4)
        {
            other.tennahp--;
            other.tennatransitionhp--;
        }
        if ((other.tennatransitionhp < 0 || other.tennahp < 1) && obj_lightemup_controller.transitioninit == 0)
        {
            other.tennatransitionhpmax -= 3;
            if (other.tennatransitionhpmax < 8)
                other.tennatransitionhpmax = 8;
            other.tennatransitionhp = other.tennatransitionhpmax;
            obj_lightemup_controller.transitioninit = 1;
            if (other.tennahp > 0)
            {
                obj_lightemup_controller.transitioninit = 2;
                obj_lightemup_controller.extra_timer = 0;
                with (obj_actor_tenna)
                {
                    geteasiertimer = round(geteasiertimer / 2);
                    geteasiertimer -= 50;
                    if (geteasiertimer < 0)
                        geteasiertimer = 0;
                }
            }
        }
        exit;
    }
    if (other.type == 5)
    {
        snd_stop(snd_bump);
        snd_play(snd_bump);
        exit;
    }
    if (other.type == 3)
    {
        with (obj_actor_tenna)
        {
            nose_sintimer = 0;
            nose_magnitude = 100;
            threepartmode = true;
        }
        with (obj_shadowman_enemy)
            board4sharpshootscene = true;
        snd_stop(snd_bump);
        snd_play(snd_bump);
    }
    if (other.type < 3)
    {
        if ((other.spare == false && (global.mercymod[other.parentid.myself] + other.parentid.sharpshootmercy) < 100) || (other.spare == true && other.sparehp > 0))
        {
            with (other)
                shake = 6;
            if (other.spare == false)
            {
                with (other.parentid)
                    sharpshootmercy += 10;
            }
            other.sparehp--;
            snd_stop(snd_bump);
            snd_play(snd_bump);
        }
        if ((other.spare == false && (global.mercymod[other.parentid.myself] + other.parentid.sharpshootmercy) >= 100 && other.type != 3) || (other.spare == true && other.sparehp <= 0))
        {
            with (other)
                event_user(0);
        }
    }
    if (other.type == 6)
    {
        if ((other.spare == false && (global.mercymod[other.parentid.myself] + other.parentid.sharpshootmercy) < 100) || (other.spare == true && other.sparehp > 0))
        {
            if (other.spare == false)
            {
                with (other.parentid)
                {
                    sharpshootmercy += 5;
                    sharpshootballoon = true;
                }
            }
            other.sparehp--;
            other.shake = 6;
            other.sprite_index = spr_zapper_spare_sharpshoot;
            other.changecolorcon = 1;
            other.changecolortimer = 0;
            snd_stop(snd_pinball);
            snd_play_x(snd_pinball, 1, 0.8 + random(0.4));
        }
        if (other.spare == true && other.sparehp < 1)
        {
            with (other)
                event_user(0);
        }
    }
    if (other.type == 7)
    {
        if ((other.spare == false && (global.mercymod[other.parentid.myself] + other.parentid.sharpshootmercy) < 100) || (other.spare == true && other.sparehp > 0))
        {
            if (other.spare == false)
            {
                with (other.parentid)
                {
                    sharpshootmercy += 5;
                    sharpshootballoon = true;
                }
            }
            other.sparehp--;
            other.shake = 6;
            other.sprite_index = spr_pippins_sharpshoot2;
            snd_stop(snd_bump);
            snd_play(snd_bump);
        }
        if (other.spare == true && other.sparehp < 1)
        {
            with (other)
                event_user(0);
        }
    }
    if (other.type == 8)
    {
        if ((other.spare == false && (global.mercymod[other.parentid.myself] + other.parentid.sharpshootmercy) < 100) || (other.spare == true && other.sparehp > 0))
        {
            if (other.spare == false)
            {
                with (other.parentid)
                {
                    sharpshootmercy += 5;
                    sharpshootballoon = true;
                }
            }
            other.sparehp--;
            other.shake = 6;
            other.sprite_index = spr_shutta_sharpshoot;
            snd_stop(snd_bump);
            snd_play(snd_bump);
        }
        if (other.spare == true && other.sparehp < 1)
        {
            with (other)
                event_user(0);
        }
    }
}
