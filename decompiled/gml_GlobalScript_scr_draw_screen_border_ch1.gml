scr_draw_screen_border_ch1 = function(argument0) //gml_Script_scr_draw_screen_border_ch1
{
    var border_id = argument0
    var return_title = false
    if variable_global_exists("chapter_return")
    {
        if (global.chapter_return > 0)
            return_title = true
    }
    if (!return_title)
    {
        draw_enable_alphablend_ch1(false)
        if (border_id == "Dynamic" || border_id == "ダイナミック")
        {
            if (!loaded)
            {
                obj_time_ch1.border_alpha = false
                loaded = true
            }
            obj_time_ch1.border_fade_value = 0.025
            var room_id = room
            var _border_image = (global.darkzone ? border_dark_ch1 : border_light_ch1)
            if (room_id == room_legend_ch1 || room_id == 1638 || room_id == PLACE_MENU_ch1 || room_id == PLACE_LOGO_ch1)
                _border_image = border_dark_ch1
            if (room_id == PLACE_CONTACT_ch1 || room_id == 1634 || room_id == PLACE_MENU_ch1 || room_id == room_splashscreen_ch1 || room_id == room_gameover_ch1 || room_id == PLACE_DOG_ch1 || room_id == room_dark1a_ch1 || room_id == room_dark_eyepuzzle_ch1)
                obj_time_ch1.border_alpha = false
            else if (room_id == room_insidecloset_ch1 || room_id == room_cc_fountain_ch1)
                obj_time_ch1.border_fade_out = obj_time_ch1.border_alpha > false
            else if (room_id == room_town_krisyard_ch1 || room_id == room_castle_town_ch1 || room_id == room_town_school_ch1)
                obj_time_ch1.border_fade_in = obj_time_ch1.border_alpha < true
            else if instance_exists(obj_savepoint_ch1)
                obj_time_ch1.border_alpha = true
            if (room_id == room_school_unusedroom_ch1)
            {
                if instance_exists(obj_unusedclassevent_ch1)
                {
                    if (obj_unusedclassevent_ch1.lightsoff == 0)
                        obj_time_ch1.border_fade_in = obj_time_ch1.border_alpha < true
                    else
                        obj_time_ch1.border_alpha = false
                }
            }
            if (room_id == room_krisroom_ch1)
            {
                if instance_exists(obj_krisroom_ch1)
                {
                    if (obj_krisroom_ch1.con >= 50)
                        obj_time_ch1.border_fade_out = obj_time_ch1.border_alpha > false
                    else
                        obj_time_ch1.border_alpha = (global.plot <= 10 ? false : true)
                }
            }
            if (room_id == PLACE_FAILURE_ch1)
            {
                if instance_exists(DEVICE_FAILURE_ch1)
                {
                    if (DEVICE_FAILURE_ch1.EVENT >= 27 && (!instance_exists(obj_writer_ch1)))
                        obj_time_ch1.border_alpha = false
                }
            }
            var game_won = false
            if ossafe_file_exists_ch1("filech1_3")
                game_won = true
            if ossafe_file_exists_ch1("filech1_4")
                game_won = true
            if ossafe_file_exists_ch1("filech1_5")
                game_won = true
            if ((room_id == room_legend_ch1 || room_id == 1638 || room_id == PLACE_MENU_ch1) && game_won == true)
            {
                _border_image = border_dark_ch1
                obj_time_ch1.border_alpha = true
            }
            scr_draw_background_ps4_ch1(_border_image, 0, 0)
            global.disable_border = obj_time_ch1.border_alpha != true
        }
        else if (border_id == "Simple" || border_id == "シンプル")
        {
            room_id = global.currentroom
            if instance_exists(obj_savepoint_ch1)
                obj_time_ch1.border_alpha = true
            if (room_id == room_ed_ch1)
            {
                if instance_exists(obj_credits_ch1)
                {
                    if (obj_credits_ch1.timer >= 1560)
                    {
                        obj_time_ch1.border_fade_value = 0.01
                        obj_time_ch1.border_fade_out = obj_time_ch1.border_alpha > false
                    }
                }
            }
            scr_draw_background_ps4_ch1(bg_border_line_1080_ch1, 0, 0)
            global.disable_border = obj_time_ch1.border_alpha != true
        }
        draw_set_alpha(1)
        draw_enable_alphablend_ch1(true)
    }
    if return_title
    {
        obj_time_ch1.border_fade_in = false
        obj_time_ch1.border_fade_value = 0.05
        obj_time_ch1.border_fade_out = obj_time_ch1.border_alpha > false
        global.disable_border = obj_time_ch1.border_alpha != true
    }
    return;
}

