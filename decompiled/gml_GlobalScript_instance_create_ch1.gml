instance_create_ch1 = function(argument0, argument1, argument2) //gml_Script_instance_create_ch1
{
    var myDepth = object_get_depth_ch1(argument2)
    return instance_create_depth(argument0, argument1, myDepth, argument2);
}

