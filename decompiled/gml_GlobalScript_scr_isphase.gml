scr_isphase = function(argument0) //gml_Script_scr_isphase
{
    __isphase = 0
    if (argument0 == "menu" && global.myfight == 0)
        __isphase = 1
    if (argument0 == "acting" && global.myfight == 3)
        __isphase = 1
    if (argument0 == "victory" && global.myfight == 7)
        __isphase = 1
    if (argument0 == "attack" || argument0 == "fight")
    {
        if (global.myfight == 1)
            __isphase = 1
    }
    if (argument0 == "spell" || argument0 == "item")
    {
        if (global.myfight == 4)
            __isphase = 1
    }
    if (argument0 == "enemytalk" || argument0 == "balloon")
    {
        if (global.mnfight == 1)
            __isphase = 1
    }
    if (argument0 == "enemyattack" || argument0 == "bullets")
    {
        if (global.mnfight == 2)
            __isphase = 1
    }
    return __isphase;
}

