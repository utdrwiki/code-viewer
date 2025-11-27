function scr_board_afterimage()
{
    var afterimage = instance_create(x, y, obj_board_afterimage);
    afterimage.depth = depth;
    afterimage.sprite_index = sprite_index;
    afterimage.image_index = image_index;
    afterimage.image_speed = image_speed;
    afterimage.image_xscale = image_xscale;
    afterimage.image_yscale = image_yscale;
    afterimage.image_angle = image_angle;
    if (argument_count >= 1)
        afterimage.type = argument0;
    if (argument_count >= 2)
        afterimage.length = argument1;
    if (argument_count >= 3)
        afterimage.flickerrate = argument2;
    return afterimage;
}
