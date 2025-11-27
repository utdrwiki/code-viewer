if (active && obj_board_camera.con == 0 && drawtext)
{
    timer++;
    if ((timer % 2) == 0 && timer > 0 && texttimer <= (string_length(mystring) + 20))
    {
        texttimer++;
        if (texttimer < string_length(mystring))
        {
            if (string_char_at(mystring, texttimer) != " " && string_char_at(mystring, texttimer) != "#")
                snd_play(snd_board_text_main);
        }
        if (texttimer == string_length(mystring))
            snd_play(snd_board_text_main_end);
    }
    draw_set_font(scr_84_get_font("8bit_mixed"));
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    var currentstring = string_hash_to_newline(string_copy(mystring, 1, texttimer));
    var txtwidth = string_width(string_hash_to_newline(mystring));
    draw_text_ext((320 - (round(txtwidth) / 2)) + 4, board_tiley(1) + 12, currentstring, 24, 640);
}
