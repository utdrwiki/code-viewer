scr_defeatrun_ch1 = function() //gml_Script_scr_defeatrun_ch1
{
    defeatanim = instance_create_ch1(x, y, obj_defeatanim_ch1)
    defeatanim.sprite_index = sprite_index
    defeatanim.sprite_index = hurtsprite
    defeatanim.image_index = 0
    defeatanim.image_xscale = image_xscale
    defeatanim.image_yscale = image_yscale
    instance_destroy()
    return;
}

