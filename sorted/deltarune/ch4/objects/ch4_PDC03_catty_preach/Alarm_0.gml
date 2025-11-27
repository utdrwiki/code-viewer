speech_alpha = 1;
scr_lerpvar_instance(id, "speech_xscale", 0, 0.5, speech_time * 0.25);
scr_lerpvar_instance(id, "speech_yscale", 0, 0.5, speech_time * 0.25);
scr_lerpvar_instance(id, "speech_ypos", 240, 280, speech_time * 0.25);
alarm[1] = speech_time * 0.75;
