scr_nexthero = function() //gml_Script_scr_nexthero
{
    moveswapped = false
    prevturn = global.charturn
    if (global.charturn == 0)
    {
        moveswapped = true
        if (global.charmove[1] == true && scr_charcan(1))
            global.charturn = 1
        else if (global.charmove[2] == true && scr_charcan(2))
            global.charturn = 2
        else
            scr_endturn()
    }
    if (global.charturn == 1 && moveswapped == false)
    {
        moveswapped = true
        if (scr_charcan(2) && global.acting[1] == false)
            global.charturn = 2
        else
            scr_endturn()
    }
    if (global.charturn == 2 && moveswapped == false)
        scr_endturn()
    if (moveswapped == true)
        global.bmenuno = 0
    if (global.charturn > 0)
    {
        global.temptension[global.charturn] = global.tension
        for (i = 0; i < 12; i += 1)
            tempitem[i][global.charturn] = tempitem[i][prevturn]
    }
    return;
}

