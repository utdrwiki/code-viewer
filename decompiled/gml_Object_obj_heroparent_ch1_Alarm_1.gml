global.faceaction[myself] = 0
scr_retarget_ch1(myself)
if (cancelattack == false)
{
    dm = instance_create_ch1(global.monsterx[global.chartarget[myself]], ((global.monstery[global.chartarget[myself]] - (global.hittarget[global.chartarget[myself]] * 20)) + 20), obj_dmgwriter_ch1)
    dm.type = (char - 1)
    dm.delay = 8
    damage = round((((global.battleat[myself] * points) / 20) - (global.monsterdf[global.chartarget[myself]] * 3)))
    if (global.monstertype[global.chartarget[myself]] == 19)
        damage = ceil((damage * 0.3))
    if (damage < 0)
        damage = 0
    if (damage == 0)
    {
        dm.delay = 2
        with (global.monsterinstance[global.chartarget[myself]])
        {
            if (hurttimer <= 15 && candodge == true)
            {
                dodgetimer = 0
                state = 4
            }
        }
    }
    dm.damage = damage
    global.hittarget[global.chartarget[myself]] += 1
    global.monsterhp[global.chartarget[myself]] -= damage
    if (is_auto_susie == true && global.monsterhp[global.chartarget[myself]] <= 0)
    {
        with (global.chartarget[myself])
            global.flag[(51 + myself)] = 5
    }
    if (damage > 0)
    {
        if (global.monstertype[0] != 20)
            scr_tensionheal_ch1(round((points / 10)))
        if (global.monstertype[0] == 20)
            scr_tensionheal_ch1(round((points / 15)))
        attack = instance_create_ch1((global.monsterx[global.chartarget[myself]] + random(6)), (global.monstery[global.chartarget[myself]] + random(6)), obj_basicattack_ch1)
        if (object_index == obj_herosusie_ch1)
        {
            attack.sprite_index = spr_attack_mash2_ch1
            attack.image_speed = 0.5
            attack.maxindex = 4
            snd_play_ch1(snd_impact_ch1)
            instance_create_ch1(0, 0, obj_shake_ch1)
        }
        if (object_index == obj_heroralsei_ch1)
        {
            attack.sprite_index = spr_attack_slap1_ch1
            attack.maxindex = 4
            attack.image_speed = 0.5
        }
        if (points == 150)
        {
            attack.image_xscale = 2.5
            attack.image_yscale = 2.5
        }
        with (global.monsterinstance[global.chartarget[myself]])
        {
            shakex = 9
            state = 3
            hurttimer = 30
        }
        if instance_exists(global.monsterinstance[global.chartarget[myself]])
            global.monsterinstance[global.chartarget[myself]].hurtamt = damage
    }
    if (global.monsterhp[global.chartarget[myself]] <= 0)
    {
        with (global.monsterinstance[global.chartarget[myself]])
            scr_monsterdefeat_ch1()
    }
}
