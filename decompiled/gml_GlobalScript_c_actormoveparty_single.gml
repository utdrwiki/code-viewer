c_actormoveparty_single = function(argument0, argument1) //gml_Script_c_actormoveparty_single
{
    if (argument0 == 0)
    {
        c_sel(argument0)
        c_walkdirect(obj_mainchara.x, obj_mainchara.y, argument1)
    }
    else if i_ex(global.cinstance[(argument0 - 1)])
    {
        c_sel(argument0)
        c_walkdirect(global.cinstance[(argument0 - 1)].x, global.cinstance[(argument0 - 1)].y, argument1)
    }
    return;
}

