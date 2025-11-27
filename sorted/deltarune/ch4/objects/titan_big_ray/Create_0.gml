ray_angle = 0;
goal = 0;
siner = 0;
length = 0;
distance = 1280 + irandom(240);
ray_width = 16 + irandom(256);

start = function(arg0)
{
    ray_angle = 180 + ((90 + irandom(270)) * choose(-1, 1));
    goal = ray_angle + irandom_range(-360, 360);
    siner = 0;
    length = 0;
    scr_lerpvar("ray_angle", ray_angle, goal, arg0, 2, "out");
    scr_lerpvar("siner", 0, pi, arg0, 2, "out");
    scr_lerpvar("length", 1, 1, arg0, 2, "out");
    scr_script_delayed(instance_destroy, arg0);
};

my_surface = -1;
