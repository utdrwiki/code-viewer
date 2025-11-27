if (drawscreen)
{
    animindex += 0.0625;
    var yellow = 65535;
    var darkyellow = 22676;
    draw_sprite_ext(spr_pxwhite, 13387839, board_tilex(0), board_tiley(0), 384, 256, 0, #3F48CC, 1);
    draw_sprite_ext(spr_board_tvtimelogo, 0, 198, 68, 2, 2, 0, c_white, 1);
    var tetalk = stringsetloc("THE LEGEND#OF TENNA", "obj_GSA02_B0_slash_Draw_0_gml_17_0");
    var tetalk2 = stringsetloc("PRESS BUTTON!", "obj_GSA02_B0_slash_Draw_0_gml_18_0");
    var tetalk3 = stringsetloc(" ANT TENNA", "obj_GSA02_B0_slash_Draw_0_gml_19_0");
    draw_set_font(fnt_8bit);
    draw_set_color(yellow);
    draw_set_halign(fa_center);
    draw_set_color(darkyellow);
    draw_text_ext(322, 164, string_hash_to_newline(tetalk), 18, 999);
    draw_text_ext(322, 166, string_hash_to_newline(tetalk), 18, 999);
    draw_text_ext(320, 166, string_hash_to_newline(tetalk), 18, 999);
    draw_set_color(yellow);
    draw_text_ext(320, 164, string_hash_to_newline(tetalk), 18, 999);
    draw_sprite_ext(spr_gameshow_screen_tenna_peace, animindex, 304, 204, 2, 2, 0, c_white, 1);
    if ((round(animindex) % 2) == 0 && nopress == 0)
    {
        draw_set_color(darkyellow);
        draw_text(320, 276, tetalk2);
        draw_text(322, 276, tetalk2);
        draw_text(322, 274, tetalk2);
        draw_set_color(yellow);
        draw_text(320, 274, tetalk2);
    }
    draw_sprite_ext(spr_board_game_title_copyright, 0, (scr_even(320 - (string_width(tetalk3) / 2)) - 4) + 2, 296, 2, 2, 0, darkyellow, 1);
    draw_sprite_ext(spr_board_game_title_copyright, 0, (scr_even(320 - (string_width(tetalk3) / 2)) - 4) + 2, 294, 2, 2, 0, darkyellow, 1);
    draw_sprite_ext(spr_board_game_title_copyright, 0, (scr_even(320 - (string_width(tetalk3) / 2)) - 4) + 0, 296, 2, 2, 0, darkyellow, 1);
    draw_sprite_ext(spr_board_game_title_copyright, 0, scr_even(320 - (string_width(tetalk3) / 2)) - 4, 294, 2, 2, 0, c_yellow, 1);
    draw_set_color(darkyellow);
    draw_text(328, 296, tetalk3);
    draw_text(328, 298, tetalk3);
    draw_text(326, 298, tetalk3);
    draw_set_color(c_yellow);
    draw_text(326, 296, tetalk3);
    draw_set_halign(fa_left);
    draw_set_color(c_white);
}
