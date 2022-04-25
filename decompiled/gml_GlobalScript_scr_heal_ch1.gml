scr_heal_ch1 = function(argument0, argument1) //gml_Script_scr_heal_ch1
{
    abovemaxhp = false
    belowzero = false
    hltarget = global.char[argument0]
    _curhp = global.hp[hltarget]
    if (global.hp[hltarget] <= 0)
        belowzero = true
    if (global.hp[hltarget] > global.maxhp[hltarget])
        abovemaxhp = true
    if (abovemaxhp == false)
    {
        global.hp[hltarget] += argument1
        if (global.hp[hltarget] > global.maxhp[hltarget])
            global.hp[hltarget] = global.maxhp[hltarget]
    }
    if (belowzero == true && global.hp[hltarget] >= 0)
    {
        if (global.hp[hltarget] < ceil((global.maxhp[hltarget] / 6)))
            global.hp[hltarget] = ceil((global.maxhp[hltarget] / 6))
        scr_revive_ch1(argument0)
    }
    snd_stop_ch1(snd_power_ch1)
    snd_play_ch1(snd_power_ch1)
    return (global.hp[hltarget] - _curhp);
}

