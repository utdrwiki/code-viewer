scr_armorinfo_all_ch1 = function() //gml_Script_scr_armorinfo_all_ch1
{
    for (i = 0; i < 12; i += 1)
    {
        scr_armorinfo_ch1(global.armor[i])
        armorname[i] = armornametemp
        armordesc[i] = armordesctemp
        amessage2[i] = amessage2temp
        amessage3[i] = amessage3temp
        armorat[i] = armorattemp
        armordf[i] = armordftemp
        armormag[i] = armormagtemp
        armorbolts[i] = armorboltstemp
        armorgrazeamt[i] = armorgrazeamttemp
        armorgrazesize[i] = armorgrazesizetemp
        armorchar1[i] = armorchar1temp
        armorchar2[i] = armorchar2temp
        armorchar3[i] = armorchar3temp
        armorvalue[i] = value
        armorability[i] = armorabilitytemp
        armorabilityicon[i] = armorabilityicontemp
        armoricon[i] = armoricontemp
    }
    return;
}

