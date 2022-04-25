scr_tb_make_split = function(argument0, argument1, argument2, argument3, argument4) //gml_Script_scr_tb_make_split
{
    for (var i = 0; i < argument3; i += 1)
    {
        var _bul = scr_tb_make(argument0, (argument1 + ((i / argument3) * 360)), argument2, argument4, 1)
        with (_bul)
        {
            offsetAngle = ((i / argument3) * 360)
            if (i == 0)
                eatMe = 1
        }
    }
    return;
}

