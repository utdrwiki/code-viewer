draw_monster_body_part = function(argument0, argument1, argument2, argument3) //gml_Script_draw_monster_body_part
{
    draw_sprite_ext(argument0, argument1, argument2, argument3, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    if (flash == true)
        draw_sprite_ext_flash(argument0, argument1, argument2, argument3, image_xscale, image_yscale, image_angle, image_blend, (((-(cos((fsiner / 5)))) * 0.4) + 0.6))
    return;
}

