scr_itemconsumeb = function() //gml_Script_scr_itemconsumeb
{
    global.faceaction[global.charturn] = 3
    global.charaction[global.charturn] = 4
    global.charspecial[global.charturn] = (tempitem[global.bmenucoord[4][global.charturn]][global.charturn] + 200)
    if (usable == true && replaceable == false)
        scr_itemshift_temp(global.bmenucoord[4][global.charturn], global.charturn)
    else if (replaceable > false)
        tempitem[global.bmenucoord[4][global.charturn]][global.charturn] = replaceable
    scr_nexthero()
    return;
}

