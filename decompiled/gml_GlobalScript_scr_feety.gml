scr_feety = function(argument0, argument1) //gml_Script_scr_feety
{
    if (i_ex(argument0) && i_ex(argument1))
        return ((argument1.y + argument1.sprite_height) - argument0.sprite_height);
    return;
}

