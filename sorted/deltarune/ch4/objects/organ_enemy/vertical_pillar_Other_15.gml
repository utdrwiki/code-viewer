if (green == 1)
{
    var a = 1;
    if (chorus == 1)
        a = 3;
    if (i_ex(obj_organ_enemy) && obj_organ_enemy.wicabell_tuning)
        a = 2;
    repeat (a)
    {
        if (!i_ex(obj_dmgwriter_boogie))
        {
            with (obj_monsterparent)
            {
                if (global.mercymod[myself] < 100)
                {
                    snd_stop(snd_mercyadd);
                    snd_play_x(snd_mercyadd, 0.8, 1.4);
                    var mercygiven = 0;
                    if (other.parentid == id)
                        mercygiven = 3;
                    else if (object_index == obj_organ_enemy)
                        mercygiven = 1;
                    else if (object_index == obj_halo_enemy)
                        mercygiven = 1;
                    else if (object_index == obj_bell_enemy)
                        mercygiven = 1;
                    if ((global.mercymod[myself] + mercygiven) > 100)
                        mercygiven = 100 - global.mercymod[myself];
                    __mercydmgwriter = instance_create_depth(global.monsterx[myself], global.monstery[myself] + 40, depth - 99999, obj_dmgwriter_boogie);
                    __mercydmgwriter.damage = mercygiven;
                    __mercydmgwriter.type = 5;
                    global.mercymod[myself] += mercygiven;
                    global.hittarget[myself]++;
                }
            }
        }
        else
        {
            with (obj_monsterparent)
            {
                if (global.mercymod[myself] < 100)
                {
                    var mercygiven = 0;
                    if (other.parentid == id)
                        mercygiven = 3;
                    else if (object_index == obj_organ_enemy)
                        mercygiven = 1;
                    else if (object_index == obj_halo_enemy)
                        mercygiven = 1;
                    else if (object_index == obj_bell_enemy)
                        mercygiven = 1;
                    if ((global.mercymod[myself] + mercygiven) > 100)
                        mercygiven = 100 - global.mercymod[myself];
                    __mercydmgwriter.damage += mercygiven;
                    __mercydmgwriter.init = 0;
                    global.mercymod[myself] += mercygiven;
                }
            }
        }
    }
    with (obj_organ_enemy)
        snd_volume(harmon_sound, 1, 6);
    touchingplayer = 2;
}
else
{
    with (obj_dmgwriter_boogie)
    {
        killtimer = 0;
        killactive = 0;
        kill = 0;
    }
    if (active == 1)
    {
        if (target != 3)
            scr_damage();
        if (target == 3)
            scr_damage_all();
        if (destroyonhit == 1)
            instance_destroy();
    }
}
