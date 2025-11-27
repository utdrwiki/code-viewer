var dblue = 9791488;
if (mode == 0)
{
    event_inherited();
}
else if (mode == 1)
{
    var xx = x;
    var yy = y;
    screen_anim += 0.2;
    draw_set_color(gameshowblue);
    ossafe_fill_rectangle(xx, yy, (xx + (tvwidth * width)) - 2, (yy + (tvheight * height)) - 2);
    quiz_timer++;
    if (quiz_intro)
    {
        if (quiz_timer == 1)
        {
            snd_play(snd_nes_nocontroller);
            word_scale_timer = 0;
            quizstring = stringsetloc("QUIZ!", "obj_dw_ch3_teevie_quiz_screen_slash_Draw_0_gml_25_0");
        }
        if (quiz_timer == 30)
        {
            quiz_intro = false;
            quiz_timer = 0;
            darken_screen();
        }
        word_scale_timer++;
        draw_set_color(c_white);
        draw_set_font(fnt_8bit);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(gameshowblue);
        if (word_siner)
            word_alpha = clamp(0.8 + sin(quiz_timer / 7), 0, 1);
        draw_set_alpha(word_alpha);
        var _tx = x + 260;
        var _ty = y + 130;
        var _scale = scr_ease_in(clamp01(remap(0, word_max_scale, 1, 0, word_scale_timer)), -1) + 1;
        draw_set_color(dblue);
        draw_text_transformed(_tx, _ty + 2, string_hash_to_newline(quizstring), 3 * _scale, 3 * _scale, 0);
        draw_text_transformed(_tx + 2, _ty + 2, string_hash_to_newline(quizstring), 3 * _scale, 3 * _scale, 0);
        draw_text_transformed(_tx + 2, _ty, string_hash_to_newline(quizstring), 3 * _scale, 3 * _scale, 0);
        draw_set_color(c_white);
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_text_transformed(_tx, _ty, string_hash_to_newline(quizstring), 3 * _scale, 3 * _scale, 0);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_alpha(1);
    }
    else if (quiz_ready)
    {
        if (quiz_timer == 1)
        {
            word_scale_timer = 0;
            word_max_scale = 6;
            word_siner = true;
            quizstring = stringsetloc("GET\nREADY!", "obj_dw_ch3_teevie_quiz_screen_slash_Draw_0_gml_66_0");
        }
        word_scale_timer++;
        draw_set_color(c_white);
        draw_set_font(fnt_8bit);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(gameshowblue);
        draw_set_alpha(1);
        var _tx = x + 260;
        var _ty = y + 130;
        var _scale = scr_ease_in(clamp01(remap(0, word_max_scale, 1, 0, word_scale_timer)), -1) + 1;
        draw_set_color(dblue);
        draw_text_transformed(_tx, _ty + 2, string_hash_to_newline(quizstring), 3 * _scale, 3 * _scale, 0);
        draw_text_transformed(_tx + 2, _ty + 2, string_hash_to_newline(quizstring), 3 * _scale, 3 * _scale, 0);
        draw_text_transformed(_tx + 2, _ty, string_hash_to_newline(quizstring), 3 * _scale, 3 * _scale, 0);
        draw_set_color(c_white);
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_text_transformed(_tx, _ty, string_hash_to_newline(quizstring), 3 * _scale, 3 * _scale, 0);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_alpha(1);
        if (quiz_timer == 45)
        {
            quiz_ready = false;
            quiz_timer = 0;
            quiz_display = true;
        }
    }
    else if (quiz_display)
    {
        if (!_is_paused)
        {
            countdown_timer--;
            if (countdown_timer <= 0)
            {
                pause();
                alarm[0] = 30;
            }
        }
        var _border_margin = 10;
        var _border_x = x;
        var _border_y = y;
        var _border_offset = 4;
        var _border_radius = 6;
        draw_set_color(c_white);
        ossafe_fill_rectangle(_border_x + _border_margin, _border_y + _border_margin, (_border_x + 480) - _border_margin, (_border_y + 80) - _border_margin);
        draw_set_color(gameshowblue);
        ossafe_fill_rectangle(_border_x + _border_margin + _border_offset, _border_y + _border_margin + _border_offset, ((_border_x - _border_offset) + 480) - _border_margin, ((_border_y - _border_offset) + 80) - _border_margin);
        var _gauge_margin = 4;
        var _gauge_x = _border_x + _border_margin;
        var _gauge_y = _border_y + _border_margin;
        var _gauge_offset = 4;
        var _gauge_width = 460 - _gauge_margin;
        var _gauge_height = 70 - _border_margin;
        draw_set_color(gameshowblue);
        ossafe_fill_rectangle(_gauge_x + _gauge_margin, _gauge_y + _gauge_margin, (_gauge_x + _gauge_width) - _gauge_margin, (_gauge_y + _gauge_height) - _gauge_margin);
        var _min = _gauge_margin;
        var _max = _gauge_width;
        var _progress = countdown_timer / max_time;
        var _gauge_progress = clamp(_gauge_width * _progress, _gauge_margin, _gauge_width);
        draw_set_color(dblue);
        ossafe_fill_rectangle(_gauge_x + _gauge_margin, _gauge_y + _gauge_margin, scr_even(_gauge_x + _gauge_progress) - 1, (_gauge_y + _gauge_height) - _gauge_margin);
        var _text_left_margin = 0;
        if (question_visual != "none")
        {
            _text_left_margin = 80;
            if (question_visual == "shadowguy")
                draw_sprite_ext(spr_board_enemy_shadowman_down, screen_anim, _border_x + _border_margin + 20, _border_y + _border_margin + 14, 2, 2, 0, c_white, 1);
            else if (question_visual == "elnina")
                draw_sprite_ext(spr_board_elnina, 0, _border_x + _border_margin + 20, _border_y + _border_margin + 24, 2, 2, 0, c_white, 1);
        }
        draw_set_color(c_white);
        draw_set_font(scr_84_get_font("8bit_mixed"));
        var _text_margin = (global.lang == "ja") ? 18 : 22;
        draw_set_color(dblue);
        draw_text_ext_transformed(x + _text_margin + _text_left_margin, y + _text_margin + 2, quiz_question_text, 24, 440, 1, 1, 0);
        draw_text_ext_transformed(x + _text_margin + _text_left_margin + 2, y + _text_margin + 2, quiz_question_text, 24, 440, 1, 1, 0);
        draw_text_ext_transformed(x + _text_margin + _text_left_margin + 2, y + _text_margin, quiz_question_text, 24, 440, 1, 1, 0);
        draw_set_color(c_white);
        draw_set_alpha(1);
        draw_text_ext_transformed(x + _text_margin + _text_left_margin, y + _text_margin, quiz_question_text, 24, 440, 1, 1, 0);
        draw_set_font(fnt_mainbig);
        draw_sprite_ext(spr_quiz_hud_timer, 28 - ((countdown_timer / max_time) * 28), x + 210, y + 90 + 2, 4, 4, 0, dblue, 1);
        draw_sprite_ext(spr_quiz_hud_timer, 28 - ((countdown_timer / max_time) * 28), x + 210 + 2, y + 90 + 2, 4, 4, 0, dblue, 1);
        draw_sprite_ext(spr_quiz_hud_timer, 28 - ((countdown_timer / max_time) * 28), x + 210 + 2, y + 90, 4, 4, 0, dblue, 1);
        draw_sprite_ext(spr_quiz_hud_timer, 28 - ((countdown_timer / max_time) * 28), x + 210, y + 90, 4, 4, 0, c_white, 1);
        draw_set_halign(fa_center);
        var _answer_color = 16777215;
        if (answer == "A")
        {
            _answer_color = 65535;
            draw_set_color(_answer_color);
            if (susie_select)
            {
                draw_set_color(dblue);
                draw_text_ext_transformed(x + 90, y + 90 + 2, "A", 999, 999, 2, 2, 0);
                draw_text_ext_transformed(x + 90 + 2, y + 90 + 2, "A", 999, 999, 2, 2, 0);
                draw_text_ext_transformed(x + 90 + 2, y + 90, "A", 999, 999, 2, 2, 0);
                draw_set_color(_answer_color);
                draw_set_alpha(1);
                draw_text_ext_transformed(x + 90, y + 90, "A", 999, 999, 2, 2, 0);
            }
            if (ralsei_select)
            {
                draw_set_color(dblue);
                draw_text_ext_transformed(x + 150, y + 90 + 2, "A", 999, 999, 2, 2, 0);
                draw_text_ext_transformed(x + 150 + 2, y + 90 + 2, "A", 999, 999, 2, 2, 0);
                draw_text_ext_transformed(x + 150 + 2, y + 90, "A", 999, 999, 2, 2, 0);
                draw_set_color(_answer_color);
                draw_set_alpha(1);
                draw_text_ext_transformed(x + 150, y + 90, "A", 999, 999, 2, 2, 0);
            }
        }
        draw_set_color(dblue);
        draw_text_ext_transformed(x + 120, y + 90 + 2, "A", 999, 999, 2, 2, 0);
        draw_text_ext_transformed(x + 120 + 2, y + 90 + 2, "A", 999, 999, 2, 2, 0);
        draw_text_ext_transformed(x + 120 + 2, y + 90, "A", 999, 999, 2, 2, 0);
        draw_set_color(_answer_color);
        draw_set_alpha(1);
        draw_text_ext_transformed(x + 120, y + 90, "A", 999, 999, 2, 2, 0);
        draw_set_font(scr_84_get_font("8bit_mixed"));
        draw_set_color(dblue);
        draw_text_ext_transformed(x + 120, y + 170 + 2, quiz_answer_a, 26, 100, 1, 1, 0);
        draw_text_ext_transformed(x + 120 + 2, y + 170 + 2, quiz_answer_a, 26, 100, 1, 1, 0);
        draw_text_ext_transformed(x + 120 + 2, y + 170, quiz_answer_a, 26, 100, 1, 1, 0);
        draw_set_color(_answer_color);
        draw_set_alpha(1);
        draw_text_ext_transformed(x + 120, y + 170, quiz_answer_a, 26, 100, 1, 1, 0);
        draw_set_font(fnt_mainbig);
        _answer_color = 16777215;
        if (answer == "B")
        {
            _answer_color = 65535;
            draw_set_color(_answer_color);
            if (susie_select)
            {
                draw_set_color(dblue);
                draw_text_ext_transformed(x + 330, y + 90 + 2, "B", 999, 999, 2, 2, 0);
                draw_text_ext_transformed(x + 330 + 2, y + 90 + 2, "B", 999, 999, 2, 2, 0);
                draw_text_ext_transformed(x + 330 + 2, y + 90, "B", 999, 999, 2, 2, 0);
                draw_set_color(_answer_color);
                draw_set_alpha(1);
                draw_text_ext_transformed(x + 330, y + 90, "B", 999, 999, 2, 2, 0);
            }
            if (ralsei_select)
            {
                draw_set_color(dblue);
                draw_text_ext_transformed(x + 390, y + 90 + 2, "B", 999, 999, 2, 2, 0);
                draw_text_ext_transformed(x + 390 + 2, y + 90 + 2, "B", 999, 999, 2, 2, 0);
                draw_text_ext_transformed(x + 390 + 2, y + 90, "B", 999, 999, 2, 2, 0);
                draw_set_color(_answer_color);
                draw_set_alpha(1);
                draw_text_ext_transformed(x + 390, y + 90, "B", 999, 999, 2, 2, 0);
            }
        }
        draw_set_color(dblue);
        draw_text_ext_transformed(x + 360, y + 90 + 2, "B", 999, 999, 2, 2, 0);
        draw_text_ext_transformed(x + 360 + 2, y + 90 + 2, "B", 999, 999, 2, 2, 0);
        draw_text_ext_transformed(x + 360 + 2, y + 90, "B", 999, 999, 2, 2, 0);
        draw_set_color(_answer_color);
        draw_set_alpha(1);
        draw_text_ext_transformed(x + 360, y + 90, "B", 999, 999, 2, 2, 0);
        draw_set_font(scr_84_get_font("8bit_mixed"));
        draw_set_color(dblue);
        draw_text_ext_transformed(x + 360, y + 170 + 2, quiz_answer_b, 26, 100, 1, 1, 0);
        draw_text_ext_transformed(x + 360 + 2, y + 170 + 2, quiz_answer_b, 26, 100, 1, 1, 0);
        draw_text_ext_transformed(x + 360 + 2, y + 170, quiz_answer_b, 26, 100, 1, 1, 0);
        draw_set_color(_answer_color);
        draw_set_alpha(1);
        draw_text_ext_transformed(x + 360, y + 170, quiz_answer_b, 26, 100, 1, 1, 0);
        draw_set_font(fnt_8bit);
        draw_set_halign(fa_left);
        draw_set_color(c_white);
    }
    if (quiz_result)
    {
        if (quiz_display)
            quiz_display = false;
        for (var i = 0; i < width; i++)
        {
            for (var j = 0; j < height; j++)
                draw_sprite_ext(result_icon, screen_anim, x + (i * tvwidth), y + (j * tvheight), 2, 2, image_angle, c_white, image_alpha);
        }
    }
    if (bullet_mode)
    {
        if (quiz_result)
            quiz_result = false;
        if (bullet_con == 0)
        {
            bullet_con = 1;
            scr_var_delay("bullet_con", 2, 1);
            with (obj_mainchara)
                battlemode = 1;
            bullet_screen_sprite = 4886;
        }
        if (bullet_con == 2)
        {
            bullet_con = 3;
            scr_var_delay("bullet_con", 4, 1);
            generate_faces();
            bullet_max_time = array_length_1d(bullet_pos_list) * 16;
        }
        if (bullet_con == 4)
        {
            bullet_con = 5;
            shoot_sequence = true;
        }
        if (bullet_con == 5 && !shoot_sequence)
        {
            bullet_con = 6;
            scr_var_delay("bullet_con", 7, 45);
        }
        if (bullet_con == 7)
        {
            bullet_con = 8;
            scr_var_delay("bullet_con", 9, 15);
            with (obj_mainchara)
                battlemode = 0;
            var i = array_length_1d(shooter_list) - 1;
            while (i >= 0)
            {
                with (shooter_list[i])
                    instance_destroy();
                i--;
            }
            shooter_list = [];
        }
        if (bullet_con == 9)
        {
            bullet_con = 0;
            bullet_finish = true;
            bullet_mode = false;
        }
        for (var i = 0; i < width; i++)
        {
            for (var j = 0; j < height; j++)
                draw_sprite_ext(bullet_screen_sprite, screen_anim, x + (i * tvwidth), y + (j * tvheight), 2, 2, image_angle, c_white, image_alpha);
        }
        for (var i = 0; i < array_length_1d(shooter_list); i++)
            draw_sprite_ext(shooter_list[i].current_screen_sprite, shooter_list[i].screen_index, x + (shooter_list[i].current_screen_tile.x * tvwidth), y + (shooter_list[i].current_screen_tile.y * tvheight), 2, 2, image_angle, c_white, shooter_list[i].screen_alpha);
    }
    if (show_static_display)
    {
        for (var i = 0; i < width; i++)
        {
            for (var j = 0; j < height; j++)
                draw_sprite_ext(spr_dw_teevie_tv_static, screen_anim, x + (i * tvwidth), y + (j * tvheight), 2, 2, image_angle, c_white, image_alpha);
        }
    }
    for (var i = 0; i < array_length(_screen_list); i++)
    {
        var screen = _screen_list[i];
        var screen_tile_pos = screen.get_tile_pos();
        var screen_tile_x = screen_tile_pos.x;
        var screen_tile_y = screen_tile_pos.y;
        draw_sprite_ext(tvbasesprite, 4, x + (screen_tile_x * tvwidth), y + (screen_tile_y * tvheight), image_xscale, image_yscale, image_angle, c_white, 0.65);
        draw_sprite_ext(tvbasesprite, 1, x + (screen_tile_x * tvwidth), y + (screen_tile_y * tvheight), image_xscale, image_yscale, image_angle, merge_color(tvbasecolor, screen.get_screen_color(), 0.6 + (sin((timer / 4) + screen_tile_x + screen_tile_y) * 0.1)), image_alpha);
        draw_sprite_ext(tvbasesprite, 2, x + (screen_tile_x * tvwidth), y + (screen_tile_y * tvheight), image_xscale, image_yscale, image_angle, merge_color(tvbasecolor, c_black, 0.5), image_alpha);
        draw_sprite_ext(tvbasesprite, 3, x + (screen_tile_x * tvwidth), y + (screen_tile_y * tvheight), image_xscale, image_yscale, image_angle, tvbasecolor, image_alpha);
        draw_sprite_ext(tvbasesprite, 5, x + (screen_tile_x * tvwidth), y + (screen_tile_y * tvheight), image_xscale, image_yscale, image_angle, c_white, image_alpha);
    }
}
