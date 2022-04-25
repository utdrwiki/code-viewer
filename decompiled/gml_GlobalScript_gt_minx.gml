gt_minx = function() //gml_Script_gt_minx
{
    if instance_exists(obj_growtangle)
        return (obj_growtangle.x - (obj_growtangle.sprite_width / 2));
    return;
}

