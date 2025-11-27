drop_candy = false;
image_speed = 0.3;
scr_darksize();
scr_depth_board();
snd_stop(snd_board_kill);
snd_play(snd_board_kill);
with (obj_board_dungeon_2_jingle_controller)
    killcount++;
with (obj_board_dungeon_3_jingle_controller)
    killcount++;
active = true;
