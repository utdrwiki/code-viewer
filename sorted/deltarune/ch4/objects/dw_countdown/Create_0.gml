countdown = false;
countdown_timer = 0;
countdown_text = 3;
orchhit_pitch = 1;
target_room = -4;
is_init = false;

init = function(arg0)
{
    target_room = arg0;
    is_init = true;
};

start_countdown = function()
{
    countdown = true;
    snd_play_pitch(snd_orchhit, 1);
};
