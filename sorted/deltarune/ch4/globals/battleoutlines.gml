function scr_battleoutline(arg0 = id, arg1 = true)
{
    return instance_create_depth(0, 0, arg0.depth - 1, obj_battleoutline, 
    {
        image_alpha: arg1 ? 0 : 0.7,
        target: arg0
    });
}
