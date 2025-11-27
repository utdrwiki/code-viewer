_spawn = -4;
_siner_active = false;
_siner = 0;
_timer = 0;
sprite_index = spr_darkshape;
image_speed = 0;
image_index = 5;
image_xscale = 2;
image_yscale = 2;
image_alpha = 0;

fade_in = function()
{
    _siner_active = true;
    snd_stop(snd_tspawn);
    snd_play_x(snd_tspawn, 1, random_range(0.7, 0.9));
    event_user(10);
    scr_script_delayed(event_user, 15, 11);
};

fade_out = function()
{
    scr_lerpvar("image_alpha", 1, 0, 30, 2, "out");
};
