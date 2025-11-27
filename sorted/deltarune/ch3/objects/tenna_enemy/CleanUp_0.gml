snd_stop(snd_tv_static);
with (obj_tenna_enemy_bg)
    instance_destroy();
with (obj_darkener)
    instance_destroy();
with (obj_tenna_minigame_ui)
    instance_destroy();
with (tenna_actor)
    instance_destroy();
scr_act_charsprite_end();
global.flag[7] = 0;
room_speed = 30;
