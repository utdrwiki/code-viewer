if (active == 1)
{
    damage = 50;
    element = 6;
    if (obj_rouxls_ch3_enemy.ralseiyarnhp > 0 && global.hp[3] > 0)
    {
        damage = floor(global.hp[3] / 2);
        if (damage > 40)
            damage = 40;
        target = 2;
    }
    else
    {
        target = choose(0, 1);
    }
    if (damage != 0)
        scr_damage();
    if (destroyonhit == 1)
        instance_destroy();
    if (global.hp[3] > 0)
    {
        target = 2;
        instance_destroy();
        snd_play(snd_bump);
        obj_rouxls_ch3_enemy.ralseiyarnhp--;
        if (obj_rouxls_ch3_enemy.ralseiyarnhp == 1)
        {
        }
        if (obj_rouxls_ch3_enemy.ralseiyarnhp == 0)
        {
            scr_battle_sprite_set("ralsei", spr_ralseib_yarn_2, 0, 0);
            obj_rouxls_ch3_enemy.shadowmengetfiredcon = 1;
            obj_rouxls_ch3_enemy.destroywriter = false;
            with (obj_battlecontroller)
                noreturn = 1;
            snd_play_x(snd_awkward, 0.67, 1);
            scr_shakescreen();
        }
    }
    else
    {
        scr_battle_sprite_reset("ralsei");
    }
}
