if (active && scr_debug())
{
    if (obj_board_camera.shift == "none")
    {
        scr_board_objname();
        var count = 0;
    }
}
if (active)
{
    siner++;
    if (obj_board_inventory.lancer == true)
    {
        depth = 999989;
        var amt = round(abs(sin(siner / 20)) * 5) / 5;
        var col = merge_color(#FBC198, #865954, amt);
        with (myblock)
            draw_sprite_ext(spr_board_treasuremarker_lmarkonly, 0, x, y, 2, 2, 0, col, 1);
    }
    else
    {
        depth = 999996;
    }
    draw_set_color(#C8E76C);
    ossafe_fill_rectangle((x - 128 - 32) + board_tilex(6) + 4, (y - 64 - 32) + scr_even(lancy), ((x - 128 - 32) + board_tilex(7)) - 4 - 1, ((y - 32 - 64) + 284) - 1);
    var i = 0;
    while (i < 5)
        i++;
    draw_set_color(#83BC19);
    ossafe_fill_rectangle((x - 128 - 32) + board_tilex(6) + 4 + 2, (y - 64 - 32) + scr_even(lancy), ((x - 128 - 32) + board_tilex(7)) - 4 - 1 - 2, ((y - 32 - 64) + 284) - 1);
    draw_set_color(c_white);
    if (lancy < 284)
    {
        draw_sprite_ext(spr_b2perfumeblast, siner / 4, ((x - 128 - 32) + board_tilex(6) + 4 + 2) - 12, scr_even(lancy), 2, 2, 0, c_white, 1);
        draw_sprite_ext(spr_b2perfumeblast, (siner / 4) + 1, (((x - 128 - 32) + board_tilex(6) + 4 + 2) - 12) + 44, scr_even(lancy), -2, 2, 0, c_white, 1);
    }
}
