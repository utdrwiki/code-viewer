image_speed = 0;
mode = 0;
heart = 0;
walktimer = 0;
haswalked = 0;
walktimer = 30;
walkthreshold = 30;
walkcon = 0;
hearthits = 0;
global.lhp = 20;
temp_mode = 0;
notice_timer = 0;
notice = false;
notice_mode = false;
cringe = false;
cringe_mode = false;
tired_mode = false;
is_tired = false;
attack_number = 0;
attackcon = 0;
attacktimer = 0;
attackjump = 0;
attacktargetx = 0;
attacktired = 0;
attackhit = 0;
activeSantaX = 0;
santax[0] = 0;
santay[0] = 0;
santaactive[0] = 0;
santax[1] = 0;
santay[1] = 0;
santaactive[1] = 0;
santawalk = 0;
y = 86;
push_timer = 0;
push_velocity = 0;
kris_ready = 0;
animate_timer = 0;
pickup_stick = false;
stick_marker = scr_marker(170, 117, spr_noellehouse_dess_hockey_stick);
stick_marker.depth = 45000;
stick_marker.image_angle = 90;
hearttargetx = 0;

reset = function()
{
    global.interact = 0;
    attacktimer = 0;
    mode = 0;
    walkcon = 0;
    attackcon = 0;
    friction = 0;
    gravity = 0;
    speed = 0;
    if (attacktired < 10)
        attacktired++;
    attackhit = 0;
    walktimer = walkthreshold;
    image_index = 0;
    image_speed = 0;
};

clean_up = function()
{
    with (stick_marker)
        instance_destroy();
    instance_destroy();
};
