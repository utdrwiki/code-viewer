instance_create = function(argument0, argument1, argument2) //gml_Script_instance_create
{
    var myDepth = object_get_depth(argument2)
    return instance_create_depth(argument0, argument1, myDepth, argument2);
}

