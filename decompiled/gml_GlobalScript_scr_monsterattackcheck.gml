scr_monsterattackcheck = function(argument0) //gml_Script_scr_monsterattackcheck
{
    for (i = 0; i < 3; i++)
    {
        if (global.monsterattackname[i] == argument0 && global.monster[i] == true)
            return 1;
    }
    return 0;
}

