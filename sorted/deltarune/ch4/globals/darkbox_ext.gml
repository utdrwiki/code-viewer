function scr_darkbox_ext(arg0, arg1, arg2, arg3)
{
    if (!variable_instance_exists(id, "cur_jewel"))
        cur_jewel = 0;
    cur_jewel++;
    draw_sprite_ext(spr_pxwhite, 0, arg0, arg1, arg2, arg3, 0, c_black, 1);
    var buff = 10;
    draw_sprite_ext(spr_textbox_top, 0, arg0 + buff, arg1 - 14, arg2 - (buff * 2), 2, 0, c_white, 1);
    draw_sprite_ext(spr_textbox_top, 0, arg0 + buff, arg1 + arg3 + 14, arg2 - (buff * 2), -2, 0, c_white, 1);
    draw_sprite_ext(spr_textbox_left, 0, arg0 - 14, arg1 + buff, 2, arg3 - (buff * 2), 0, c_white, 1);
    draw_sprite_ext(spr_textbox_left, 0, arg0 + arg2 + 14, arg1 + buff, -2, arg3 - (buff * 2), 0, c_white, 1);
    var animindex = cur_jewel / 10;
    if (global.flag[8] == 1)
        animindex = 0;
    draw_sprite_ext(spr_textbox_topleft, animindex, arg0 - 14, arg1 - 14, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_textbox_topleft, animindex, arg0 + 14 + arg2, arg1 - 14, -2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_textbox_topleft, animindex, arg0 - 14, arg1 + 14 + arg3, 2, -2, 0, c_white, 1);
    draw_sprite_ext(spr_textbox_topleft, animindex, arg0 + 14 + arg2, arg1 + 14 + arg3, -2, -2, 0, c_white, 1);
}
