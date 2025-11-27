musicm = 0;
if (!i_ex(obj_music_event_manager))
    musicm = instance_create(x, y, obj_music_event_manager);
else
    musicm = obj_music_event_manager;
musicm.beat_offset += musicm.bpm / 2;
init = 0;
scr_music_event_add(25, "tori_col_a", 16776960, true, 1);
scr_music_event_add(26, "tori_col_b", 255, true, 1);
scr_music_event_add(27, "tori_col_a", 65535, true, 1);
scr_music_event_add(28, "tori_col_b", 16711935, true, 1);
scr_music_event_add(30, "tori_col_a", 16777215, true, 1);
scr_music_event_add(31, "tori_col_b", 16777215, true, 1);
left_beat = 0;
right_beat = 0;
lastbeat = 0;
tori_col_a = 16777215;
tori_col_b = 16777215;
scr_music_beat_userevent(0, true);
