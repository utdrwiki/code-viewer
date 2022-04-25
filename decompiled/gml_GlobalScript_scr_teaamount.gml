scr_teaamount = function(argument0, argument1) //gml_Script_scr_teaamount
{
    var __healamt = 10
    if (argument0 == 1)
    {
        if (argument1 == 1)
            __healamt = 10
        if (argument1 == 2)
            __healamt = 120
        if (argument1 == 3)
            __healamt = 120
        if (argument1 == 4)
            __healamt = 70
    }
    if (argument0 == 2)
    {
        if (argument1 == 1)
            __healamt = 120
        if (argument1 == 2)
            __healamt = 10
        if (argument1 == 3)
            __healamt = 120
        if (argument1 == 4)
            __healamt = 400
    }
    if (argument0 == 3)
    {
        if (argument1 == 1)
            __healamt = 60
        if (argument1 == 2)
            __healamt = 120
        if (argument1 == 3)
            __healamt = 10
        if (argument1 == 4)
            __healamt = 50
    }
    if (argument0 == 4)
    {
        if (argument1 == 1)
            __healamt = 70
        if (argument1 == 2)
            __healamt = 120
        if (argument1 == 3)
            __healamt = 50
        if (argument1 == 4)
            __healamt = 10
    }
    if (global.fighting == true && __healamt < 40)
        __healamt = 40
    if (global.chapter == 2)
    {
        if i_ex(o_boxingcontroller)
            __healamt = 100
    }
    return __healamt;
}

