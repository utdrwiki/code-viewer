depth = 100000;
screen_alpha = 1;
screenwidth = view_wport[0] * 2;
screenheight = view_hport[0];
crttimer = 0;
crt_glitch = 0;
chromStrength = 0.5;
star_anim = 0;
star_anim_speed = 0.5;
bg_speed = 1;
bg_speed_y = 1;
bg_speed_max = 3;
bg_speed_y_max = 3;
screen_anim = 0;
screen_anim_speed = 0.2;
con = 0;
target_scale = 2;
screen_scale = 2;
logo_pos_y = 40;
target_logo_pos_y = 40;
tutorial_active = false;
stove_anim = 0;
_x_pos = 110;
_y_pos = cameray();
_x_width = 420;
_y_height = 200;
_progress = 1;
countdown = false;
countdown_timer = 0;
countdown_finished = false;
countdown_text = 3;

start_countdown = function()
{
    countdown = true;
};

set_progress = function(arg0)
{
    _progress = arg0;
};
