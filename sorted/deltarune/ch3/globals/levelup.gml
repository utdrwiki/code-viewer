function scr_levelup()
{
    var krismaxhp = 200;
    var susiemaxhp = 240;
    var ralseimaxhp = 180;
    var encountercountflag = 1248;
    var attackpluscountflag = 1249;
    var gainedstats = 0;
    global.flag[encountercountflag]++;
    if (global.maxhp[1] < krismaxhp || global.maxhp[2] < susiemaxhp || global.maxhp[3] < ralseimaxhp)
    {
        gainedstats = 1;
        if (global.maxhp[1] < krismaxhp)
        {
            global.maxhp[1] += 2;
            global.hp[1] += 2;
        }
        if (global.maxhp[2] < susiemaxhp)
        {
            global.maxhp[2] += 2;
            global.hp[2] += 2;
        }
        if (global.maxhp[3] < ralseimaxhp)
        {
            global.maxhp[3] += 2;
            global.hp[3] += 2;
        }
        if ((global.flag[encountercountflag] % 2) == 0)
            global.maxhp[2] += 1;
    }
    if ((global.flag[encountercountflag] % 10) == 0 && global.flag[attackpluscountflag] < 2)
    {
        gainedstats = 1;
        global.at[1] += 1;
        global.at[2] += 1;
        global.mag[2] += 1;
        global.at[3] += 1;
        global.mag[3] += 1;
        global.flag[attackpluscountflag]++;
    }
    if (scr_havechar(4))
    {
        global.flag[919]++;
        global.maxhp[4] += 4;
        global.hp[4] += 4;
        if ((global.flag[1248] % 4) == 0)
        {
            global.at[4] += 1;
            global.mag[4] += 1;
        }
    }
    global.maxhp[1] = clamp(global.maxhp[1], 10, krismaxhp);
    global.maxhp[2] = clamp(global.maxhp[2], 10, susiemaxhp);
    global.maxhp[3] = clamp(global.maxhp[3], 10, ralseimaxhp);
    global.maxhp[4] = clamp(global.maxhp[4], 10, 999);
    for (var _i = 1; _i < 5; _i++)
        global.hp[_i] = min(global.hp[_i], global.maxhp[_i]);
    return gainedstats;
}
