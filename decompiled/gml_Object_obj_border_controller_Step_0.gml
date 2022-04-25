var border_id = global.screen_border_id
var return_title = false
if variable_global_exists("chapter_return")
{
    if (global.chapter_return > 0)
        return_title = true
}
if (!return_title)
{
    if (border_id == "Dynamic" || border_id == "ダイナミック")
    {
        if (!loaded)
        {
            border_alpha = false
            loaded = true
        }
        border_fade_value = 0.025
        if (!variable_global_exists("currentroom"))
            global.currentroom = room
        var room_id = room
        _border_image = (global.darkzone ? border_dw_castletown : border_lw_town)
        if (room_id == room_legend || room_id == 883 || room_id == PLACE_MENU || room_id == PLACE_LOGO)
            _border_image = border_dw_castletown
        if (room_id >= room_dw_cyber_intro_1 && room_id < room_dw_city_spamton_shop_exterior)
            _border_image = border_dw_cyber
        if (room_id >= room_dw_city_spamton_shop_exterior && room_id < room_dw_mansion_krisroom)
            _border_image = border_dw_city
        if ((room_id >= room_dw_mansion_krisroom && room_id <= room_dw_mansion_dining_storage) || room_id == room_dw_mansion_prefountain || room_id == room_dw_mansion_fountain)
            _border_image = border_dw_mansion
        if (room_id == room_shop_ch2_music)
        {
            if (global.plot < 200)
                _border_image = border_dw_cyber
        }
        if (room_id == room_shop_ch2_swatch)
            _border_image = border_dw_mansion
        if (room_id == room_shop_ch2_spamton)
            _border_image = border_dw_city
        if (room_id == PLACE_CONTACT || room_id == 878 || room_id == PLACE_MENU || room_id == room_gameover || room_id == PLACE_DOG || room_id == room_title_placeholder || room_id == room_intro_ch2)
            border_alpha = false
        else if (room_id == room_insidecloset || room_id == room_cc_fountain)
            border_fade_out = border_alpha > false
        else if (room_id == room_town_krisyard || room_id == room_castle_town || room_id == room_town_school)
            border_fade_in = border_alpha < true
        else if instance_exists(obj_savepoint)
        {
            if (global.chapter == 2)
            {
                if (room_id == room_dw_mansion_lightner_hallway && global.plot >= 101)
                    border_alpha = true
                if (room_id == room_dw_mansion_entrance)
                    border_alpha = true
                if (room_id == room_dw_mansion_acid_tunnel_exit)
                    border_alpha = true
                if (room_id == room_dw_castle_area_2)
                    border_alpha = true
            }
            else
                border_alpha = true
        }
        if (global.chapter == 1)
        {
            if (room_id == room_school_unusedroom)
            {
                if instance_exists(obj_unusedclassevent)
                {
                    if (obj_unusedclassevent.lightsoff == 0)
                        border_fade_in = border_alpha < true
                    else
                        border_alpha = false
                }
            }
            if (room_id == room_krisroom)
            {
                if instance_exists(obj_krisroom)
                {
                    if (obj_krisroom.con >= 50)
                        border_fade_out = border_alpha > false
                    else
                        border_alpha = (global.plot <= 10 ? false : true)
                }
            }
        }
        if (global.chapter == 2)
        {
            if (room_id == room_krisroom)
            {
                if i_ex(obj_krisroom)
                {
                    if obj_krisroom.show_border
                        border_alpha = true
                }
            }
            if (room_id == room_schooldoor)
            {
                if i_ex(obj_dw_transition)
                {
                    border_fade_in = false
                    border_fade_out = border_alpha > false
                }
                else
                {
                    border_fade_out = false
                    border_fade_in = border_alpha < true
                }
            }
            if (room_id == room_dw_castle_area_1)
            {
                if i_ex(obj_dw_leave)
                {
                    if (obj_dw_leave.con >= 10)
                    {
                        border_fade_in = false
                        border_fade_out = border_alpha > false
                    }
                }
                if i_ex(obj_dw_transition)
                {
                    if (obj_dw_transition.timer >= 30)
                    {
                        border_fade_out = false
                        border_fade_in = border_alpha < true
                    }
                }
            }
            if (room_id >= room_dw_cyber_intro_1 && room_id <= room_dw_cyber_keyboard_puzzle_3 && room_id != room_dw_cyber_rollercoaster)
                border_fade_in = border_alpha < true
            if (room_id == room_dw_castle_area_2_transformed)
            {
                if (global.plot <= 10)
                {
                    if i_ex(obj_ch2_scene6)
                    {
                        if (obj_ch2_scene6.con >= 50)
                            border_fade_in = border_alpha < true
                    }
                }
                else
                    border_alpha = true
            }
            if (room_id == room_library)
            {
                if i_ex(obj_dw_transition)
                    border_fade_out = border_alpha > false
            }
            if (room_id == room_dw_cyber_rollercoaster)
            {
                if i_ex(obj_ch2_scene11a)
                {
                    if (obj_ch2_scene11a.hide_border == 1)
                        border_fade_out = border_alpha > false
                }
            }
            if (room_id == room_dw_city_entrance)
                border_fade_in = border_alpha < true
            if (room_id == room_dw_city_intro)
            {
                if (global.plot >= 67)
                    border_fade_in = border_alpha < true
                else
                    alpha_border = 0
            }
            if (room_id >= room_dw_city_traffic_1 && room_id <= room_dw_city_moss && room_id != room_dw_city_mansion_front)
                border_alpha = true
            if (room_id == room_dw_city_mansion_front)
            {
                if i_ex(obj_ch2_city08)
                {
                    if (obj_ch2_city08.circle_zoom_timer >= 50)
                    {
                        border_fade_in = false
                        border_fade_out = border_alpha > false
                    }
                }
            }
            if (room_id == room_dw_mansion_krisroom)
            {
                border_alpha = false
                border_fade_out = false
                border_fade_in = false
            }
            if (room_id == room_dw_mansion_lightner_hallway)
            {
                border_fade_out = false
                border_fade_in = border_alpha < true
            }
            if (room_id == room_dw_mansion_b_entrance)
            {
                border_fade_value = 0.01
                border_fade_out = border_alpha > false
            }
            if (room_id == room_dw_mansion_east_1f_secret)
                border_fade_in = border_alpha < true
            if (room_id >= room_dw_mansion_b_stairs && room_id <= room_dw_mansion_b_east_transformed)
                border_alpha = false
            if (room_id == room_dw_mansion_east_3f)
                border_alpha = true
            if (room_id == room_dw_mansion_east_4f_d)
                border_alpha = true
            if (room_id == room_dw_mansion_prefountain)
                border_alpha = true
            if (room_id == room_dw_mansion_fountain)
                border_fade_out = border_alpha > false
            if (room_id == room_dw_mansion_top_post)
            {
                if i_ex(obj_ch2_scene27)
                {
                    if obj_ch2_scene27.hide_border
                    {
                        border_fade_in = false
                        border_fade_out = border_alpha > false
                    }
                    else if obj_ch2_scene27.show_border
                    {
                        border_fade_out = false
                        border_fade_in = border_alpha < true
                    }
                }
            }
            if (room_id == room_lw_computer_lab)
            {
                if i_ex(obj_ch2_scene28b)
                {
                    if obj_ch2_scene28b.show_border
                        border_fade_in = border_alpha < true
                }
            }
            if (room_id == room_torhouse)
            {
                if i_ex(obj_ch2_scene32)
                {
                    if obj_ch2_scene32.hide_border
                    {
                        border_fade_in = false
                        border_fade_out = border_alpha > false
                    }
                }
            }
        }
        if (room_id == PLACE_FAILURE)
        {
            if i_ex(DEVICE_FAILURE)
            {
                if (DEVICE_FAILURE.EVENT >= 27 && (!instance_exists(obj_writer)))
                    border_alpha = false
            }
        }
        if ((room_id == room_legend || room_id == 883 || room_id == PLACE_MENU) && global.game_won == true)
        {
            _border_image = border_dw_castletown
            border_alpha = true
        }
        global.disable_border = border_alpha != true
    }
    else if (border_id == "Simple" || border_id == "シンプル")
    {
        room_id = global.currentroom
        if instance_exists(obj_savepoint)
            border_alpha = true
        if (room_id == room_ed)
        {
            if instance_exists(obj_credits)
            {
                if (obj_credits.timer >= 1560)
                {
                    border_fade_value = 0.01
                    border_fade_out = border_alpha > false
                }
            }
        }
        global.disable_border = border_alpha != true
    }
}
if return_title
{
    border_fade_in = false
    border_fade_value = 0.05
    border_fade_out = border_alpha > false
    global.disable_border = border_alpha != true
}
