scr_retarget_spell_ch1 = function() //gml_Script_scr_retarget_spell_ch1
{
    cancelattack = false
    if (star == 0)
    {
        if (global.monster[0] == false)
            star = 1
    }
    if (star == 1)
    {
        if (global.monster[1] == false)
            star = 2
    }
    if (star == 2)
    {
        if (global.monster[2] == false)
            star = 3
        if (star == 3 && global.monster[0] == true)
            star = 0
        if (star == 3 && global.monster[1] == true)
            star = 1
        if (star == 3)
            cancelattack = true
    }
    return;
}

