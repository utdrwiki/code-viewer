object_get_depth_ch1 = function(argument0) //gml_Script_object_get_depth_ch1
{
    var objID = argument0
    var ret = 0
    if (objID >= 0 && objID < array_length_1d(global.__objectID2Depth_ch1))
        ret = global.__objectID2Depth_ch1[objID]
    return ret;
}

