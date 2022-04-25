scr_actor_facing = function(argument0, argument1) //gml_Script_scr_actor_facing
{
    __newfacing = argument1
    argument0.facing = __newfacing
    if (__newfacing == "d")
        argument0.sprite_index = argument0.dsprite
    if (__newfacing == "r")
        argument0.sprite_index = argument0.rsprite
    if (__newfacing == "l")
        argument0.sprite_index = argument0.lsprite
    if (__newfacing == "u")
        argument0.sprite_index = argument0.usprite
    return;
}

