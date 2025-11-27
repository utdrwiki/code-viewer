function scr_afterimage_cat()
{
    afterimage = instance_create(x + irandom_range(-sprite_width / 2, sprite_width / 2), y, obj_afterimage);
    afterimage.sprite_index = spr_mike_cat_dance;
    afterimage.image_index = irandom(20);
    afterimage.image_blend = image_blend;
    afterimage.image_speed = 0;
    afterimage.depth = depth;
    afterimage.fadeSpeed = 0.08;
    return afterimage;
}
