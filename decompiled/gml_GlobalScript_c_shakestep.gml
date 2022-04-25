c_shakestep = function(argument0, argument1) //gml_Script_c_shakestep
{
    c_autowalk(false)
    c_imageindex(1)
    c_addxy(argument0, argument1)
    c_var("stepsound", 1)
    c_delaycmd(15, "imageindex", 0)
    c_shakeobj()
    return;
}

