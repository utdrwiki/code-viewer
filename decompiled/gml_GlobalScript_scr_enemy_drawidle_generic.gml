scr_enemy_drawidle_generic = function(argument0) //gml_Script_scr_enemy_drawidle_generic
{
    if (state == 0)
    {
        fsiner += 1
        siner += argument0
        thissprite = idlesprite
        if (global.mercymod[myself] >= global.mercymax[myself])
            thissprite = sparedsprite
        draw_monster_body_part(thissprite, siner, x, y)
    }
    return;
}

