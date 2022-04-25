scr_spellconsumeb_ch1 = function() //gml_Script_scr_spellconsumeb_ch1
{
    global.tension -= cost
    global.faceaction[global.charturn] = 2
    global.charaction[global.charturn] = 2
    global.charspecial[global.charturn] = global.spell[global.char[global.charturn]][global.bmenucoord[2][global.charturn]]
    global.tensionselect = 0
    scr_nexthero_ch1()
    return;
}

