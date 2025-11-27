snd_free_all();
global.currentsong[0] = snd_init("annoying_prophecy.ogg");
global.currentsong[1] = mus_loop(global.currentsong[0]);
_prophecy = instance_create(camerax() + 160, cameray() + 120, obj_dw_church_prophecy);
_prophecy.extflag = "uz";
_prophecy.active = true;
