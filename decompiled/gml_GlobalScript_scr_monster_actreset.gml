scr_monster_actreset = function(argument0) //gml_Script_scr_monster_actreset
{
    for (__fj = 0; __fj < 6; __fj += 1)
    {
        global.canact[argument0][__fj] = false
        global.actname[argument0][__fj] = " "
        global.actactor[argument0][__fj] = 1
        global.actdesc[argument0][__fj] = " "
        global.actcost[argument0][__fj] = 0
        global.actsimul[argument0][__fj] = false
        global.canactsus[argument0][__fj] = false
        global.actnamesus[argument0][__fj] = " "
        global.actdescsus[argument0][__fj] = " "
        global.actcostsus[argument0][__fj] = 0
        global.actsimulsus[argument0][__fj] = false
        global.canactral[argument0][__fj] = false
        global.actnameral[argument0][__fj] = " "
        global.actdescral[argument0][__fj] = " "
        global.actcostral[argument0][__fj] = 0
        global.actsimulral[argument0][__fj] = false
        global.canactnoe[argument0][__fj] = false
        global.actnamenoe[argument0][__fj] = " "
        global.actdescnoe[argument0][__fj] = " "
        global.actcostnoe[argument0][__fj] = 0
        global.actsimulnoe[argument0][__fj] = false
    }
    return;
}

