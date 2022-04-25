scr_actinfo_temp = function(argument0) //gml_Script_scr_actinfo_temp
{
    for (__acti = 0; __acti < 6; __acti++)
    {
        canact[__acti] = false
        if (global.char[global.charturn] == 1)
        {
            canact[__acti] = global.canact[argument0][__acti]
            acttpcost[__acti] = global.actcost[argument0][__acti]
            actsimul[__acti] = global.actsimul[argument0][__acti]
        }
        if (global.char[global.charturn] == 2)
        {
            canact[__acti] = global.canactsus[argument0][__acti]
            acttpcost[__acti] = global.actcostsus[argument0][__acti]
            actsimul[__acti] = global.actsimulsus[argument0][__acti]
        }
        if (global.char[global.charturn] == 3)
        {
            canact[__acti] = global.canactral[argument0][__acti]
            acttpcost[__acti] = global.actcostral[argument0][__acti]
            actsimul[__acti] = global.actsimulral[argument0][__acti]
        }
        if (global.char[global.charturn] == 4)
        {
            canact[__acti] = global.canactnoe[argument0][__acti]
            acttpcost[__acti] = global.actcostnoe[argument0][__acti]
            actsimul[__acti] = global.actsimulnoe[argument0][__acti]
        }
    }
    return;
}

