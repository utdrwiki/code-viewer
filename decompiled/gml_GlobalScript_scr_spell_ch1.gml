scr_spell_ch1 = function(argument0, argument1) //gml_Script_scr_spell_ch1
{
    spell = argument0
    caster = argument1
    star = global.chartarget[argument1]
    global.spelldelay = 10
    switch spell
    {
        case 0:
            break
        case 1:
            cancelattack = false
            if (global.monster[star] == false)
                scr_retarget_spell_ch1()
            if (cancelattack == false)
            {
                damage = ceil(((global.battleat[argument1] * 10) - (global.monsterdf[star] * 3)))
                if (global.automiss[star] == true)
                    damage = 0
                scr_damage_enemy_ch1(star, damage)
                attack = instance_create_ch1((global.monsterx[star] + random(6)), (global.monstery[star] + random(6)), obj_basicattack_ch1)
                attack.sprite_index = spr_attack_mash1_ch1
                dm.delay = 8
            }
            global.spelldelay = 30
            break
        case 2:
            healnum = (global.battlemag[argument1] * 5)
            scr_heal_ch1(star, healnum)
            global.charinstance[star].healnum = healnum
            with (global.charinstance[star])
            {
                ha = instance_create_ch1(x, y, obj_healanim_ch1)
                ha.target = id
                dmgwr = scr_dmgwriter_selfchar_ch1()
                with (dmgwr)
                {
                    delay = 8
                    type = 3
                }
                if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
                {
                    with (dmgwr)
                        specialmessage = 3
                }
                dmgwr.damage = healnum
                tu += 1
            }
            global.spelldelay = 15
            break
        case 3:
            if (global.monster[star] == false)
                scr_retarget_spell_ch1()
            if (global.monster[star] == true)
            {
                if (global.monsterstatus[star] == true)
                {
                    with (global.monsterinstance[star])
                    {
                        if (global.monstertype[myself] != 19 && global.monstertype[myself] != 3)
                        {
                            global.flag[(51 + myself)] = 3
                            event_user(10)
                            scr_monsterdefeat_ch1()
                        }
                        else
                        {
                            pacifycon = 1
                            global.spelldelay = 999
                        }
                    }
                }
                else
                {
                    _pspell = instance_create_ch1(0, 0, obj_pacifyspell_ch1)
                    _pspell.target = global.monsterinstance[star]
                    _pspell.fail = 1
                }
            }
            global.spelldelay = 20
            break
        case 4:
            cancelattack = false
            global.spelldelay = 30
            if (global.monster[star] == false)
                scr_retarget_spell_ch1()
            if (cancelattack == false)
            {
                global.spelldelay = 70
                damage = ceil((((global.battlemag[argument1] * 5) + (global.battleat[argument1] * 11)) - (global.monsterdf[star] * 3)))
                if (global.automiss[star] == true)
                    damage = 0
                attack = instance_create_ch1(obj_herosusie_ch1.x, obj_herosusie_ch1.y, obj_rudebuster_anim_ch1)
                attack.damage = damage
                attack.star = star
                attack.caster = caster
                attack.target = global.monsterinstance[star]
            }
            break
        case 5:
            cancelattack = false
            global.spelldelay = 30
            if (global.monster[star] == false)
                scr_retarget_spell_ch1()
            if (cancelattack == false)
            {
                global.spelldelay = 70
                damage = ceil((((global.battlemag[argument1] * 6) + (global.battleat[argument1] * 13)) - (global.monsterdf[star] * 6)))
                if (global.automiss[star] == true)
                    damage = 0
                attack = instance_create_ch1(obj_herosusie_ch1.x, obj_herosusie_ch1.y, obj_rudebuster_anim_ch1)
                attack.damage = damage
                attack.star = star
                attack.caster = caster
                attack.target = global.monsterinstance[star]
                attack.red = 1
            }
            break
        case 6:
            healnum = (global.battlemag[argument1] * 4)
            for (i = 0; i < 3; i += 1)
            {
                scr_heal_ch1(i, healnum)
                global.charinstance[i].healnum = healnum
                with (global.charinstance[i])
                {
                    ha = instance_create_ch1(x, y, obj_healanim_ch1)
                    ha.target = id
                    dmgwr = scr_dmgwriter_selfchar_ch1()
                    with (dmgwr)
                    {
                        delay = 8
                        type = 3
                    }
                    if (global.hp[global.char[myself]] >= global.maxhp[global.char[myself]])
                    {
                        with (dmgwr)
                            specialmessage = 3
                    }
                    dmgwr.damage = healnum
                    tu += 1
                }
            }
            global.spelldelay = 15
            break
        case 100:
            if (global.monster[star] == false)
                scr_retarget_spell_ch1()
            if (global.monster[star] == true)
            {
                if (global.mercymod[star] >= 100)
                {
                    if (global.monstertype[star] != 3)
                    {
                        with (global.monsterinstance[star])
                        {
                            global.flag[(51 + myself)] = 2
                            event_user(10)
                            scr_monsterdefeat_ch1()
                        }
                    }
                    else
                    {
                        with (global.monsterinstance[star])
                            sparecon = 1
                    }
                }
                else
                {
                    scr_mercyadd_ch1(star, global.sparepoint[star])
                    _pspell = instance_create_ch1(0, 0, obj_pacifyspell_ch1)
                    _pspell.target = global.monsterinstance[star]
                    _pspell.fail = 1
                    _pspell.flashcolor = c_yellow
                }
            }
            global.spelldelay = 0
            break
        case 200:
            break
        case 201:
            scr_healitemspell_ch1(40)
            break
        case 202:
            reviveamt = ceil((global.maxhp[global.char[star]] / 2))
            if (global.hp[global.char[star]] <= 0)
                reviveamt = (ceil(global.maxhp[global.char[star]]) + abs(global.hp[global.char[star]]))
            scr_healitemspell_ch1(reviveamt)
            break
        case 203:
            break
        case 204:
            break
        case 205:
            scr_healitemspell_ch1(20)
            break
        case 206:
            scr_healallitemspell_ch1(160)
            break
        case 207:
            scr_healallitemspell_ch1(80)
            break
        case 208:
            scr_healitemspell_ch1(70)
            break
        case 209:
            scr_healitemspell_ch1(50)
            break
        case 210:
            scr_healitemspell_ch1(4)
            break
        case 211:
            scr_healallitemspell_ch1(30)
            break
        case 212:
            if (global.char[star] == 1)
                scr_healitemspell_ch1(10)
            if (global.char[star] == 2)
                scr_healitemspell_ch1(90)
            if (global.char[star] == 3)
                scr_healitemspell_ch1(60)
            break
        case 213:
            if (global.char[star] == 1)
                scr_healitemspell_ch1(80)
            if (global.char[star] == 2)
                scr_healitemspell_ch1(30)
            if (global.char[star] == 3)
                scr_healitemspell_ch1(30)
            break
        case 214:
            scr_healitemspell_ch1(500)
            break
        case 215:
            scr_healitemspell_ch1(60)
            break
        default:

    }

    return;
}

