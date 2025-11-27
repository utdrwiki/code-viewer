snd_free_all();
global.currentsong[0] = snd_init("ch3_board3.ogg");
global.currentsong[1] = mus_loop(global.currentsong[0]);
var _dog = scr_marker(camerax() + (view_wport[0] / 4), cameray() + (view_hport[0] / 4), spr_dog_board);
with (_dog)
{
    image_speed = 0.1;
    image_xscale = 4;
    image_yscale = 4;
}
