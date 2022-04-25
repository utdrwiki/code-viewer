scr_afterimagefast = function() //gml_Script_scr_afterimagefast
{
    afterimage = instance_create(x, y, obj_afterimage)
    afterimage.sprite_index = sprite_index
    afterimage.image_index = image_index
    afterimage.image_blend = image_blend
    afterimage.image_speed = 0
    afterimage.depth = depth
    afterimage.image_xscale = image_xscale
    afterimage.image_yscale = image_yscale
    afterimage.image_angle = image_angle
    afterimage.fadeSpeed = 0.08
    return afterimage;
}

