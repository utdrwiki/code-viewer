function scr_shop_space_display(arg0, arg1 = 545, arg2 = 398)
{
    var item_id = item[arg0];
    var __cx = camerax();
    var __cy = cameray();
    if (itemtype[arg0] == "item")
    {
        scr_itemcheck(0);
        var inventory_space = 12 - itemcount;
        var inventory_amount = "00";
        if (inventory_space < 10)
            inventory_amount = "0" + string(inventory_space);
        else
            inventory_amount = string(inventory_space);
        var y_offset = (global.lang == "ja") ? 4 : 0;
        var base_y_pos = __cy + arg2 + y_offset;
        var line_height = 12;
        draw_sprite_ext(scr_84_get_sprite("spr_shop_space_ui"), 0, __cx + arg1, base_y_pos, 1, 1, 0, c_white, 1);
        draw_set_font(fnt_8bit);
        draw_text_ext_transformed(__cx + arg1 + 1, base_y_pos + line_height + 4, inventory_amount + "/12", 1, 999, 0.5, 0.5, 0);
        draw_set_font(fnt_main);
        draw_sprite_ext(scr_84_get_sprite("spr_shop_space_ui"), 2, __cx + arg1, base_y_pos + (line_height * 2) + 8, 1, 1, 0, c_white, 1);
        scr_itemcheck_pocket(0);
        var storage_space = global.flag[64] - itemcount;
        var storage_amount = "00";
        if (storage_space < 10)
            storage_amount = "0" + string(storage_space);
        else
            storage_amount = string(storage_space);
        draw_set_font(fnt_8bit);
        draw_text_ext_transformed(__cx + arg1 + 1, base_y_pos + (line_height * 3) + 12, storage_amount + "/" + string(global.flag[64]), 1, 999, 0.5, 0.5, 0);
        draw_set_font(fnt_main);
    }
    else
    {
        var inventory_space = 0;
        if (itemtype[arg0] == "weapon")
        {
            scr_weaponcheck_inventory(0);
            inventory_space = 48 - itemcount;
        }
        else
        {
            scr_armorcheck_inventory(0);
            inventory_space = 48 - itemcount;
        }
        var inventory_amount = "00";
        if (inventory_space < 10)
            inventory_amount = "0" + string(inventory_space);
        else
            inventory_amount = string(inventory_space);
        var base_y_pos = (__cy + arg2 + 20) - 8;
        var line_height = 12;
        var header_index = (itemtype[arg0] == "weapon") ? 3 : 4;
        var header_y_pos = langopt(base_y_pos, base_y_pos + line_height);
        draw_sprite_ext(scr_84_get_sprite("spr_shop_space_ui"), header_index, __cx + arg1, header_y_pos, 1, 1, 0, c_white, 1);
        var inventory_y_pos = langopt(base_y_pos + line_height, base_y_pos);
        var inventory_index = (global.lang == "ja") ? 1 : 0;
        draw_sprite_ext(scr_84_get_sprite("spr_shop_space_ui"), inventory_index, __cx + arg1, inventory_y_pos, 1, 1, 0, c_white, 1);
        draw_set_font(fnt_8bit);
        draw_text_ext_transformed(__cx + arg1 + 1, base_y_pos + (line_height * 2) + 4, inventory_amount + "/48", 1, 999, 0.5, 0.5, 0);
        draw_set_font(fnt_main);
    }
}

function scr_shopspace_displaybox(arg0 = "item", arg1 = 413, arg2 = 161, arg3 = true, arg4 = false)
{
    var cx = camerax();
    var cy = cameray();
    var xpos = cx + (arg1 - 8);
    var ypos = cy + (arg2 - 8);
    var wid = 211;
    var hei = 97;
    if (arg3)
    {
        draw_sprite_ext(spr_pxwhite, 0, xpos + 18, ypos + 18, wid - 36, hei - 36, 0, c_black, 1);
        scr_darkbox(xpos, ypos, xpos + wid, ypos + hei);
        if (arg4)
            draw_sprite_ext(spr_pxwhite, 0, xpos + 22, (ypos - 2) + 8, 168, 2, 0, #9DA2C4, 1);
    }
    draw_set_color(c_white);
    draw_set_font(fnt_mainbig);
    draw_text(xpos + 39 + 8, ypos + 24 + 8, "$" + string(global.gold));
    item = [0];
    itemtype = [arg0];
    scr_shop_space_display(0, (xpos - cx) + 131, (ypos - cy) + 21);
}
