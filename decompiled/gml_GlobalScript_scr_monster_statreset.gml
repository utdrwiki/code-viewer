scr_monster_statreset = function(argument0) //gml_Script_scr_monster_statreset
{
    global.monster[argument0] = false
    global.monsterx[argument0] = 0
    global.monstery[argument0] = 0
    global.monstername[argument0] = stringsetloc(" ", "scr_monster_statreset_slash_scr_monster_statreset_gml_5_0")
    global.monsterat[argument0] = 0
    global.monsterdf[argument0] = 0
    global.monsterhp[argument0] = 0
    global.monstermaxhp[argument0] = 0
    global.monsterinstance[argument0] = 12913921839
    global.monstergold[argument0] = 0
    global.monsterexp[argument0] = 0
    global.sparepoint[argument0] = 0
    global.hittarget[argument0] = 0
    global.mercymod[argument0] = 0
    global.mercymax[argument0] = 0
    global.monstercomment[argument0] = " "
    global.monsterattackname[argument0] = " "
    global.monsterstatus[argument0] = false
    scr_monster_actreset(argument0)
    return;
}

