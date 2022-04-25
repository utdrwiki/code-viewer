gt_miny = function() //gml_Script_gt_miny
{
    if instance_exists(obj_growtangle)
        return (obj_growtangle.y - (obj_growtangle.sprite_height / 2));
    return;
}

