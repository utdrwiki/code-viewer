__view_set = function(argument0, argument1, argument2) //gml_Script___view_set
{
    var __prop = argument0
    var __index = argument1
    var __val = argument2
    __view_set_internal(__prop, __index, __val)
    var __res = __view_get(__prop, __index)
    return __res;
}

