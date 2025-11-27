function scr_ch3_violencecheck()
{
    var __violence = 0;
    if (global.flag[580] == 1)
        __violence++;
    if (global.flag[581] == 1)
        __violence++;
    if (global.flag[582] == 1)
        __violence++;
    if (global.flag[583] == 1)
        __violence++;
    if (global.flag[584] == 1)
        __violence++;
    if (global.flag[586] == 1)
        __violence++;
    if (global.flag[587] == 1)
        __violence++;
    if (global.flag[588] == 1)
        __violence++;
    if (global.flag[589] == 1)
        __violence++;
    if (global.flag[590] == 1)
        __violence++;
    if (global.flag[591] == 1)
        __violence++;
    if (global.flag[592] == 1)
        __violence++;
    if (global.flag[593] == 1)
        __violence++;
    debug_message("scr_ch3_violencecheck() - Violence count: " + string(__violence));
    return __violence;
}
