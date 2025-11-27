timer++;
if (scare_con >= 1)
{
    if (scare_con == 1 && timer >= 10)
        event_user(1);
    if (scare_con == 2 && timer >= 35)
    {
        event_user(1);
        obj_jackenstein_enemy.spooked = true;
        with (instance_create(x - 145, y + 80, obj_takingtoolong))
            bright = 1;
        snd_play(snd_your_too_bright);
    }
    if (scare_con == 3 && timer >= 75)
    {
        timer = 0;
        scare_con = -1;
    }
    if (scare_con >= 1)
        exit;
}
if (ticks < 0)
{
    ticks += 1;
}
else if (point_distance(x, y, obj_heart.x + 4, obj_heart.y + 4) < light_distance && alarm[0] == -1)
{
    if (!feared && scare_con == 0)
    {
        speed = 0;
        sound_play(snd_bluh);
        scare_con = 1;
        exit;
    }
    ticks += 0.2;
    if (ticks >= 1)
    {
        ticks = -45;
        completed_ticks++;
        if (!feared)
        {
            feared = true;
            alarm[0] = 30;
            sprite_index = spr_jackolantern_stunned;
            event_user(0);
        }
        sound_play(snd_bluh);
        with (obj_jackenstein_enemy)
        {
            if (!i_ex(obj_dmgwriter_boogie))
            {
                global.mercymod[myself] += 7;
                __mercydmgwriter = instance_create_depth(global.monsterx[myself], global.monstery[myself] + 40, depth - 99999, obj_dmgwriter_boogie);
                __mercydmgwriter.damage = 7;
                __mercydmgwriter.type = 5;
                global.hittarget[myself]++;
                snd_play_x(snd_mercyadd, 0.8, 1.4);
            }
            else if (global.mercymod[myself] < 100)
            {
                obj_dmgwriter_boogie.damage += 7;
                obj_dmgwriter_boogie.init = 0;
                global.mercymod[myself] += 7;
            }
            if (global.mercymod[myself] > 100)
            {
                if (i_ex(obj_dmgwriter_boogie))
                    obj_dmgwriter_boogie.damage -= (global.mercymod[myself] - 100);
                global.mercymod[myself] = 100;
            }
        }
        if (completed_ticks == run_threshold)
        {
            global.turntimer = 30;
            targ_x = xstart;
            targ_y = ystart;
            speed = 5;
            friction = 0.1;
            direction = point_direction(x, y, targ_x, targ_y);
        }
    }
}
if (completed_ticks < run_threshold)
{
    if (feared && alarm[0] == -1)
    {
        reset_timer++;
        if (reset_timer > 90 || point_distance(x, y, targ_x, targ_y) < 15)
        {
            event_user(0);
            reset_timer = 0;
        }
        speed = 3 + log2(max(1, abs(ticks))) + completed_ticks;
        direction = point_direction(x, y, targ_x, targ_y);
    }
    else if (alarm[0])
    {
        speed *= 0.95;
        speed -= 0.125;
    }
    else
    {
        speed = min(sqrt(max(0, timer - 30)), 4) / (1 + ticks + completed_ticks);
        direction = scr_at_player(x, y);
    }
}
