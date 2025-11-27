if (active && scr_debug())
{
    if (obj_board_camera.shift == "none")
    {
        scr_board_objname();
        var count = 0;
    }
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
                snd_play(snd_board_text_main);
        }
        if (texttimer == string_length(shopstring))
        {
            textcomplete = true;
            snd_play(snd_board_text_main_end);
        }
    }
    draw_set_font(scr_84_get_font("8bit"));
    draw_set_color(c_white);
    var currentstring = string_hash_to_newline(string_copy(shopstring, 1, texttimer));
    var txtwidth = string_width(string_hash_to_newline(shopstring));
    if (drawtext)
        draw_text_ext((320 - (round(txtwidth) / 2)) + 4, board_tiley(2) + 12, currentstring, 24, 640);
    var linespace = 18;
    if (i_ex(key) && (textcomplete || forcedraw || drawitanyways))
    {
        draw_text((key.x + 16) - (round(string_width(keystring)) / 2), key.y + 32 + 4, keystring);
        draw_text((key.x + 16) - (round(string_width(string(key.cost))) / 2), key.y + 32 + 4 + linespace, string(key.cost));
    }
    if (i_ex(candy) && (textcomplete || forcedraw || drawitanyways))
    {
        draw_set_halign(fa_center);
        if (pocketcheck == 0)
        {
            pocketcheck = 1;
            emptypocket = scr_pocketspace() + scr_inventoryspace();
        }
        if (!emptypocket)
            draw_set_color(c_gray);
        if (candy.cost == 0 && emptypocket)
        {
            if (candy.myinteract < 3)
            {
                var remfont = draw_get_font();
                draw_set_font(fnt_8bit);
                draw_text(candy.x + 16, candy.y + 32 + 4, string_hash_to_newline(freestring));
                draw_set_font(remfont);
            }
        }
        else
        {
            draw_text(candy.x + 16, candy.y + 32 + 4, string_hash_to_newline(candy.mystring));
        }
        draw_set_color(c_white);
        draw_set_halign(fa_left);
    }
}
