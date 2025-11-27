if (global.chapter < 4)
{
    if (tm_con == 1 && !i_ex(obj_writer))
    {
        tm_con = 0;
        snd_play(snd_whip_crack_only);
    }
    if (t_con == 1 && !i_ex(obj_writer))
    {
        t_con = 0;
        snd_play(snd_electric_meow);
    }
}
else
{
    if (kk_flip)
    {
        kk_timer++;
        if (kk_timer == 1)
        {
            with (kk_marker)
                scr_flip("x");
        }
        if (kk_timer == 15)
        {
            with (kk_marker)
                image_index = 1;
        }
        if (kk_timer == 20)
        {
            with (kk_marker)
                image_index = 0;
        }
        if (kk_timer == 30)
            kk_timer = 0;
    }
    if (tm_note)
    {
        tm_timer++;
        if (tm_timer == 1)
        {
            var start_x = tm_marker.x + 60 + irandom(10);
            var start_y = tm_marker.y + 10;
            var note_marker = scr_dark_marker(start_x, start_y, spr_musical_notes_small);
            note_marker.depth = tm_marker.depth - 10;
            note_marker.image_alpha = 0;
            var note_speed = 1;
            scr_lerp_var_instance(note_marker, "image_alpha", 0, 1, 10 * note_speed);
            scr_lerp_var_instance(note_marker, "x", start_x, start_x + 20 + irandom(10), 30 * note_speed);
            scr_lerp_var_instance(note_marker, "y", start_y, start_y - (30 + irandom(10)), 30 * note_speed);
            with (note_marker)
                scr_script_delayed(scr_lerp_var_instance, 11 * note_speed, id, "image_alpha", 1, 0, 10 * note_speed);
            scr_doom(note_marker, 61 * note_speed);
        }
        if (tm_timer >= 45)
            tm_timer = 0;
    }
    if (sweet_note)
    {
        sweet_timer++;
        if (sweet_timer == 1)
        {
            var start_x = sweet_marker.x + 8 + irandom(10);
            var start_y = sweet_marker.y + 10;
            var note_marker = scr_dark_marker(start_x, start_y, spr_musical_notes_small);
            note_marker.depth = sweet_marker.depth - 10;
            note_marker.image_alpha = 0;
            var note_speed = 1;
            scr_lerp_var_instance(note_marker, "image_alpha", 0, 1, 10 * note_speed);
            scr_lerp_var_instance(note_marker, "x", start_x, start_x - 20 - irandom(10), 30 * note_speed);
            scr_lerp_var_instance(note_marker, "y", start_y, start_y - (30 + irandom(10)), 30 * note_speed);
            with (note_marker)
                scr_script_delayed(scr_lerp_var_instance, 11 * note_speed, id, "image_alpha", 1, 0, 10 * note_speed);
            scr_doom(note_marker, 61 * note_speed);
        }
        if (sweet_timer >= 25)
            sweet_timer = 0;
    }
}
