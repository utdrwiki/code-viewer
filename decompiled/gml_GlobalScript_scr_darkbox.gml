scr_darkbox = function(argument0, argument1, argument2, argument3) //gml_Script_scr_darkbox
{
    cur_jewel += 1
    textbox_width = ((argument2 - argument0) - 63)
    if (textbox_width < 0)
        textbox_width = 0
    textbox_height = ((argument3 - argument1) - 63)
    if (textbox_height < 0)
        textbox_height = 0
    if (textbox_width > 0)
    {
        draw_sprite_stretched(spr_textbox_top, 0, (argument0 + 32), argument1, textbox_width, 32)
        draw_sprite_ext(spr_textbox_top, 0, (argument0 + 32), (argument3 + 1), textbox_width, -2, 0, c_white, 1)
    }
    if (textbox_height > 0)
    {
        draw_sprite_ext(spr_textbox_left, 0, (argument2 + 1), (argument1 + 32), -2, textbox_height, 0, c_white, 1)
        draw_sprite_ext(spr_textbox_left, 0, argument0, (argument1 + 32), 2, textbox_height, 0, c_white, 1)
    }
    if (global.flag[8] == 0)
    {
        draw_sprite_ext(spr_textbox_topleft, (cur_jewel / 10), argument0, argument1, 2, 2, 0, c_white, 1)
        draw_sprite_ext(spr_textbox_topleft, (cur_jewel / 10), (argument2 + 1), argument1, -2, 2, 0, c_white, 1)
        draw_sprite_ext(spr_textbox_topleft, (cur_jewel / 10), argument0, (argument3 + 1), 2, -2, 0, c_white, 1)
        draw_sprite_ext(spr_textbox_topleft, (cur_jewel / 10), (argument2 + 1), (argument3 + 1), -2, -2, 0, c_white, 1)
    }
    else
    {
        draw_sprite_ext(spr_textbox_topleft, 0, argument0, argument1, 2, 2, 0, c_white, 1)
        draw_sprite_ext(spr_textbox_topleft, 0, (argument2 + 1), argument1, -2, 2, 0, c_white, 1)
        draw_sprite_ext(spr_textbox_topleft, 0, argument0, (argument3 + 1), 2, -2, 0, c_white, 1)
        draw_sprite_ext(spr_textbox_topleft, 0, (argument2 + 1), (argument3 + 1), -2, -2, 0, c_white, 1)
    }
    return;
}

