event_inherited();
is_active = false;
con = 0;
timer = 0;
is_looping = true;
loop_timer = 0;
santa_pitch = 1;
audio_file = (santa_type == 0) ? 140 : 11;
play_time = (santa_type == 0) ? 40 : 60;
depth = 94879;
if (!i_ex(obj_homealone_heart))
    instance_create(x + 4, y + 20, obj_readable_room1);
