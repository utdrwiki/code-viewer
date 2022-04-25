scr_spareanim_ch1 = function() //gml_Script_scr_spareanim_ch1
{
    spareanim = instance_create_ch1(x, y, obj_spareanim_ch1)
    spareanim.sprite_index = sprite_index
    spareanim.sprite_index = sparedsprite
    spareanim.image_index = 0
    spareanim.image_xscale = image_xscale
    spareanim.image_yscale = image_yscale
    return;
}

