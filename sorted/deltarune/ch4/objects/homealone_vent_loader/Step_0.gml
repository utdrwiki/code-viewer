if (!loaded)
{
    if (load_room != -4 && room == load_room)
    {
        if (!fade_active)
        {
            fade_active = true;
            var heart_x = 0;
            var heart_y = 0;
            var vent = load_vent;
            with (obj_homealone_vent_hidden)
            {
                if (vent_name == vent)
                {
                    heart_x = (x + (sprite_width / 2)) - (sprite_get_width(spr_heartsmall) / 2);
                    heart_y = y + sprite_height + 5;
                    if (object_index == obj_homealone_vent)
                        heart_y = (y + sprite_height) - 5;
                    if (load_type == "left")
                    {
                        heart_x = x - sprite_get_width(spr_heartsmall) - 2;
                        heart_y = (y + (sprite_height / 2)) - 5;
                    }
                    if (load_type == "right")
                    {
                        heart_x = x + sprite_width + 2;
                        heart_y = (y + (sprite_height / 2)) - 5;
                    }
                    if (load_type == "top")
                        heart_y = y - (sprite_get_width(spr_heartsmall) / 2) - 5;
                }
            }
            if (!i_ex(obj_homealone_heart))
                instance_create(heart_x, heart_y, obj_homealone_heart);
            with (obj_mainchara)
            {
                y = -200;
                cutscene = 1;
                freeze = 1;
                visible = 0;
            }
            if (room == room_lw_noellehouse_kitchen || room == room_lw_noellehouse_dess)
                mus_volume(global.currentsong[1], 0, 14);
            else if (audio_is_playing(global.currentsong[1]))
                mus_volume(global.currentsong[1], 1, 14);
        }
        if (image_alpha < 0.75)
        {
            loaded = true;
            var loaded_type = "bottom";
            var vent = load_vent;
            with (obj_homealone_vent_hidden)
            {
                if (vent_name == vent)
                    loaded_type = load_type;
            }
            if (loaded_type == "bottom")
                scr_lerpvar_instance(568, "y", obj_homealone_heart.y, obj_homealone_heart.y + 3, 5);
            if (loaded_type == "right")
                scr_lerpvar_instance(568, "x", obj_homealone_heart.x, obj_homealone_heart.x + 3, 5);
            if (loaded_type == "left")
                scr_lerpvar_instance(568, "x", obj_homealone_heart.x, obj_homealone_heart.x - 3, 5);
            alarm[0] = 5;
        }
    }
}
