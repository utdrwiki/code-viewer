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
    if (i_ex(camera) && camera.con == 2 && textcomplete)
    {
        draw_text((camera.x + 16) - (round(string_width(camerastring)) / 2), camera.y + 32 + 4, camerastring);
        draw_text((camera.x + 16) - (round(string_width(freestring)) / 2), camera.y + 32 + 4 + 18, freestring);
    }
    if (i_ex(lancer2) && lancer2.con == 2 && textcomplete)
    {
        draw_text((lancer2.x + 16) - (round(string_width(lancerstring)) / 2), lancer2.y + 32 + 4, lancerstring);
        draw_text((lancer2.x + 16) - (round(string_width(freestring)) / 2), lancer2.y + 32 + 4 + 18, freestring);
    }
    if (textcomplete)
        draw_text(208 - (round(string_width(pipstring)) / 2), 228, pipstring);
    if (i_ex(obj_board_b3camerashop_pippins) && textcomplete)
    {
        if (obj_board_b3camerashop_pippins.con == 0)
            draw_text(208 - (round(string_width("100")) / 2), 246, "100");
    }
}
