draw_self();
if (x == 2900 && y == 680)
{
    with (obj_board_marker)
    {
        var yloc = (other.y + 20 + 726) - y;
        draw_sprite_ext(sprite_index, image_index, x, yloc, image_xscale, image_xscale, 0, image_blend, 1);
    }
    with (obj_board_smokepuff)
    {
        var yloc = (other.y + 20 + 726) - y;
        draw_sprite_ext(sprite_index, image_index, x, yloc, image_xscale, image_xscale, 0, image_blend, 1);
    }
    if (i_ex(obj_mainchara_board))
    {
        with (obj_mainchara_board)
        {
            var dontdraw = false;
            var yloc = (other.y + 20 + 726) - y;
            var sprite = sprite_index;
            if (sprite_index == dsprite)
                sprite = usprite;
            if (sprite_index == usprite)
                sprite = dsprite;
            if (sprite_index == spr_ch3_boardchar)
                dontdraw = true;
            if (name == "ralsei" && i_ex(stool))
            {
                dontdraw = true;
                draw_sprite_ext(spr_ralsei_board_stoolforme_back, image_index, x, yloc, 2, 2, 0, c_white, 1);
            }
            if (!dontdraw)
                draw_sprite_ext(sprite, image_index, x, yloc, 2, 2, 0, c_white, 1);
        }
    }
}
