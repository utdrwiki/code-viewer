c_walktoobject = function(argument0, argument1, argument2, argument3) //gml_Script_c_walktoobject
{
    var _targetx = (argument0.x + argument1)
    var _targety = (argument0.y + argument2)
    c_cmd("walkdirect", _targetx, _targety, argument3, 0)
    c_walk()
    return;
}

c_delaywalktoobject = function(argument0, argument1, argument2, argument3, argument4) //gml_Script_c_delaywalktoobject
{
    _targetx = (argument1.x + argument2)
    _targety = (argument1.y + argument3)
    c_cmd_x("delaycmd", argument0, "walkdirect", _targetx, _targety, argument4, 0)
    return;
}

c_walktoobject_wait = function(argument0, argument1, argument2, argument3) //gml_Script_c_walktoobject_wait
{
    c_walktoobject(argument0, argument1, argument2, argument3)
    c_wait(argument3)
    return;
}

c_delaywalktoobject_wait = function(argument0, argument1, argument2, argument3, argument4) //gml_Script_c_delaywalktoobject_wait
{
    gml_Script_c_delaywalktoobject(argument0, argument1, argument2, argument3, argument4)
    c_wait((argument0 + argument4))
    return;
}

