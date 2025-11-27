if (active && scr_debug())
{
    if (obj_board_camera.con == 0)
        scr_board_objname();
    draw_set_halign(fa_left);
}
if (active && obj_board_camera.con == 0)
{
    timer++;
    if ((timer % 2) == 0 && timer > 0 && texttimer <= (string_length(shopstring) + 20))
    {
        texttimer++;
        if (texttimer < string_length(shopstring))
        {
            if (string_char_at(shopstring, texttimer) != " " && string_char_at(shopstring, texttimer) != "#")
            {
                if (type != 1)
                    snd_play(snd_board_text_main);
            }
        }
        if (texttimer == string_length(shopstring))
        {
            textcomplete = true;
            if (type != 1)
                snd_play(snd_board_text_main_end);
            north = snd_init("northernlight.ogg");
            if (type == 1)
                mus_loop(north);
        }
    }
    draw_set_font(fnt_8bit);
    draw_set_color(c_white);
    if (type == 2)
        draw_set_color(#5023D3);
    var currentstring = string_hash_to_newline(string_copy(shopstring, 1, texttimer));
    var txtwidth = string_width(string_hash_to_newline(shopstring));
    draw_text_ext((320 - (round(txtwidth) / 2)) + 4, board_tiley(2) + 12, currentstring, 24, 640);
    draw_set_color(c_white);
}
