if (scr_debug)
{
    if (active)
    {
        if (obj_board_camera.con == 0)
        {
            scr_board_objname();
            var count = 0;
        }
    }
}
if (active && obj_board_camera.con == 0)
{
    var nodrawkeyval = i_ex(obj_board_grabobject);
    draw_set_font(scr_84_get_font("8bit"));
    if (i_ex(key) && nodrawkeyval <= 0)
    {
        var linespace = 18;
        draw_text((key.x + 16) - (round(string_width(keystring)) / 2), key.y + 32 + 4, keystring);
        draw_text((key.x + 16) - (round(string_width(string(key.cost))) / 2), key.y + 32 + 4 + linespace, string(key.cost));
    }
    if (i_ex(heal))
    {
        if (pocketcheck == 0)
        {
            pocketcheck = 1;
            emptypocket = scr_pocketspace() + scr_inventoryspace();
        }
        draw_set_halign(fa_center);
        if (!emptypocket)
            draw_set_color(c_gray);
        draw_text(heal.x + 16, heal.y + 32 + 4, string_hash_to_newline(heal.mystring));
        draw_set_color(c_white);
        draw_set_halign(fa_left);
    }
}
