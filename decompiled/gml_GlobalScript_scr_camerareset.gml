scr_camerareset = function(argument0) //gml_Script_scr_camerareset
{
    camreset = instance_create(x, y, obj_camera_resetter)
    camreset.timertarg = argument0
    return;
}

