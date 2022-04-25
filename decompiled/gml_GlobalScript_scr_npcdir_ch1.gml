scr_npcdir_ch1 = function() //gml_Script_scr_npcdir_ch1
{
    if (facing == 0)
        sprite_index = dtsprite
    if (facing == 1)
        sprite_index = rtsprite
    if (facing == 2)
        sprite_index = utsprite
    if (facing == 3)
        sprite_index = ltsprite
    return;
}

