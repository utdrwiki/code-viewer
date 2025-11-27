draw_self_board();
if (drawblue == true)
    draw_sprite_ext(spr_pxwhite, 0, 0, 0, 640, 480, 0, #3F48CC, 1);
if (drawtext)
{
    ttimer++;
    if ((ttimer % 4) == 0 && timer > 0 && texttimer <= (string_length(shopstring) + 20))
    {
        texttimer++;
        if (texttimer < string_length(shopstring))
        {
        }
        if (texttimer == string_length(shopstring))
            textcomplete = true;
    }
    draw_set_font(scr_84_get_font("8bit"));
    draw_set_color(c_white);
    var currentstring = string_hash_to_newline(string_copy(shopstring, 1, texttimer));
    var txtwidth = string_width(string_hash_to_newline(shopstring));
    if (drawtext)
        draw_text_ext(((320 - (round(txtwidth) / 2)) + 4) - 3, board_tiley(2) + 12 + 17, string_hash_to_newline(shopstring), 24, 640);
}
if (drawblack == true)
    draw_sprite_ext(spr_pxwhite, 0, 0, 0, 640, 480, 0, c_black, 1);
