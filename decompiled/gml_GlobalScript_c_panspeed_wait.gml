c_panspeed_wait = function(argument0, argument1, argument2) //gml_Script_c_panspeed_wait
{
    c_cmd("panspeed", argument0, argument1, argument2, 0)
    c_wait(argument2)
    return;
}

