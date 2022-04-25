scr_queen_buffercheck = function() //gml_Script_scr_queen_buffercheck
{
    return (instance_exists(obj_queen_buffercontroller) && obj_queen_buffercontroller.buffering == 1);
}

