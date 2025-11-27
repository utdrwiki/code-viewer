gamestart = false;
gameover = false;
timer = 22;
timer_max = timer;

start_game = function()
{
    alarm[0] = 30;
    with (instance_create(0, -16, obj_ch3_b4_chef_spawner))
        alarm[0] = 5;
};
