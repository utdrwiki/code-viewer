scr_dead = function(argument0) //gml_Script_scr_dead
{
    global.charmove[argument0] = false
    global.charcantarget[argument0] = false
    global.chardead[argument0] = true
    global.charaction[argument0] = 0
    global.charspecial[argument0] = 0
    return;
}

