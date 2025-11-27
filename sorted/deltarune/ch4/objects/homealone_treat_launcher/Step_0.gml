if (load_treat)
{
    load_timer++;
    if (load_timer == 1)
        sprite_index = spr_noellehouse_treat_launcher_in;
    if (load_timer == 5)
        image_index = 1;
    if (load_timer == 10)
        image_index = 2;
    if (load_timer == 15)
    {
        image_index = 3;
        snd_play(snd_noise);
    }
    if (load_timer == 20)
    {
        sprite_index = spr_noellehouse_treat_launcher_out;
        image_index = 0;
    }
}
if (shoot_treat)
{
    shoot_timer++;
    if (shoot_timer == 5)
    {
        image_index = 1;
        snd_play_pitch(snd_noise, 0.5);
    }
    if (shoot_timer == 10)
    {
        image_index = 2;
        snd_play_pitch(snd_noise, 1.1);
    }
    var delay = 40;
    if (shoot_timer == (15 + delay))
    {
        image_index = 3;
        snd_play(snd_noise);
        treat.hspeed = 0;
        treat.depth = 70000;
        treat.image_angle = 0;
        treat.x = x + 8;
        treat.y = y - treat.sprite_height;
        treat.visible = 1;
        if ((i_ex(obj_homealone_treat_catcher) && obj_homealone_treat_catcher.is_disabled) || !i_ex(obj_homealone_treat_catcher))
            scr_lerpvar_instance(treat, "vspeed", -20, -2, 24);
        else
            scr_lerpvar_instance(treat, "vspeed", -20, 0, 22);
    }
    if (shoot_timer == (20 + delay))
        image_index = 0;
    if (i_ex(obj_homealone_treat_catcher))
    {
        if (obj_homealone_treat_catcher.is_disabled)
        {
            if (i_ex(obj_homealone_rotating_fan))
            {
                if (!obj_homealone_rotating_fan.is_rotating)
                    hit_fan = true;
                if (hit_fan)
                {
                    if (shoot_timer == (38 + delay))
                    {
                        treat.vspeed = 0;
                        scr_lerpvar_instance(treat, "vspeed", -2, 2, 3);
                        scr_lerpvar_instance(treat, "hspeed", 10, 0, 25);
                    }
                    if (shoot_timer == (58 + delay))
                        scr_lerpvar_instance(treat, "vspeed", 2, 0, 3);
                    if (shoot_timer == (61 + delay))
                    {
                        hit_fan = false;
                        global.plot = 65;
                    }
                }
                else
                {
                    if (shoot_timer == (38 + delay))
                    {
                        treat.vspeed = 0;
                        scr_lerpvar_instance(treat, "vspeed", 0, 2, 3);
                        scr_lerpvar_instance(treat, "hspeed", 0, -1, 3);
                    }
                    if (shoot_timer == (45 + delay))
                    {
                        treat.vspeed = 0;
                        scr_lerpvar_instance(treat, "vspeed", 2, 0, 3);
                        scr_lerpvar_instance(treat, "hspeed", -1, 0, 3);
                    }
                }
            }
        }
        else
        {
            if (shoot_timer == (22 + delay))
            {
                snd_play(snd_noise);
                obj_homealone_treat_catcher.image_index = 1;
                with (obj_homealone_treat_catcher)
                    scr_shakeobj();
                treat.vspeed = 0;
                treat.depth = 900000;
                scr_lerpvar_instance(treat, "vspeed", 0, 12, 10);
            }
            if (shoot_timer == (23 + delay))
                scr_lerpvar_instance(treat, "hspeed", 0, -2, 5);
            if (shoot_timer == (28 + delay))
                scr_lerpvar_instance(treat, "hspeed", -2, 0, 5);
        }
    }
    if (shoot_timer == (70 + delay))
    {
        obj_homealone_treat_catcher.image_index = 0;
        shoot_timer = 0;
        shoot_treat = false;
    }
}
else
{
    event_inherited();
}
