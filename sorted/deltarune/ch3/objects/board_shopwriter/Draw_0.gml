if (active && obj_board_camera.con == 0)
{
    timer++;
    if ((timer % 2) == 0 && timer > 0 && texttimer <= (string_length(shopstring) + 20))
    {
        texttimer++;
        if (texttimer < string_length(shopstring))
        {
            textcomplete = false;
            if (string_char_at(shopstring, texttimer) != " " && string_char_at(shopstring, texttimer) != "#")
            {
                if (playsound)
                {
                    snd_stop(snd_board_text_main);
                    snd_play(snd_board_text_main);
                }
            }
        }
        if (texttimer == string_length(shopstring))
        {
            textcomplete = true;
            if (playsound)
            {
                snd_stop(snd_board_text_main);
                snd_stop(snd_board_text_main_end);
                snd_play(snd_board_text_main_end);
            }
        }
    }
    draw_set_font(scr_84_get_font("8bit"));
    draw_set_color(textcol);
    var currentstring = string_hash_to_newline(string_copy(shopstring, 1, texttimer));
    var txtwidth = string_width(string_hash_to_newline(shopstring));
    if (drawtext)
    {
        draw_text_ext((320 - (round(txtwidth) / 2)) + 4 + xoff, yloc, currentstring, 24, 640);
        draw_set_halign(fa_left);
    }
    draw_set_color(c_white);
}
