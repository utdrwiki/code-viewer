var speedrate = 1;
if (button2_h())
    speedrate = 2;
if (up_h())
    cursor_y -= (12 * speedrate);
if (down_h())
    cursor_y += (12 * speedrate);
if (right_h())
    cursor_x += (12 * speedrate);
if (left_h())
    cursor_x -= (12 * speedrate);
if (cursor_y < (cameray() + 42))
    cursor_y = cameray() + 42;
if (cursor_y > (cameray() + 300))
    cursor_y = cameray() + 300;
if (cursor_x < (camerax() + 220))
    cursor_x = camerax() + 220;
if (cursor_x > (camerax() + 600))
    cursor_x = camerax() + 600;
invincibility--;
if (scr_debug() && keyboard_check_pressed(ord("O")))
{
    obj_herokris.x += 8;
    obj_herokris.y += 12;
    obj_herosusie.x += 8;
    obj_herosusie.y += 6;
    obj_heroralsei.x += 4;
    instance_destroy();
    instance_create(x, y, obj_lightemup_controller);
}
if (transitioninit == 2)
{
    extra_timer++;
    if (extra_timer == 1)
    {
        with (obj_tenna_lightemup_bullet)
        {
            spritechangetimer = 0;
            spritechangecon = 1;
        }
    }
    if (extra_timer == 10)
    {
        extra_timer = 0;
        transitioninit = 0;
        channelnumber++;
        with (obj_tenna_enemy)
        {
            var _channelnumber = obj_lightemup_controller.channelnumber % 5;
            scr_act_charsprite_end();
            obj_herosusie.depth = obj_herokris.depth + 1000;
            if (_channelnumber == 1)
            {
                scr_act_charsprite("ralsei", spr_ralsei_zoosuit, 0, 0);
                scr_act_charsprite("kris", spr_kris_zoosuit, 0, 0);
                scr_act_charsprite("susie", spr_susie_zoosuit, 0, 0);
            }
            if (_channelnumber == 2)
            {
                scr_act_charsprite("ralsei", spr_ralsei_lightemup2, 0, 0);
                scr_act_charsprite("kris", spr_kris_lightemup2, 0, 0);
                scr_act_charsprite("susie", spr_susie_lightemup2, 0, 0);
            }
            if (_channelnumber == 3)
            {
                scr_act_charsprite("ralsei", spr_ralsei_lightemup4, 0, 0);
                scr_act_charsprite("kris", spr_kris_lightemup4, 0, 0);
                scr_act_charsprite("susie", spr_susie_lightemup4, 0, 0);
            }
            if (_channelnumber == 4)
            {
                scr_act_charsprite("ralsei", spr_ralsei_lightemup1, 0, 0);
                scr_act_charsprite("kris", spr_kris_lightemup1, 0, 0);
                scr_act_charsprite("susie", spr_susie_lightemup1, 0, 0);
            }
            if (_channelnumber == 0)
            {
                scr_act_charsprite("ralsei", spr_ralsei_lightemup3, 0, 0);
                scr_act_charsprite("kris", spr_kris_lightemup3, 0, 0);
                scr_act_charsprite("susie", spr_susie_lightemup3, 0, 0);
            }
            with (obj_oflash)
                instance_destroy();
            with (obj_afterimage)
                instance_destroy();
        }
        with (obj_tenna_minigame_ui)
            channelnumber++;
        if (!i_ex(obj_screen_channel_change))
        {
            inst = instance_create(x, y, obj_screen_channel_change);
            inst.depth = obj_tenna_minigame_ui.depth - 100;
        }
        with (obj_screen_channel_change)
        {
            if (i_ex(obj_actor_tenna) && obj_actor_tenna.changechanneltimermax < 25)
            {
                strength = obj_lightemup_controller.strength;
                obj_lightemup_controller.strength -= 10;
                if (obj_lightemup_controller.strength < 0)
                    obj_lightemup_controller.strength = 0;
            }
            event_user(0);
        }
    }
}
if (cursor_con == 0)
{
    var timermax = 12;
    var a = 280;
    if (obj_tenna_zoom.minigameinsanity == true)
        timermax = 6;
    if (obj_tenna_zoom.minigameinsanity == true && obj_tenna_zoom.minigameinsanitytimermax <= 40)
    {
        a = 20;
        cursor_y += extravar;
    }
    cursor_timer++;
    cursor_alpha = lerp(0, 1, cursor_timer / timermax);
    cursor_xscale = lerp(cursor_xscale, 1, cursor_timer / timermax);
    cursor_yscale = lerp(cursor_yscale, 1, cursor_timer / timermax);
    cursor_angle = lerp(cursor_angle, 394, 0.08);
    var xx = lerp(300, 0, cursor_timer / timermax);
    cursor_x = lerp(cursor_xstart, cursor_xstart + a + xx, cursor_timer / timermax);
    if (cursor_timer >= timermax)
    {
        cursor_angle = 360;
        cursor_timer = 0;
        cursor_con = 1;
        cursor_savey = cursor_y;
    }
}
if (cursor_con == 1)
{
    cursor_shoottimer++;
    if ((i_ex(obj_tenna_zoom) && obj_tenna_zoom.con >= 2) || (i_ex(obj_tenna_enemy) && obj_tenna_enemy.stopshoot == 1))
    {
    }
    else if ((button3_h() == 1 || button1_h() == 1) && cursor_shoottimer > 0 && shooting_enabled == true)
    {
        cursor_shoottimer = -3;
        inst = instance_create(obj_herokris.x + 27 + 34, obj_herokris.y + 33 + 12, obj_shadowman_sharpshoot_heart);
        inst.depth = obj_heroralsei.depth - 10;
        inst = instance_create(obj_herosusie.x + 27 + 49, obj_herosusie.y + 42, obj_shadowman_sharpshoot_heart);
        inst.depth = obj_heroralsei.depth - 10;
        inst = instance_create(obj_heroralsei.x + 47 + 32, (obj_heroralsei.y + 50) - 3, obj_shadowman_sharpshoot_heart);
        inst.depth = obj_heroralsei.depth - 10;
        snd_play_x(snd_noise, 0.2, 1.1 + random(0.2));
    }
    if (endattack)
    {
        cursor_alpha -= 0.1;
        if (cursor_alpha <= 0)
            instance_destroy();
    }
}
