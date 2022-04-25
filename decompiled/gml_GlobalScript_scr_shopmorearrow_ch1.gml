scr_shopmorearrow_ch1 = function() //gml_Script_scr_shopmorearrow_ch1
{
    if (pagemax > 0)
        draw_sprite_ext(spr_morearrow_ch1, 0, 370, (280 - (sin((cur_jewel / 12)) * 3)), 1, -1, 0, c_white, 1)
    if ((5 + pagemax) < 12)
    {
        if (menu == 11 || menu == 15)
        {
            if (global.item[(5 + pagemax)] != 0)
                draw_sprite_ext(spr_morearrow_ch1, 0, 370, (440 + (sin((cur_jewel / 12)) * 3)), 1, 1, 0, c_white, 1)
        }
        else
            draw_sprite_ext(spr_morearrow_ch1, 0, 370, (440 + (sin((cur_jewel / 12)) * 3)), 1, 1, 0, c_white, 1)
    }
    return;
}

