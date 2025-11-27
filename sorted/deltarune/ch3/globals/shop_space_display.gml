function scr_shop_space_display(arg0)
{
    var item_id = item[arg0];
    if (itemtype[arg0] == "item")
    {
        scr_itemcheck(0);
        var inventory_space = 12 - itemcount;
        var inventory_amount = "00";
        if (inventory_space < 10)
            inventory_amount = "0" + string(inventory_space);
        else
            inventory_amount = string(inventory_space);
        var base_y_pos = (cameray() + 418) - 20;
        var line_height = 12;
        draw_sprite_ext(scr_84_get_sprite("spr_shop_space_ui"), 0, camerax() + 555, base_y_pos, 1, 1, 0, c_white, 1);
        draw_set_font(fnt_8bit);
        draw_text_ext_transformed(camerax() + 555 + 1, base_y_pos + line_height + 4, inventory_amount + "/12", 1, 999, 0.5, 0.5, 0);
        draw_set_font(fnt_main);
        draw_sprite_ext(scr_84_get_sprite("spr_shop_space_ui"), 2, camerax() + 555, base_y_pos + (line_height * 2) + 8, 1, 1, 0, c_white, 1);
        scr_itemcheck_pocket(0);
        var storage_space = global.flag[64] - itemcount;
        var storage_amount = "00";
        if (storage_space < 10)
            storage_amount = "0" + string(storage_space);
        else
            storage_amount = string(storage_space);
        draw_set_font(fnt_8bit);
        draw_text_ext_transformed(camerax() + 555 + 1, base_y_pos + (line_height * 3) + 12, storage_amount + "/" + string(global.flag[64]), 1, 999, 0.5, 0.5, 0);
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
        var base_y_pos = (cameray() + 418) - 8;
        var line_height = 12;
        var header_index = (itemtype[arg0] == "weapon") ? 3 : 4;
        var header_y_pos = langopt(base_y_pos, base_y_pos + line_height);
        draw_sprite_ext(scr_84_get_sprite("spr_shop_space_ui"), header_index, camerax() + 555, header_y_pos, 1, 1, 0, c_white, 1);
        var inventory_y_pos = langopt(base_y_pos + line_height, base_y_pos);
        var inventory_index = (global.lang == "ja") ? 1 : 0;
        draw_sprite_ext(scr_84_get_sprite("spr_shop_space_ui"), inventory_index, camerax() + 555, inventory_y_pos, 1, 1, 0, c_white, 1);
        draw_set_font(fnt_8bit);
        draw_text_ext_transformed(camerax() + 555 + 1, base_y_pos + (line_height * 2) + 4, inventory_amount + "/48", 1, 999, 0.5, 0.5, 0);
        draw_set_font(fnt_main);
    }
}
