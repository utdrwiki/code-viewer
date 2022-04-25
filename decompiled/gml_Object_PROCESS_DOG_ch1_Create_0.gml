global.currentroom = room
visible = true
image_xscale = 2
image_yscale = 2
x = (room_width / 2)
y = (room_height / 2)
SONG_THAT_EMERGES_FROM_A_SLEEPING_DOG = snd_init_ch1("dogcheck.ogg")
mus_loop_ext_ch1(SONG_THAT_EMERGES_FROM_A_SLEEPING_DOG, 1, (0.9 + random(0.1)))
image_speed = 0.05
window_set_caption(scr_84_get_lang_string_ch1("PROCESS_DOG_slash_Create_0_gml_12_0"))
buffer = 0
start_timer = 0
restart_timer = 0
