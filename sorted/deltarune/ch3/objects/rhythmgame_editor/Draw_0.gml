draw_self();
if (song_menu)
{
    var _xalign = camerax() + 220;
    var _yalign = cameray() + 50;
    scr_draw_simple_menu(selection, _xalign, _yalign, 16, tracklist);
    _xalign = camerax() + 320;
    _yalign += 200;
    draw_set_halign(fa_center);
    if (instrument == 1)
    {
        draw_set_color(#EA79C8);
        draw_sprite(spr_board_susie_walk_down, 0, _xalign - 100 - 8, _yalign - 20);
    }
    else
    {
        draw_set_color(merge_color(#EA79C8, c_black, 0.5));
    }
    draw_text(_xalign - 100, _yalign, "DRUMS");
    if (instrument == 0)
    {
        draw_set_color(#00A2E8);
        draw_sprite(spr_board_kris_walk_down, 0, _xalign - 8, _yalign - 20);
    }
    else
    {
        draw_set_color(merge_color(#00A2E8, c_black, 0.5));
    }
    draw_text(_xalign, _yalign, "GUITAR");
    if (instrument == 2)
    {
        draw_set_color(#B5E61D);
        draw_sprite(spr_board_ralsei_walk_down, 0, (_xalign + 100) - 8, _yalign - 20);
    }
    else
    {
        draw_set_color(merge_color(#B5E61D, c_black, 0.5));
    }
    if (song_id == 0 || song_id == 2)
        draw_text(_xalign + 100, _yalign, "VOCALS");
    else
        draw_text(_xalign + 100, _yalign, "TAMBOURINE");
    draw_set_halign(fa_left);
    exit;
}
if (song_initialized)
{
    if (!paused || scrollcon < 2)
        trackpos = audio_sound_get_track_position(track1_instance);
    bottomy = cameray() + 270;
    var _notespeed = notespeed;
    var _centerx = 320;
    scr_rhythmgame_draw_backing(_notespeed, _centerx, true);
    var _remcolor = 8421504;
    if (rem_pos > 0)
    {
        if (rem_mode)
            _remcolor = 255;
        draw_set_color(_remcolor);
        var _rem_y = (bottomy - (rem_pos * _notespeed)) + (trackpos * _notespeed);
        draw_rectangle(270, _rem_y, 360, _rem_y, true);
    }
    draw_set_color(merge_color(c_fuchsia, c_white, 2 / (pressedtimer[0] + 1)));
    draw_line(camerax(), bottomy, _centerx, bottomy);
    draw_set_color(merge_color(c_blue, c_white, 2 / (pressedtimer[1] + 1)));
    draw_line(_centerx, bottomy, camerax() + 640, bottomy);
    draw_set_color(c_white);
    var _xstart = (instrument == 2) ? 280 : 285;
    var _xwidth = (instrument == 2) ? 30 : 40;
    scr_rhythmgame_draw(_notespeed, _centerx, true);
    if (do_refresh)
        do_refresh = false;
    if (missnotecon == 1)
    {
        snd_play_x(snd_hurt1, 0.6, 0.9);
        note_streak = 0;
        combo -= 200;
        if (instrument == 0)
        {
            if (oneAtATime)
                mus_volume(track1_instance, 1, 0);
            mus_volume(track2_instance, 0, 0);
        }
        missnotecon = 2;
        missnotetimer = 0;
    }
    if (!paused)
    {
        if (keyboard_check_pressed(ord("Z")))
        {
            scr_rhythmgame_editor_trail_add(trackpos, 0);
            rec_hold = trackpos;
        }
        if (keyboard_check_pressed(ord("X")))
        {
            scr_rhythmgame_editor_trail_add(trackpos, 1);
            rec_hold = trackpos;
        }
        if (instrument != 0 && keyboard_check_pressed(ord("C")))
        {
            scr_rhythmgame_editor_trail_add(trackpos, 2);
            rec_hold = trackpos;
        }
    }
    if (rec_hold > 0 && !keyboard_check(ord("Z")) && !keyboard_check(ord("X")) && !keyboard_check(ord("C")))
    {
        if ((trackpos - rec_hold) > 0.25 || instrument == 2)
            rec_endtime[rec_count - 1] = trackpos;
        rec_hold = 0;
    }
    if (keyboard_check_pressed(vk_backspace))
    {
        rec_count = 0;
        rec_hold = 0;
    }
    draw_set_color(c_gray);
    draw_set_blend_mode(bm_add);
    for (i = 0; i < rec_count; i++)
    {
        var _type = rec_type[i] * 40;
        if (instrument == 2)
            _type *= 0.75;
        var _rec_line = bottomy + ((trackpos - rec_time[i]) * _notespeed);
        if (_rec_line < (cameray() - 20) || (_rec_line > (cameray() + 500) && rec_endtime[i] <= 0))
            continue;
        if (instrument != 2 || paused)
        {
            if (rec_type[i] == 0)
            {
                if (instrument == 2)
                    draw_rectangle(250, _rec_line - 1, 290, _rec_line + 1, 1);
                else
                    draw_rectangle(250, _rec_line - 1, 310, _rec_line + 1, 1);
            }
            else if (rec_type[i] == 1)
            {
                if (instrument == 2)
                    draw_rectangle(295, _rec_line - 1, 335, _rec_line + 1, 1);
                else
                    draw_rectangle(320, _rec_line - 1, 380, _rec_line + 1, 1);
            }
            else if (rec_type[i] == 2)
            {
                if (instrument == 2)
                    draw_rectangle(340, _rec_line - 2, 380, _rec_line + 2, 1);
                else
                    draw_rectangle(240, _rec_line - 2, 390, _rec_line + 2, 1);
            }
        }
        if (instrument != 1 && rec_endtime[i] > 0)
        {
            var notelength = (rec_endtime[i] - rec_time[i]) * _notespeed;
            if (instrument == 2)
                draw_rectangle(270 + _type + 10, _rec_line - notelength, 270 + _type + 20, _rec_line, true);
            else
                draw_rectangle(280 + _type + 10, _rec_line - notelength, 280 + _type + 20, _rec_line, true);
        }
    }
    draw_set_blend_mode(bm_normal);
    draw_sprite_ext(spr_whitegradientdown_center, 0, camerax() + 320, cameray() + 400, 16, 4, 0, c_black, 1);
    draw_set_color(c_black);
    draw_rectangle(0, 400, 640, 480, false);
    draw_set_color(c_red);
    draw_text(0, 0, trackpos);
    draw_text(0, 30, remtrackpos[3]);
    if (maxnote > 0)
        draw_text(0, 60, notetime[0]);
    draw_text(0, 90, trackpos / meter);
    draw_set_color(c_white);
    scr_draw_circle_width_radius(500, 400, 50, 46, 24);
    draw_set_color(c_black);
    draw_rectangle(450, 400, 550, 450, false);
    draw_set_color(c_red);
    draw_sprite_ext(spr_werewire_throwarrow, 0, 500, 400, 1, 1, 180 - (((combo + hold_score) / max_score) * 180), c_white, 1);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);
    draw_text_transformed(500, 400, total_score + hold_score, score_scale, score_scale, 0);
    if (score_scale > 2)
        score_scale = scr_movetowards(score_scale, 2, 0.2);
    if (note_streak > 0)
        draw_text_transformed(320, 400, string(note_streak), 2, 2, 0);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    draw_rectangle((camerax() + 640) - 25, (cameray() + 480) - 25, (camerax() + 640) - 15, (cameray() + 480) - 15, false);
    draw_rectangle((camerax() + 640) - 25, cameray() + 15, (camerax() + 640) - 15, cameray() + 25, false);
    draw_rectangle((camerax() + 640) - 22, cameray() + 20, (camerax() + 640) - 18, (cameray() + 480) - 20, false);
    if (rem_pos > 0)
        draw_sprite_ext(spr_sneo_bullet_arrow, 0, (camerax() + 640) - 38, lerp((cameray() + 480) - 21, cameray() + 19, rem_pos / track_length), 1, 1, 0, _remcolor, 1);
    var _walk_sprite = 4778;
    if (instrument == 1)
        _walk_sprite = 486;
    else if (instrument == 2)
        _walk_sprite = 2318;
    gpu_set_fog(true, c_black, 0, 1);
    draw_sprite(_walk_sprite, trackpos / notespacing, (camerax() + 640) - 28, lerp((cameray() + 480) - 28, cameray() + 12, trackpos / track_length) - 1);
    draw_sprite(_walk_sprite, trackpos / notespacing, (camerax() + 640) - 28, lerp((cameray() + 480) - 28, cameray() + 12, trackpos / track_length) + 1);
    gpu_set_fog(false, c_black, 0, 0);
    draw_sprite(_walk_sprite, trackpos / notespacing, (camerax() + 640) - 28, lerp((cameray() + 480) - 28, cameray() + 12, trackpos / track_length));
    if (savecon != 0 || changesmade)
    {
        var _savestring = "";
        if (savecon == 1)
        {
            if (has_file && load_source == 2)
                _savestring = string_hash_to_newline("Do you want to save this track?#This will OVERWRITE current save file#Z: I want this, X: Do not");
            else
                _savestring = string_hash_to_newline("Do you want to save this track?#Unsaved changes will be saved#Z: I want this, X: Do not");
        }
        else if (savecon == 2)
        {
            _savestring = string_hash_to_newline("Track has been saved.##Z/X: Cool");
        }
        else if (savecon == -1)
        {
            _savestring = string_hash_to_newline("What do you want to load?#Unsaved changes will vanish forever.#1/Z: Manual Save, 2: Auto-Save#3: Exported chart, 4/X: Nevermind");
        }
        else if (savecon == -2)
        {
            _savestring = string_hash_to_newline("Track has been loaded.##Z/X: Cool");
        }
        else if (changesmade)
        {
            _savestring = "You have unsaved changes!";
        }
        draw_text(camerax() + 10, (cameray() + 480) - 200, _savestring);
    }
    if (paused)
    {
        draw_sprite(spr_poppup_mouse, 0, mouse_x, mouse_y);
        if (mouse_x >= 250 && mouse_x <= 380)
        {
            var _prec = keyboard_check(vk_lalt) ? 3 : 4;
            if (keyboard_check(vk_ralt))
                _prec *= 2;
            var _mouse_pos = scr_round_to_beat(trackpos + ((bottomy - mouse_y) / _notespeed), bpm, _prec);
            var _mouse_height = bottomy - ((_mouse_pos - trackpos) * _notespeed);
            var _mouse_side = (mouse_x < 320) ? 0 : 1;
            if (instrument == 2)
            {
                if (mouse_x > 335)
                    _mouse_side = 2;
                else if (mouse_x > 305)
                    _mouse_side = 1;
                else
                    _mouse_side = 0;
            }
            else if (instrument == 1 && keyboard_check(vk_lshift))
            {
                _mouse_side = 2;
            }
            var _highlighted_note = collision_point(mouse_x, mouse_y, obj_rhythmgame_editor_note_node, false, true);
            var _lastmouse = mousecon;
            if (mouse_button == mb_left)
                mousecon = 1;
            else if (mouse_button == mb_right)
                mousecon = 2;
            else
                mousecon = 0;
            if (mousecon == 1 && _lastmouse == 0)
            {
                if (_highlighted_note != -4)
                {
                    notemod_index = _highlighted_note.noteindex;
                    if (keyboard_check(vk_lshift) && instrument != 1)
                    {
                        noteeditmode = 2;
                    }
                    else if (keyboard_check(vk_lcontrol))
                    {
                        scr_rhythmgame_editor_note_anim(notemod_index);
                        noteeditmode = 3;
                    }
                    else
                    {
                        noteeditmode = 1;
                    }
                }
            }
            if (mousecon == 1 && noteeditmode == 2)
            {
                var _notetype = notetype[notemod_index];
                var notey = (bottomy - (notetime[notemod_index] * _notespeed)) + (trackpos * _notespeed);
                var notelength = (_mouse_pos - notetime[notemod_index]) * _notespeed;
                var _longx = _xstart;
                if (instrument == 2)
                    _longx -= 5;
                draw_rectangle(_longx + (_notetype * _xwidth) + 12, notey - notelength, _longx + (_notetype * _xwidth) + 18, notey, false);
            }
            if (_lastmouse == 1 && mousecon == 0)
            {
                if (noteeditmode == 1)
                {
                    if (notetime[notemod_index] != _mouse_pos || notetype[notemod_index] != _mouse_side)
                    {
                        scr_rhythmgame_editor_move_note(notemod_index, _mouse_pos, _mouse_side, noteend[notemod_index]);
                        changesmade = true;
                    }
                }
                else if (noteeditmode == 2)
                {
                    var _endtime = 0;
                    if (_mouse_pos > notetime[notemod_index])
                        _endtime = _mouse_pos;
                    if (_endtime != noteend[notemod_index])
                    {
                        scr_rhythmgame_editor_record_undo(notemod_index);
                        changesmade = true;
                        noteend[notemod_index] = _endtime;
                        scr_rhythmgame_editor_refresh();
                    }
                }
                else if (noteeditmode == 3)
                {
                    mousecon = 0;
                }
                else
                {
                    mousecon = 0;
                    newnote_time = _mouse_pos;
                    newnote_type = _mouse_side;
                    if (instrument == 2)
                        scr_rhythmgame_editor_insert_note(_mouse_pos, _mouse_side, _mouse_pos + (meter / 16));
                    else
                        scr_rhythmgame_editor_insert_note(_mouse_pos, _mouse_side);
                }
                notemod_index = -1;
                noteeditmode = 0;
            }
            if (_lastmouse == 2)
            {
                if (_highlighted_note != -4)
                {
                    _highlighted_note.active = false;
                    scr_rhythmgame_editor_delete_note(_highlighted_note.noteindex);
                }
            }
            var _outline = (mousecon == 0) ? 1 : 0;
            var _xoff = _mouse_side * _xwidth;
            var _rx = _xwidth - 10;
            if (noteeditmode == 1)
            {
                var _note_height = bottomy - ((notetime[notemod_index] - trackpos) * _notespeed);
                var _note_xoff = notetype[notemod_index] * _xwidth;
                draw_set_color(c_yellow);
                draw_rectangle((_xstart + _note_xoff) - 2, _note_height - 5, _xstart + _rx + _note_xoff + 2, _note_height + 5, false);
                draw_set_color(c_gray);
                draw_rectangle(_xstart + _note_xoff, _note_height - 3, _xstart + _rx + _note_xoff, _note_height + 3, false);
            }
            else if (_highlighted_note != -4)
            {
                draw_set_color(c_yellow);
                draw_rectangle(_xstart + _xoff, _mouse_height - 3, _xstart + _rx + _xoff, _mouse_height + 3, false);
            }
            draw_set_color(c_red);
            draw_rectangle(_xstart + _xoff, _mouse_height - 3, _xstart + _rx + _xoff, _mouse_height + 3, _outline);
        }
        else if (mousecon == 1 && mouse_button != mb_left)
        {
            mousecon = 0;
        }
        draw_text(camerax() + 20, (cameray() + 480) - 60, "scrollcon = " + string(scrollcon));
        draw_sprite(spr_sneo_playback, 1, camerax() + 40, (cameray() + 480) - 40);
    }
    draw_set_halign(fa_right);
    var _message;
    if (tooltips)
        _message = string_hash_to_newline("LMB: Write#RMB: Erase#Shift+LMB on existing note: Extend#Alt: Snap to thirds#Space/P: Pause/Play#-/+ (=): Zoom in/out#W/E: Disable/Enable guitar stem#T: Refresh notes#V: Set playback start#B: Toggle playback start#N: Return to playback start#Backspace: Clear note memory#Q: Autoplay#U: Save#I: Load#Tab: Hide tooltips");
    else
        _message = string_hash_to_newline("Tab: Show tooltips");
    draw_text((camerax() + 640) - 40, cameray() + 20, _message);
    draw_set_halign(fa_left);
}
