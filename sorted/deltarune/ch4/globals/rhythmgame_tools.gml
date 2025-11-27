function scr_rhythmgame_editor_insert_note(arg0, arg1, arg2 = 0, arg3 = false, arg4 = 0)
{
    for (i = 0; i <= maxnote; i++)
    {
        if (i == maxnote || arg0 < notetime[i])
        {
            if (maxnote == 0)
            {
                notetime[0] = arg0;
                notetype[0] = arg1;
                noteend[0] = arg2;
                notealive[0] = 1;
                notescore[0] = 0;
                noteanim[0] = arg4;
            }
            else
            {
                array_insert(notetime, i, arg0);
                array_insert(notetype, i, arg1);
                array_insert(noteend, i, arg2);
                array_insert(notealive, i, 1);
                array_insert(notescore, i, 0);
                array_insert(noteanim, i, arg4);
            }
            maxnote++;
            changesmade = true;
            erasecon = true;
            if (!arg3)
            {
                scr_rhythmgame_editor_add_undo(1, i, arg0, arg1, arg2);
                scr_rhythmgame_editor_refresh();
            }
            return i;
        }
        if (arg0 == notetime[i] && arg1 != notetype[i] && instrument == 2)
        {
            if (!arg3)
            {
                scr_rhythmgame_editor_record_undo(i);
                scr_rhythmgame_editor_refresh();
            }
            notetype[i] = arg1;
            changesmade = true;
            return i;
        }
    }
}

function scr_rhythmgame_editor_delete_note(arg0, arg1 = false)
{
    if (!arg1)
        scr_rhythmgame_editor_add_undo(-1, arg0, notetime[arg0], notetype[arg0], noteend[arg0], noteanim[arg0]);
    array_delete(notetime, arg0, 1);
    array_delete(notetype, arg0, 1);
    array_delete(noteend, arg0, 1);
    array_delete(notescore, arg0, 1);
    array_delete(notealive, arg0, 1);
    array_delete(noteanim, arg0, 1);
    maxnote--;
    changesmade = true;
    if (!arg1)
        scr_rhythmgame_editor_refresh();
}

function scr_rhythmgame_editor_note_anim(arg0, arg1 = false)
{
    if (!arg1)
    {
        scr_rhythmgame_editor_record_undo(arg0);
        scr_rhythmgame_editor_refresh();
    }
    noteanim[arg0] = 1 - noteanim[arg0];
    changesmade = true;
}

function scr_rhythmgame_editor_move_note(arg0, arg1, arg2, arg3 = 0, arg4 = false)
{
    if (!arg4)
        scr_rhythmgame_editor_add_undo(-2, arg0, notetime[arg0], notetype[arg0], noteend[arg0], noteanim[arg0]);
    var _anim = noteanim[arg0];
    scr_rhythmgame_editor_delete_note(arg0, true);
    var __newIndex = scr_rhythmgame_editor_insert_note(arg1, arg2, arg3, true, _anim);
    if (!arg4)
    {
        scr_rhythmgame_editor_add_undo(2, __newIndex, arg1, arg2, arg3);
        scr_rhythmgame_editor_refresh();
    }
}

function scr_rhythmgame_editor_record_undo(arg0)
{
    scr_rhythmgame_editor_add_undo(0, arg0, notetime[arg0], notetype[arg0], noteend[arg0], noteanim[arg0]);
}

function scr_rhythmgame_editor_add_undo(arg0, arg1, arg2, arg3, arg4 = 0, arg5 = 0)
{
    undo_action[undo_queue] = arg0;
    undo_index[undo_queue] = arg1;
    undo_time[undo_queue] = arg2;
    undo_type[undo_queue] = arg3;
    undo_end[undo_queue] = arg4;
    undo_anim[undo_queue] = arg5;
    undo_queue++;
    undo_cap = undo_queue;
}

function scr_rhythmgame_editor_undo()
{
    if (undo_queue == 0)
    {
        scr_debug_print("No actions left to undo.");
        exit;
    }
    undo_queue--;
    var _action = undo_action[undo_queue];
    if (_action == -1)
    {
        scr_rhythmgame_editor_insert_note(undo_time[undo_queue], undo_type[undo_queue], undo_end[undo_queue], true, undo_anim[undo_queue]);
    }
    else if (_action == 1)
    {
        scr_rhythmgame_editor_delete_note(undo_index[undo_queue], true);
        scr_debug_print("Undid adding note.");
    }
    else if (_action == 2)
    {
        scr_rhythmgame_editor_move_note(undo_index[undo_queue], undo_time[undo_queue - 1], undo_type[undo_queue - 1], undo_end[undo_queue - 1], true, undo_anim[undo_queue - 1]);
        undo_queue--;
        scr_debug_print("Undid moving note.");
    }
    else if (_action == -2)
    {
        scr_debug_print("Undo started from the wrong end of a move action. Let Taxi know!");
    }
    else
    {
        scr_rhythmgame_editor_undo_swap();
    }
    scr_rhythmgame_editor_refresh();
}

function scr_rhythmgame_editor_undo_swap()
{
    var _index = undo_index[undo_queue];
    var _remtype = notetype[_index];
    var _remend = noteend[_index];
    var _remtime = notetime[_index];
    var _remanim = noteanim[_index];
    notetype[_index] = undo_type[undo_queue];
    noteend[_index] = undo_end[undo_queue];
    notetime[_index] = undo_time[undo_queue];
    noteanim[_index] = undo_anim[undo_queue];
    undo_type[undo_queue] = _remtype;
    undo_end[undo_queue] = _remend;
    undo_time[undo_queue] = _remtime;
    undo_anim[undo_queue] = _remanim;
    scr_rhythmgame_editor_refresh();
}

function scr_rhythmgame_editor_redo()
{
    if (undo_queue == undo_cap)
    {
        scr_debug_print("No actions left to redo.");
        exit;
    }
    var _action = undo_action[undo_queue];
    if (_action == 1)
    {
        scr_rhythmgame_editor_insert_note(undo_time[undo_queue], undo_type[undo_queue], undo_end[undo_queue], true, undo_anim[undo_queue]);
        scr_debug_print("Redid adding note.");
    }
    else if (_action == -1)
    {
        scr_rhythmgame_editor_delete_note(undo_index[undo_queue], true);
        scr_debug_print("Redid erasing note.");
    }
    else if (_action == -2)
    {
        scr_rhythmgame_editor_move_note(undo_index[undo_queue], undo_time[undo_queue + 1], undo_type[undo_queue + 1], undo_end[undo_queue + 1], true, undo_anim[undo_queue]);
        undo_queue++;
        scr_debug_print("Redid moving note.");
    }
    else if (_action == 2)
    {
        scr_debug_print("Redo started from wrong end a move action. Let Taxi know!");
    }
    else
    {
        scr_rhythmgame_editor_undo_swap();
    }
    scr_rhythmgame_editor_refresh();
    undo_queue++;
}

function scr_rhythmgame_editor_copy(arg0 = -1)
{
    var _clipstart = scr_floor_to_beat(trackpos + (meter * 0.125), bpm, 0.25) - (meter * 0.05);
    if (arg0 <= 0)
        arg0 = meter;
    var _clipend = _clipstart + arg0;
    var _notesfound = false;
    for (var _i = 0; _i < maxnote; _i++)
    {
        var _notetime = notetime[_i];
        if (_notetime >= _clipend)
            break;
        if (notetime[_i] >= _clipstart)
        {
            if (!_notesfound)
            {
                _notesfound = true;
                clip_size = 0;
                clip_time = [];
                clip_end = [];
                clip_type = [];
                clip_anim = [];
            }
            clip_time[clip_size] = _notetime - _clipstart;
            clip_type[clip_size] = notetype[_i];
            if (noteend[_i] > 0)
                clip_end[clip_size] = noteend[_i] - _clipstart;
            else
                clip_end[clip_size] = noteend[_i];
            clip_anim[clip_size] = noteanim[_i];
            clip_size++;
        }
    }
    if (_notesfound)
        debug_print(stringsetsub("copied ~1 notes to clipboard (~2 beats)", string(clip_size), string(round(arg0 / (meter / 4)))));
    else
        debug_print("nothing to copy.");
}

function scr_rhythmgame_editor_paste()
{
    if (clip_size == 0)
    {
        debug_print("Nothing to paste.");
    }
    else
    {
        var _pastestart = scr_floor_to_beat(trackpos + (meter * 0.125), bpm, 0.25) - (meter * 0.05);
        for (var _i = 0; _i < clip_size; _i++)
        {
            var _clip_end = clip_end[_i];
            if (_clip_end > 0)
                _clip_end += _pastestart;
            scr_rhythmgame_editor_insert_note(clip_time[_i] + _pastestart, clip_type[_i], _clip_end, false, clip_anim[_i]);
        }
        debug_print(stringsetsub("Pasted ~1 notes.", string(clip_size)));
        scr_rhythmgame_editor_refresh();
    }
}

function scr_rhythmgame_editor_refresh()
{
    with (obj_rhythmgame_editor_note_node)
        instance_destroy();
    if (paused)
        do_refresh = true;
}

function scr_rhythmgame_editor_note_refresh(arg0 = false)
{
    minnote = 0;
    var _starttime = arg0 ? 0 : trackpos;
    for (i = 0; i < maxnote; i++)
    {
        if (_starttime > notetime[i])
        {
            notealive[i] = false;
            minnote = i + 1;
        }
        else if (notealive[i] == true)
        {
            exit;
        }
        else
        {
            notescore[i] = 0;
            notealive[i] = true;
        }
    }
    scroll_init = 1;
}

function scr_rhythmgame_editor_save(arg0 = "music_timing.txt", arg1 = false)
{
    var _file = file_text_open_write(arg0);
    var _div = 0;
    for (i = 0; i < maxnote; i++)
    {
        if (instrument == 0 && song_id == 0 && _div < array_length(timestamp) && notetime[i] > timestamp[_div] && arg1)
        {
            if (_div == 0)
                file_text_write_string(_file, "\t//start of solo");
            else
                file_text_write_string(_file, "\t}");
            file_text_writeln(_file);
            if (_div != 3)
            {
                if (_div == 0)
                    file_text_write_string(_file, "\tif (argument0 == " + string(_div) + ")");
                else
                    file_text_write_string(_file, "\telse if (argument0 == " + string(_div) + ")");
                file_text_writeln(_file);
                file_text_write_string(_file, "\t{");
            }
            else
            {
                file_text_write_string(_file, "\t//start of finale");
            }
            file_text_writeln(_file);
            _div++;
        }
        var _string;
        if (noteend[i] > 0)
            _string = string(notetime[i]) + "," + string(notetype[i]) + "," + string(noteend[i]);
        else
            _string = string(notetime[i]) + "," + string(notetype[i]) + ",0";
        if (noteanim[i] > 0)
            _string += ("," + string(noteanim[i]));
        if (arg1)
        {
            if (_div == 4)
                file_text_write_string(_file, "\tscr_rhythmgame_addnote(" + _string + ");");
            else if (song_id == 2)
                file_text_write_string(_file, "\t\tscr_rhythmgame_addnote_range(" + _string + ");");
            else
                file_text_write_string(_file, "\t\tscr_rhythmgame_addnote(" + _string + ");");
        }
        else
        {
            file_text_write_string(_file, _string);
        }
        file_text_writeln(_file);
    }
    file_text_close(_file);
    changesmade = false;
}

function scr_rhythmgame_load(arg0 = "lead")
{
    scr_rhythmgame_notechart_lead();
    if (savecon == -1)
        savecon = -2;
}

function scr_rhythmgame_clear_notes(arg0 = true)
{
    maxnote = 0;
    notetime = [];
    notetype = [];
    noteend = [];
    notealive = [];
    notescore = [];
    noteanim = [];
    if (arg0)
    {
        undo_action = [];
        undo_index = [];
        undo_time = [];
        undo_type = [];
        undo_end = [];
        undo_anim = [];
        undo_queue = 0;
        undo_cap = 0;
    }
}

function scr_rhythmgame_editor_load(arg0 = "music_timing.txt")
{
    file = file_text_open_read(arg0);
    while (!file_text_eof(file))
    {
        var line = file_text_read_string(file);
        var l_arg = gml_std_string_split(line, ",");
        if (array_length(l_arg) >= 4)
            scr_rhythmgame_addnote(real(l_arg[0]), real(l_arg[1]), real(l_arg[2]), real(l_arg[3]));
        else if (array_length(l_arg) >= 3)
            scr_rhythmgame_addnote(real(l_arg[0]), real(l_arg[1]), real(l_arg[2]));
        file_text_readln(file);
    }
    file_text_close(file);
    changesmade = false;
    if (savecon == -1)
        savecon = -2;
}

function scr_rhythmgame_editor_trail_add(arg0, arg1)
{
    if (rec_count == rec_max)
    {
        array_delete(rec_time, 0, 1);
        array_delete(rec_type, 0, 1);
        array_delete(rec_endtime, 0, 1);
        rec_count--;
    }
    rec_time[rec_count] = arg0;
    rec_type[rec_count] = arg1;
    rec_endtime[rec_count] = 0;
    rec_count++;
}
