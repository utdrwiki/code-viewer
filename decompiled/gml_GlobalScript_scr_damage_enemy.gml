scr_damage_enemy = function(argument0, argument1) //gml_Script_scr_damage_enemy
{
    dm = instance_create(global.monsterx[argument0], ((global.monstery[argument0] + 20) - (global.hittarget[argument0] * 20)), obj_dmgwriter)
    if (caster < 4)
    {
        dm.type = (global.char[caster] - 1)
        if (global.char[caster] == 4)
            dm.type = 6
    }
    if (caster == 5)
        dm.type = 5
    dm.damage = argument1
    global.monsterhp[argument0] -= argument1
    if (argument1 > 0)
    {
        with (global.monsterinstance[argument0])
        {
            shakex = 9
            state = 3
            hurttimer = 30
        }
        if i_ex(global.monsterinstance[argument0])
            global.monsterinstance[argument0].hurtamt = argument1
    }
    global.hittarget[argument0] += 1
    if (argument1 == 0)
    {
        with (global.monsterinstance[argument0])
        {
            hurtamt = 0
            if (hurttimer <= 15 && candodge == true)
            {
                dodgetimer = 0
                state = 4
            }
        }
    }
    if (global.chapter == 2 && i_ex(obj_sweet_enemy) && global.monsterhp[argument0] <= 0)
        global.monsterhp[argument0] = 1
    var a = 0
    if (global.chapter == 2 && i_ex(obj_queen_enemy))
        a = 1
    if (global.chapter == 2 && i_ex(obj_spamton_neo_enemy))
        a = 2
    if (global.chapter == 2 && i_ex(obj_berdlyb_enemy))
        a = 3
    if (global.monsterhp[argument0] <= 0 && a == 0)
    {
        with (global.monsterinstance[argument0])
            scr_monsterdefeat()
    }
    if (global.chapter == 2 && global.monsterhp[argument0] <= 0 && a == 3)
    {
        with (global.monsterinstance[argument0])
            endcon = 1
    }
    return;
}

