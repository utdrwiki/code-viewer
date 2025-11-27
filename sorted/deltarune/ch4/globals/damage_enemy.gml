function scr_damage_enemy(arg0, arg1)
{
    dm = instance_create(global.monsterx[arg0], (global.monstery[arg0] + 20) - (global.hittarget[arg0] * 20), obj_dmgwriter);
    if (caster < 4)
    {
        dm.type = global.char[caster] - 1;
        if (global.char[caster] == 4)
            dm.type = 6;
    }
    if (caster == 5)
        dm.type = 5;
    dm.damage = arg1;
    global.monsterhp[arg0] -= arg1;
    if (arg1 > 0)
    {
        with (global.monsterinstance[arg0])
        {
            shakex = 9;
            state = 3;
            hurttimer = 30;
        }
        if (i_ex(global.monsterinstance[arg0]))
            global.monsterinstance[arg0].hurtamt = arg1;
    }
    global.hittarget[arg0] += 1;
    if (arg1 == 0)
    {
        with (global.monsterinstance[arg0])
        {
            hurtamt = 0;
            if (hurttimer <= 15 && candodge == 1)
            {
                dodgetimer = 0;
                state = 4;
            }
        }
    }
    var a = 0;
    if (global.chapter == 4 && i_ex(obj_titan_enemy))
    {
        if (global.monsterhp[arg0] < 1)
            global.monsterhp[arg0] = 1;
    }
    if (global.monsterhp[arg0] <= 0 && a == 0)
    {
        with (global.monsterinstance[arg0])
            scr_monsterdefeat();
    }
}
