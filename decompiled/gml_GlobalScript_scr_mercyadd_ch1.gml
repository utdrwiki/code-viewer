scr_mercyadd_ch1 = function(argument0, argument1) //gml_Script_scr_mercyadd_ch1
{
    global.mercymod[argument0] += argument1
    if (global.mercymod[argument0] < 0)
        global.mercymod[argument0] = 0
    return;
}

