if (finishattacktimer > 0)
{
    finishattacktimer--;
    if (finishattacktimer == 0)
    {
        global.faceaction[myself] = 0;
        scr_retarget(myself);
        var knightblock = 0;
        if (global.chapter == 3 && i_ex(obj_knight_enemy) && obj_knight_enemy.blocking == 1 && obj_knight_enemy.damagereduction < 0.1)
            knightblock = 1;
        if (cancelattack == 0)
        {
            dm = instance_create(global.monsterx[global.chartarget[myself]], (global.monstery[global.chartarget[myself]] - (global.hittarget[global.chartarget[myself]] * 20)) + 20, obj_dmgwriter);
            dm.type = char - 1;
            if (char == 4)
                dm.type = 6;
            dm.delay = 8;
            damage = round(((global.battleat[myself] * points) / 20) - (global.monsterdf[global.chartarget[myself]] * 3));
            if (global.chapter == 3 && i_ex(obj_knight_enemy))
            {
                damage = ceil(damage * obj_knight_enemy.damagereduction);
                if (object_index == obj_herokris)
                {
                    if (global.hp[2] < 0 && global.hp[3] < 0)
                        damage *= 2;
                    else if (global.hp[2] < 0 || global.hp[3] < 0)
                        damage *= 1;
                    else
                        damage = round(damage * 0.5);
                }
            }
            if (global.monstertype[global.chartarget[myself]] == 19)
                damage = ceil(damage * 0.3);
            if (i_ex(obj_tenna_enemy) && normalsprite == spr_krisr_dark)
            {
                if (obj_tenna_enemy.didkrisdoswordroute == true)
                    damage = ceil(damage * 3);
                if (obj_tenna_enemy.didkrisdoswordroute == false)
                    damage = ceil(damage * 0.5);
            }
            if (damage < 0)
                damage = 0;
            if (damage == 0)
            {
                dm.delay = 2;
                with (global.monsterinstance[global.chartarget[myself]])
                {
                    if (hurttimer <= 15 && candodge == 1)
                    {
                        dodgetimer = 0;
                        state = 4;
                    }
                }
            }
            dm.damage = damage;
            global.hittarget[global.chartarget[myself]] += 1;
            global.monsterhp[global.chartarget[myself]] -= damage;
            if (global.monsterhp[global.chartarget[myself]] <= 0)
                global.monster[global.chartarget[myself]] = 0;
            if (is_auto_susie == 1 && global.monsterhp[global.chartarget[myself]] <= 0)
            {
                with (global.chartarget[myself])
                    global.flag[51 + myself] = 5;
            }
            if (damage > 0)
            {
                if (global.monstertype[0] != 20)
                    scr_tensionheal(round(points / 10));
                if (global.monstertype[0] == 20)
                    scr_tensionheal(round(points / 15));
                if (knightblock == 1)
                    obj_knight_enemy.blockanim = 1;
                if (knightblock == 0)
                {
                    attack = instance_create(global.monsterx[global.chartarget[myself]] + random(6), global.monstery[global.chartarget[myself]] + random(6), obj_basicattack);
                    if (object_index == obj_herosusie)
                    {
                        attack.sprite_index = spr_attack_mash2;
                        attack.image_speed = 0.5;
                        attack.maxindex = 4;
                        snd_play(snd_impact);
                        instance_create(0, 0, obj_shake);
                    }
                    if (object_index == obj_heroralsei)
                    {
                        attack.sprite_index = spr_attack_slap1;
                        attack.maxindex = 4;
                        attack.image_speed = 0.5;
                    }
                    if (object_index == obj_heronoelle)
                    {
                        attack.sprite_index = spr_attack_slap2;
                        attack.maxindex = 4;
                        attack.image_speed = 0.5;
                    }
                    if (points == 150)
                    {
                        attack.image_xscale = 2.5;
                        attack.image_yscale = 2.5;
                    }
                    with (global.monsterinstance[global.chartarget[myself]])
                    {
                        shakex = 9;
                        state = 3;
                        hurttimer = 30;
                        if (global.chapter == 3 && i_ex(obj_knight_enemy) && damage >= 100)
                            obj_knight_enemy.stronghurtanim = true;
                    }
                }
                if (instance_exists(global.monsterinstance[global.chartarget[myself]]))
                    global.monsterinstance[global.chartarget[myself]].hurtamt = damage;
            }
        }
    }
}
