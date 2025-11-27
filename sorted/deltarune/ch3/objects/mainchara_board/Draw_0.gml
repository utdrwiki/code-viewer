if (init)
{
    if (visible && sleeping)
    {
        var _sleepnum = 0;
        if (name == "susie")
            _sleepnum = 1;
        if (name == "ralsei")
            _sleepnum = 2;
        var sleepmod = sin(sleepytimer / 4) * 2;
        draw_sprite_ext(spr_board_sleep, _sleepnum, x, scr_even((y - 32) + sleepmod), 2, 2, 0, c_white, 1);
    }
    if (obj_board_controller.pathfind_debug)
    {
        if (is_moving == true)
            draw_path(path, x, y, true);
        if (name == "ralsei")
        {
            for (i = 0; i < 75; i += 1)
                draw_sprite_ext(spr_whitepixel, 0, remx[i], remy[i], 2, 2, 0, c_red, 1);
        }
    }
    var drawbefore = false;
    if (ribbon > 0)
    {
        if (facing == 0 || facing == 3)
            drawbefore = true;
        var btargx = x + 8;
        var btargy = y + 8;
        if (facing == 0)
        {
            btargx = x + 6;
            btargy = y - 8;
        }
        if (facing == 2)
        {
            btargx = x + 6;
            btargy = y;
        }
        if (facing == 1)
        {
            btargx = x - 4;
            btargy = y;
        }
        if (facing == 3)
        {
            btargx = x + 14;
            btargy = y;
        }
        if (name == "susie")
        {
            if (facing == 0)
            {
                btargx = (x + 6) - 4;
                btargy = y - 6;
            }
            if (facing == 2)
            {
                btargx = x + 6 + 2;
                btargy = y - 2;
            }
            if (facing == 1)
            {
                btargx = (x - 4) + 2;
                btargy = y;
            }
            if (facing == 3)
            {
                btargx = x + 14;
                btargy = y;
            }
        }
        bowx = btargx;
        bowy = btargy;
    }
    if (ribbon && drawbefore)
    {
        if (ribbon == 2)
        {
            if (facing == 0)
                draw_sprite_ext(spr_board_bow_small, 0, scr_even(bowx) + 4, scr_even(bowy) - 8, 2, 2, 0, image_blend, image_alpha);
            if (facing == 3)
                draw_sprite_ext(spr_board_bow_small, 0, scr_even(bowx) + 4, scr_even(bowy) - 6, 2, 2, 0, image_blend, image_alpha);
        }
        draw_sprite_ext(spr_board_bow_small, 0, scr_even(bowx), scr_even(bowy), 2, 2, 0, image_blend, image_alpha);
    }
    if (iframes > 0)
    {
        if ((iframes % 2) == 0)
        {
            if (image_blend == c_white)
                image_blend = c_red;
            else
                image_blend = c_white;
        }
    }
    else
    {
        image_blend = c_white;
    }
    if (image_blend == c_white)
    {
        if (boardgrid)
            draw_sprite_ext(sprite_index, image_index, round(x / 2) * 2, round(y / 2) * 2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        else
            draw_self();
    }
    if (ribbon > 0)
    {
        if (!drawbefore)
        {
            if (ribbon == 2)
            {
                if (facing == 1)
                    draw_sprite_ext(spr_board_bow_small, 0, scr_even(bowx) - 4, scr_even(bowy) - 6, 2, 2, 0, image_blend, image_alpha);
            }
            draw_sprite_ext(spr_board_bow_small, 0, scr_even(bowx), scr_even(bowy), 2, 2, 0, image_blend, image_alpha);
            if (ribbon == 2)
            {
                if (facing == 2)
                    draw_sprite_ext(spr_board_bow_small, 0, scr_even(bowx) - 4, scr_even(bowy) - 6, 2, 2, 0, image_blend, image_alpha);
            }
        }
    }
    if (button1_h() && scr_debug() && controlled == 1 && name == "kris" && sword == false)
    {
        draw_set_color(c_red);
        draw_set_blend_mode(bm_add);
        if (facing == 1)
            ossafe_fill_rectangle(x + 16, y + 16 + 6, x + 16 + 32, (y + 32) - 2, true);
        if (facing == 3)
            ossafe_fill_rectangle(x + 16, y + 16 + 6, (x + 16) - 32, (y + 32) - 2, true);
        if (facing == 0)
            ossafe_fill_rectangle(x + 8, y + 16 + 4, (x + 32) - 8, y + 16 + 28, true);
        if (facing == 2)
            ossafe_fill_rectangle(x + 8, y + 16 + 4, (x + 32) - 8, (y + 16) - 28, true);
        draw_set_color(c_white);
        draw_set_blend_mode(bm_normal);
    }
    if (controlled == 1 && name == "susie" && button2_h())
    {
        var _dx = 0;
        var _dy = 0;
        var _dx2 = 0;
        var _dy2 = 0;
        if (facing == 1)
        {
            _dx = 16;
            _dx2 = 18;
            _dy2 = 16;
            _dy = -4;
        }
        if (facing == 3)
        {
            _dx = -48;
            _dx2 = 14;
            _dy2 = 16;
            _dy = -4;
        }
        if (facing == 0)
        {
            _dy = 16;
            _dy2 = 20;
            _dx = -8;
            _dx2 = 8;
        }
        if (facing == 2)
        {
            _dy = -20;
            _dy2 = -16;
            _dx = -8;
            _dx2 = 8;
        }
    }
    draw_set_color(c_white);
    draw_set_font(fnt_small);
    if (controlled)
    {
    }
    if (susierecordcon == 1)
        draw_text_outline(128, 64, name + " RECORDING", 255);
    if (graballpots_con == 3 && graballpots_timer > 1)
    {
    }
}
if (scr_debug())
{
    var drawstoole = false;
    if (keyboard_check(ord("F")))
        drawstoole = true;
    if (drawstoole)
    {
        if (name == "ralsei")
        {
            stoolx = round(x / 32) * 32;
            stooly = round(y / 32) * 32;
            if (stooly < bbox_top)
                stooly += 32;
            if (stooly > bbox_bottom)
                stooly -= 32;
            draw_sprite_ext(spr_ralsei_board_stoolforme, 0, stoolx, stooly, 2, 2, 0, c_white, 0.5);
        }
    }
    var count = 0;
}
