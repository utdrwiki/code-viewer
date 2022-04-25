scr_tb_make_crescent = function(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_scr_tb_make_crescent
{
    for (var i = 0; i < argument5; i += 1)
        scr_tb_make(argument0, (argument1 + (i * argument2)), argument3, argument4, 1)
    return;
}

