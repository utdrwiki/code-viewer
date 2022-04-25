gt_maxy = function() //gml_Script_gt_maxy
{
    if instance_exists(obj_growtangle)
        return (obj_growtangle.y + (obj_growtangle.sprite_height / 2));
    return;
}

