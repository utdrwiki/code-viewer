function scr_nexthero()
{
    moveswapped = 0;
    prevturn = global.charturn;
    if (global.charturn == 0)
    {
        moveswapped = 1;
        if (global.charmove[1] == 1 && scr_charcan(1))
            global.charturn = 1;
        else if (global.charmove[2] == 1 && scr_charcan(2))
            global.charturn = 2;
        else
            scr_endturn();
    }
    if (global.charturn == 1 && moveswapped == 0)
    {
        moveswapped = 1;
        if (scr_charcan(2) && global.acting[1] == 0)
            global.charturn = 2;
        else
            scr_endturn();
    }
    var endturn = false;
    if (global.charturn == 2 && global.chapter == 3 && i_ex(obj_heroralsei) && (obj_heroralsei.sprite_index == spr_ralseib_yarn_1 || obj_heroralsei.sprite_index == spr_ralseib_yarn_2))
        endturn = true;
    if ((global.charturn == 2 && moveswapped == 0) || endturn == true)
        scr_endturn();
    if (moveswapped == 1)
        global.bmenuno = 0;
    if (global.charturn > 0)
    {
        global.temptension[global.charturn] = global.tension;
        for (i = 0; i < 12; i += 1)
            tempitem[i][global.charturn] = tempitem[i][prevturn];
    }
}
