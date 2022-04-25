scr_dead_ch1 = function(argument0) //gml_Script_scr_dead_ch1
{
    global.charmove[argument0] = false
    global.charcantarget[argument0] = false
    global.chardead[argument0] = true
    global.charaction[argument0] = 0
    global.charspecial[argument0] = 0
    return;
}

