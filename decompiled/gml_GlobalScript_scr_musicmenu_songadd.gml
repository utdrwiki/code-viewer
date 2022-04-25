scr_musicmenu_songadd = function(argument0, argument1) //gml_Script_scr_musicmenu_songadd
{
    songOgg[songCount] = argument0
    songName[songCount] = ((string((songCount + 1)) + " - ") + argument1)
    songCount++
    return;
}

