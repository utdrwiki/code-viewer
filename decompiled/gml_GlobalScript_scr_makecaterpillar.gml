scr_makecaterpillar = function(argument0, argument1, argument2, argument3) //gml_Script_scr_makecaterpillar
{
    global.cinstance[argument3] = instance_create(argument0, argument1, obj_caterpillarchara)
    global.cinstance[argument3].target = (12 + (argument3 * 12))
    if (argument2 == 3)
    {
        with (global.cinstance[argument3])
        {
            usprite = spr_ralseiu
            dsprite = spr_ralseid
            rsprite = spr_ralseir
            lsprite = spr_ralseil
            if (global.chapter >= 2)
            {
                name = "ralsei"
                usprite = spr_ralsei_walk_up
                dsprite = spr_ralsei_walk_down
                rsprite = spr_ralsei_walk_right
                lsprite = spr_ralsei_walk_left
            }
        }
    }
    if (argument2 == 4)
    {
        with (global.cinstance[argument3])
        {
            name = "noelle"
            usprite = spr_noelle_walk_up_dw
            dsprite = spr_noelle_walk_down_dw
            rsprite = spr_noelle_walk_right_dw
            lsprite = spr_noelle_walk_left_dw
            if (global.chapter == 2 && global.plot == 95)
            {
                dsprite = spr_noelle_walk_down_blush_dw
                rsprite = spr_noelle_walk_right_blush_dw
                lsprite = spr_noelle_walk_left_blush_dw
            }
        }
    }
    if (argument2 == 5)
    {
        with (global.cinstance[argument3])
        {
            name = "berdly"
            usprite = spr_berdly_walk_up_dw
            dsprite = spr_berdly_walk_down_dw
            rsprite = spr_berdly_walk_right_dw
            lsprite = spr_berdly_walk_left_dw
        }
    }
    if (argument2 == 6)
    {
        with (global.cinstance[argument3])
        {
            name = "starwalker"
            usprite = spr_npc_originalstarwalker
            dsprite = spr_npc_originalstarwalker
            rsprite = spr_npc_originalstarwalker
            lsprite = spr_npc_originalstarwalker
        }
    }
    return global.cinstance[argument3];
}

