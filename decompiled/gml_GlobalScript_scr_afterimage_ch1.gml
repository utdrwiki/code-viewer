scr_afterimage_ch1 = function() //gml_Script_scr_afterimage_ch1
{
    afterimage = instance_create_ch1(x, y, obj_afterimage_ch1)
    afterimage.sprite_index = sprite_index
    afterimage.image_index = image_index
    afterimage.image_blend = image_blend
    afterimage.image_speed = 0
    afterimage.depth = depth
    afterimage.image_xscale = image_xscale
    afterimage.image_yscale = image_yscale
    afterimage.image_angle = image_angle
    return afterimage;
}

