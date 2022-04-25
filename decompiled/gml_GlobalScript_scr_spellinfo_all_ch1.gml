scr_spellinfo_all_ch1 = function() //gml_Script_scr_spellinfo_all_ch1
{
    for (j = 0; j < 4; j += 1)
    {
        for (i = 0; i < 12; i += 1)
        {
            spellid = global.spell[j][i]
            scr_spellinfo_ch1(spellid)
            global.spellname[j][i] = spellname
            global.spellnameb[j][i] = spellnameb
            global.spelldescb[j][i] = spelldescb
            global.spelldesc[j][i] = spelldesc
            global.spellcost[j][i] = cost
            global.spellusable[j][i] = spellusable
            global.spelltarget[j][i] = spelltarget
        }
    }
    return;
}

