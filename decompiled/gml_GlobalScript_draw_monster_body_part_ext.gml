draw_monster_body_part_ext = function(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) //gml_Script_draw_monster_body_part_ext
{
    draw_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
    if (flash == true)
        draw_sprite_ext_flash(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, (((-(cos((fsiner / 5)))) * 0.4) + 0.6))
    return;
}

