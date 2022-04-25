scr_caterpillar_interpolate_ch1 = function() //gml_Script_scr_caterpillar_interpolate_ch1
{
    remx[0] = obj_mainchara_ch1.x
    remy[0] = obj_mainchara_ch1.y
    facing[0] = global.facing
    for (i = target; i > 0; i -= 1)
    {
        facing[i] = 2
        remx[i] = (obj_mainchara_ch1.x + ((x - obj_mainchara_ch1.x) * (i / target)))
        remy[i] = (obj_mainchara_ch1.y + ((y - obj_mainchara_ch1.y) * (i / target)))
    }
    return;
}

