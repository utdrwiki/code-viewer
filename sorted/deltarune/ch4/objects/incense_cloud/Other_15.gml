if (global.inv < 0)
{
    scr_damage_cache();
    if (!audio_is_playing(snd_hurt1) && !instance_exists(obj_shake))
    {
        instance_create(0, 0, obj_shake);
        snd_play(snd_hurt1);
    }
    var krisalive = true;
    var susiealive = true;
    var ralseialive = true;
    if (global.hp[1] < 1)
        krisalive = false;
    if (global.hp[2] < 1)
        susiealive = false;
    if (global.hp[3] < 1)
        ralseialive = false;
    var _r = 5;
    if (i_ex(obj_balthizard_enemy) && obj_balthizard_enemy.attackdown)
        _r = 2;
    repeat (_r)
    {
        var a = choose(0, 1, 2);
        if (a == 0)
        {
            if (global.hp[1] > 0)
                global.hp[1]--;
            else if (global.hp[2] > 0)
                global.hp[2]--;
            else if (global.hp[3] > 0)
                global.hp[1]--;
        }
        if (a == 1)
        {
            if (global.hp[2] > 0)
                global.hp[2]--;
            else if (global.hp[3] > 0)
                global.hp[3]--;
            else if (global.hp[1] > 0)
                global.hp[1]--;
        }
        if (a == 2)
        {
            if (global.hp[3] > 0)
                global.hp[3]--;
            else if (global.hp[1] > 0)
                global.hp[1]--;
            else if (global.hp[2] > 0)
                global.hp[2]--;
        }
    }
    if (global.hp[1] < 1 && krisalive)
    {
        __targx = global.charinstance[0].x;
        __targy = (global.charinstance[0].y + global.charinstance[0].myheight) - 24;
        dmgwriter = instance_create(__targx, __targy, obj_dmgwriter);
        dmgwriter.damage = abs(global.hp[1] - (global.maxhp[1] / 2));
        global.hp[1] = round(-global.maxhp[1] / 2);
        dmgwriter.type = 4;
        scr_dead(0);
    }
    if (global.hp[2] < 1 && susiealive)
    {
        __targx = global.charinstance[1].x;
        __targy = (global.charinstance[1].y + global.charinstance[1].myheight) - 24;
        dmgwriter = instance_create(__targx, __targy, obj_dmgwriter);
        dmgwriter.damage = abs(global.hp[2] - (global.maxhp[2] / 2));
        global.hp[2] = round(-global.maxhp[2] / 2);
        dmgwriter.type = 4;
        scr_dead(1);
    }
    if (global.hp[3] < 1 && ralseialive)
    {
        __targx = global.charinstance[2].x;
        __targy = (global.charinstance[2].y + global.charinstance[2].myheight) - 24;
        dmgwriter = instance_create(__targx, __targy, obj_dmgwriter);
        dmgwriter.damage = abs(global.hp[3] - (global.maxhp[3] / 2));
        global.hp[3] = round(-global.maxhp[3] / 2);
        dmgwriter.type = 4;
        scr_dead(2);
    }
    scr_damage_check();
    var gameover = 1;
    if (global.char[0] != 0 && global.hp[global.char[0]] > 0)
        gameover = 0;
    if (global.char[1] != 0 && global.hp[global.char[1]] > 0)
        gameover = 0;
    if (global.char[2] != 0 && global.hp[global.char[2]] > 0)
        gameover = 0;
    if (gameover == 1)
        scr_gameover();
}
