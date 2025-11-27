image_speed = 0.5;
active = false;
size = 2;
damage = 90;
prime_speed = 4;
max_speed = 5;
acc = 20;
r = 1;
g = 1;
b = 1;

prime_me = function()
{
    with (obj_lerpvar)
    {
        if (target == other.id)
            instance_destroy();
    }
    var size_to = 0.6;
    if (size == 1)
        size_to = 0.4;
    if (size == 3)
        size_to = 0.8;
    if (size == 0)
        size_to = 0;
    scr_lerpvar("image_xscale", image_xscale, size_to, 20);
    scr_lerpvar("image_yscale", image_yscale, size_to, 20);
    if (size == 0)
    {
        scr_script_delayed(instance_destroy, 20);
    }
    else
    {
        scr_lerpvar("r", r, 1, 20);
        scr_lerpvar("g", g, 1, 20);
        scr_lerpvar("b", b, 0, 20);
        scr_var_delayed("active", true, 20);
    }
    direction = scr_at_player(x, y) + 180;
    speed = prime_speed;
};

partially_prime = function()
{
    scr_lerpvar("image_xscale", image_xscale, 1, 20);
    scr_lerpvar("image_yscale", image_yscale, 1, 20);
    scr_lerpvar("r", r, 0.5, 20);
    scr_lerpvar("g", g, 0.5, 20);
    scr_lerpvar("b", b, 0.5, 20);
};
