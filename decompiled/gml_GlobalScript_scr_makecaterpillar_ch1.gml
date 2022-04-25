scr_makecaterpillar_ch1 = function(argument0, argument1, argument2, argument3) //gml_Script_scr_makecaterpillar_ch1
{
    global.cinstance[argument3] = instance_create_ch1(argument0, argument1, obj_caterpillarchara_ch1)
    global.cinstance[argument3].target = (12 + (argument3 * 12))
    if (argument2 == 3)
    {
        with (global.cinstance[argument3])
        {
            usprite = spr_ralseiu_ch1
            dsprite = spr_ralseid_ch1
            rsprite = spr_ralseir_ch1
            lsprite = spr_ralseil_ch1
        }
    }
    return global.cinstance[argument3];
}

