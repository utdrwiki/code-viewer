if (battle_active)
{
    if (room != room_dw_castle_tv_zone_minigame)
    {
        var sign_col2 = 8421504;
        if (sign_action == 2)
            sign_col2 = sign_col;
        draw_sprite_ext(scr_84_get_sprite("spr_mike_sign"), sign_index, sign_x, cameray() + sign_y, 1, 1, 0, sign_col2, 1);
        sign_col2 = 8421504;
        if (sign_action2 == 2)
            sign_col2 = 255;
        draw_sprite_ext(scr_84_get_sprite("spr_mike_sign"), 1, sign_x2, cameray() + sign_y2, 1, 1, 0, sign_col2, 1);
    }
    var xx = camerax();
    var yy = cameray();
    if (i_ex(obj_mike_minigame_controller))
    {
        with (obj_mike_minigame_controller)
        {
            if (phase == 2 && action == 1)
                yy -= 37;
        }
    }
    tpoff = (tp - tpy) + yy;
    bpoff = -bp + bpy + yy;
    if (intro == 1)
    {
        if (bp < (bpy - 1))
        {
            if ((bpy - bp) < 40)
                bp += round((bpy - bp) / 2.5);
            else
                bp += 30;
        }
        else
        {
            bp = bpy;
        }
        if (bp == bpy)
            intro = 0;
    }
    if (intro == 2)
    {
        if (bp > 0)
        {
            if (round((bpy - bp) / 5) > 15)
                bp -= round((bpy - bp) / 2.5);
            else
                bp -= 30;
        }
        else
        {
            bp = 0;
        }
    }
    draw_set_color(c_black);
    if (room == room_dw_castle_tv_zone_minigame)
        ossafe_fill_rectangle(xx - 10, 581 + yy, xx + 700, ((520 - bp) + yy) - 4, false);
    if (room != room_dw_castle_tv_zone_minigame)
    {
        ossafe_fill_rectangle(xx - 10, 481 + yy, xx + 700, ((480 - bp) + yy) - 4, false);
        draw_set_color(bcolor);
        ossafe_fill_rectangle(xx - 10, (480 - bp - 3) + yy, xx + 700, (480 - bp - 2) + yy, false);
    }
    draw_set_color(bcolor);
    ossafe_fill_rectangle(xx - 10, (480 - bp) + 34 + yy, xx + 700, (480 - bp) + 36 + yy, false);
    with (obj_mike_minigame_controller)
    {
        if (phase == 2 && action == 1)
        {
            for (var i = 0; i < 3; i++)
            {
                var alph = 0.6;
                if (i < plueyhealth)
                    alph = 1;
                draw_sprite_ext(spr_mike_cat_face, 0, camerax() + 320 + (50 * (i - 1)), (480 - other.bp) + 64 + yy, 2 * alph, 2 * alph, 0, c_white, alph);
            }
        }
    }
    if (room != room_dw_castle_tv_zone_minigame)
    {
        scr_charbox_mike();
    }
    else
    {
        with (obj_mike_minigame_controller)
        {
            if (phase == 2)
            {
                var myhiscore = obj_mike_minigame_tv.hiscore[obj_mike_minigame_tv.minigame];
                draw_set_colour(c_white);
                draw_set_font(fnt_mainbig);
                if (action != 1)
                {
                    if (myscore > myhiscore)
                        draw_set_colour(merge_colour(c_white, c_yellow, clamp(0.5 + sin(current_time / 400), 0, 1)));
                    draw_text(32, 370, stringsetloc("SCORE: ", "obj_mike_controller_slash_Draw_0_gml_73_0") + string(myscore));
                    draw_set_colour(c_white);
                    draw_text(32, 400, stringsetloc("HISCORE: ", "obj_mike_controller_slash_Draw_0_gml_75_0_b") + string(myhiscore));
                }
                if (action == 2)
                {
                    draw_text(32, 430, stringsetloc("CATS: ", "obj_mike_controller_slash_Draw_0_gml_79_0") + string(instance_number(obj_gravity_ball)));
                    new_cat -= 0.05;
                    draw_set_color(c_ltgray);
                    draw_set_alpha(new_cat);
                    draw_set_font(scr_84_get_font("mainbig"));
                    draw_text(140, 430, stringsetloc("I was born.", "obj_mike_controller_slash_Draw_0_gml_84_0"));
                    draw_set_alpha(1);
                    draw_set_font(fnt_mainbig);
                }
                var _vol = obj_mike_controller.microphone_volume / 100;
                if (action == 3)
                {
                    var _catheld = 0;
                    if (obj_mike_controller.hand_type == 2)
                        _catheld = 1;
                    var _shake = 2 * (_vol + _catheld);
                    var _shakex = irandom_range(-_shake, _shake);
                    var _shakey = irandom_range(-_shake, _shake);
                    var _fx = 480 + _shakex;
                    var _fy = 400 + _shakey;
                    draw_set_halign(fa_center);
                    draw_set_colour(c_white);
                    if (obj_mike_minigame_controller.fuel <= 10)
                        draw_set_colour(merge_colour(c_white, c_red, clamp(0.5 + (sin(current_time / 200) * 0.5), 0, 1)));
                    if (obj_mike_minigame_controller.fuel >= 101)
                        draw_set_colour(merge_colour(c_white, c_yellow, clamp(0.5 + (sin(current_time / 200) * 0.5), 0, 1)));
                    if (obj_mike_minigame_controller.fuel >= 151)
                        draw_set_colour(merge_colour(c_white, c_fuchsia, clamp(0.5 + (sin(current_time / 200) * 0.5), 0, 1)));
                    if (obj_mike_minigame_controller.fuel >= 201)
                        draw_set_colour(merge_colour(c_white, c_gray, clamp(0.5 + (sin(current_time / 200) * 0.5), 0, 1)));
                    draw_text(530 + _shakex, 370 + _shakey, stringsetloc("FUEL", "obj_mike_controller_slash_Draw_0_gml_104_0"));
                    if (_vol > 0.1)
                        draw_set_colour(c_blue);
                    else if (_catheld)
                        draw_set_colour(c_blue);
                    else
                        draw_set_colour(c_lime);
                    if (obj_mike_minigame_controller.fuel <= 10)
                        draw_set_colour(merge_colour(c_white, c_red, clamp(0.5 + (sin(current_time / 200) * 0.5), 0, 1)));
                    if (obj_mike_minigame_controller.fuel >= 101)
                        draw_set_colour(merge_colour(c_white, c_yellow, clamp(0.5 + (sin(current_time / 200) * 0.5), 0, 1)));
                    if (obj_mike_minigame_controller.fuel >= 151)
                        draw_set_colour(merge_colour(c_white, c_fuchsia, clamp(0.5 + (sin(current_time / 200) * 0.5), 0, 1)));
                    if (obj_mike_minigame_controller.fuel >= 201)
                        draw_set_colour(merge_colour(c_white, c_gray, clamp(0.5 + (sin(current_time / 200) * 0.5), 0, 1)));
                    draw_set_alpha(0.5);
                    if (abs(obj_mike_minigame_controller.fuel - obj_mike_minigame_controller.last_fuel) > 5)
                        ossafe_fill_rectangle(_fx, _fy, _fx + clamp((obj_mike_minigame_controller.last_fuel / 100) * 100, 0, 100), _fy + 25, 0);
                    draw_set_alpha(1);
                    ossafe_fill_rectangle(_fx, _fy, _fx + 100, _fy + 25, 1);
                    ossafe_fill_rectangle(_fx, _fy, _fx + clamp((obj_mike_minigame_controller.fuel / 100) * 100, 0, 100), _fy + 25, 0);
                    draw_set_halign(fa_left);
                }
                with (obj_gravity_hoop)
                {
                    var _time = scr_timedisp(min(other.countdown, 1800));
                    draw_set_halign(fa_center);
                    draw_set_colour(c_white);
                    if (obj_mike_minigame_controller.combo > 0 && obj_mike_minigame_controller.combo_buffer < 25)
                        draw_text(x - 252, 370, stringsetloc("COMBO: ", "obj_mike_controller_slash_Draw_0_gml_135_0") + string(obj_mike_minigame_controller.combo));
                    if (other.countdown > 0 && other.countdown < 150)
                        draw_set_colour(merge_colour(c_white, c_red, clamp(0.5 + (sin(current_time / 200) * 0.5), 0, 1)));
                    _str = string_copy(_time, 3, string_length(_time) + 4);
                    if (other.countdown <= 0)
                        _str = stringsetloc("TIME'S UP!", "obj_mike_controller_slash_Draw_0_gml_141_0");
                    draw_text(x, 370, stringsetloc("TIME", "obj_mike_controller_slash_Draw_0_gml_143_0"));
                    draw_text(x, 400, string(_str));
                    draw_set_halign(fa_left);
                }
            }
        }
    }
    if (instance_number(obj_heart) == 1 && !obj_mike_attack_controller.talking)
    {
        if (type == 8 || type == 9)
        {
            draw_set_colour(merge_colour(c_lime, c_black, 0.5));
            d_line(obj_heart.x + 10, 190 - line_height, obj_heart.x + 10, 190 + line_height);
            line_height = lerp(line_height, 110, 0.5);
        }
        if (type == 3 || type == 4 || type == 8 || type == 9)
        {
            draw_set_colour(merge_colour(c_lime, c_black, 0.5));
            var line_x = ((line_width / 36) + (camerax() + (camerawidth() / 2))) - line_width;
            var line_s = line_width / 18;
            line_y[0] = line_ypos + (cameray() + (cameraheight() / 2));
            line_y[35] = line_ypos + (cameray() + (cameraheight() / 2));
            if (type < 8)
            {
                for (var i = 1; i < 36; i++)
                {
                    if (i < 35)
                        line_y[i] = line_ypos + (cameray() + (cameraheight() / 2)) + clamp(sin(i + (current_time * -line_side)) * floor(microphone_volume) * 0.1, -16, 16);
                    d_line(line_x + ((i - 1) * line_s), line_y[i - 1], line_x + (i * line_s), line_y[i]);
                }
                draw_sprite_ext(spr_mike_littlearrow, 0, x + ((size1 + 3) * line_side), y, line_side, 1, 0, c_lime, 1);
            }
            if (type == 9)
                draw_sprite_ext(spr_mike_littlearrow, 0, x + max(0, line_side), y + ((size1 + 3) * line_side), 1, 1, 90 + (max(0, line_side) * 180), c_lime, 1);
            draw_set_colour(c_black);
            ossafe_fill_rectangle(x - size1 - 1, y - size1 - 1, x + size1, y + size1, 0);
        }
        if (type < 5 || type == 8 || type == 9)
        {
            draw_set_colour(c_lime);
            ossafe_fill_rectangle(x - size1 - 1, y - size1 - 1, x + size1, y + size1, 1);
            ossafe_fill_rectangle(x - size1 - 2, y - size1 - 2, x + size1 + 1, y + size1 + 1, 1);
            if ((type == 1 || type == 2) && wing_angle1 != 270)
            {
                d_line_width(x - size1 - 3, y - size1 - 2, (x - size1 - 3) + lengthdir_x(size1 * 2, wing_angle1), (y - size1 - 2) + lengthdir_y(size1 * 2, wing_angle1), 2);
                d_line_width(x + size1 + 1, y - size1 - 2, (x + size1 + 1) - lengthdir_x(size1 * 2, wing_angle1), (y - size1 - 2) + lengthdir_y(size1 * 2, wing_angle1), 2);
            }
        }
        if (type == 5 || type == 15)
        {
            var center_x = x - 1;
            var center_y = y - 1;
            if (os_type == os_switch)
                center_x++;
            for (var i = 0; i < 35; i++)
            {
                var mydir = current_time / 300;
                var dir_distance = point_distance(new_dir, 0, dir, 0) / 10;
                var circle_x = center_x + lengthdir_x(max(16, size1) + (sin(i + (current_time / 30)) * dir_distance), mydir + ((i / 36) * 360));
                var circle_y = center_y + lengthdir_y(max(16, size1) + (sin(i + (current_time / 30)) * dir_distance), mydir + ((i / 36) * 360));
                var circle_x2 = center_x + lengthdir_x(max(16, size1) + (sin((i - 1) + (current_time / 30)) * dir_distance), mydir + (((i - 1) / 36) * 360));
                var circle_y2 = center_y + lengthdir_y(max(16, size1) + (sin((i - 1) + (current_time / 30)) * dir_distance), mydir + (((i - 1) / 36) * 360));
                draw_set_colour(c_lime);
                if (i == 0)
                {
                    n = 34;
                    circle_x2 = center_x + lengthdir_x(max(16, size1) + (sin(n + (current_time / 30)) * dir_distance), mydir + ((n / 36) * 360));
                    circle_y2 = center_y + lengthdir_y(max(16, size1) + (sin(n + (current_time / 30)) * dir_distance), mydir + ((n / 36) * 360));
                }
                d_line_width(circle_x, circle_y, circle_x2, circle_y2, 2);
            }
        }
        size1 += ((size2 - size1) * 0.25);
        size2 += ((size3 - size2) * 0.25);
        size1 = scr_approach(size1, size2, 0.01);
        size2 = scr_approach(size2, size3, 0.01);
    }
    if (type == 15)
    {
        var bottomY = 326;
        var _phase = x / 18;
        yOffset = sin(_phase) * 4;
        y += yOffset;
        for (var ii = -1; ii <= 1; ii += 2)
        {
            xx = x + (sin(_phase) * -32) + (32 * ii);
            yy = bottomY + min(0, cos(_phase) * 16);
            draw_set_colour(c_lime);
            for (var i = 1; i < (point_distance(xx, yy, x, y) / 16); i++)
            {
                if (point_distance(xx + lengthdir_x(i * 16, point_direction(xx, yy, x, y)), yy + lengthdir_y(i * 16, point_direction(xx, yy, x, y)), x, y) > 32)
                    d_circle(xx + irandom_range(1, -1) + lengthdir_x(i * 16, point_direction(xx, yy, x, y)), yy + irandom_range(1, -1) + lengthdir_y(i * 16, point_direction(xx, yy, x, y)), 2, 1);
            }
            _phase = (x + (32 * ii)) / 20;
            draw_sprite_ext(spr_mike_shoe, 0, xx, yy, ii, 1, sin(_phase) * 5 * ii, c_white, 1);
        }
    }
    if (!obj_mike_attack_controller.talking)
    {
        if (vis)
        {
            with (obj_heart)
                draw_self();
        }
    }
}
