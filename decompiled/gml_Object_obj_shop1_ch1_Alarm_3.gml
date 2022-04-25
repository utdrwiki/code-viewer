if (global.flag[7] == 0)
    snd_free_all_ch1()
global.facing = 0
instance_create_ch1(0, 0, obj_persistentfadein_ch1)
room_goto(room_field_shop1_ch1)
