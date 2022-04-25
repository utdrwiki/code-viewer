scr_itemshift_temp_ch1 = function(argument0, argument1) //gml_Script_scr_itemshift_temp_ch1
{
    tempitem[12][argument1] = 0
    for (i = argument0; i < 12; i += 1)
        tempitem[i][argument1] = tempitem[(i + 1)][argument1]
    return;
}

