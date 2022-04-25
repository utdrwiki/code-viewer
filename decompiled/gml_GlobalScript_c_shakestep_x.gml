c_shakestep_x = function(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_c_shakestep_x
{
    c_autowalk(false)
    c_imageindex(1)
    c_addxy(argument0, argument1)
    if (argument5 == 1)
        c_var("stepsound", 1)
    c_delaycmd(argument2, "imageindex", 0)
    c_shakeobj()
    if (argument4 > 1)
    {
        for (__argi = 1; __argi < argument4; __argi++)
        {
            c_delaycmd((__argi * argument3), "imageindex", 1)
            c_delaycmd4((__argi * argument3), "addxy", argument0, argument1, 0, 0)
            if (argument5 == 1)
                c_delaycmd4((__argi * argument3), "var", 0, "stepsound", 1, 0)
            c_delaycmd(((__argi * argument3) + argument2), "imageindex", 0)
            c_delaycmd((__argi * argument3), "shakeobj", 0)
        }
    }
    return;
}

