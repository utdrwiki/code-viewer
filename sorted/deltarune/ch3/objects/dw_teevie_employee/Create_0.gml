employee_type = "";
unhappy_sprite = -4;
shock_sprite = -4;
joy_sprite = -4;

init = function(arg0)
{
    employee_type = arg0;
    switch (employee_type)
    {
        case "shadowman":
            unhappy_sprite = 1477;
            shock_sprite = 2628;
            joy_sprite = 4868;
            break;
        case "pippins":
            unhappy_sprite = 2283;
            shock_sprite = 1538;
            joy_sprite = 1931;
            break;
        default:
            unhappy_sprite = 2822;
            shock_sprite = 4115;
            joy_sprite = 1514;
            break;
    }
    image_xscale = 2;
    image_yscale = 2;
    scr_depth();
};

stop_anim = function()
{
    image_speed = 0;
    image_index = 0;
};

shock = function()
{
    stop_anim();
    sprite_index = shock_sprite;
    if (employee_type == "pippins")
        image_index = irandom(5);
    scr_shakeobj();
};

joy = function()
{
    sprite_index = joy_sprite;
    image_speed = 0.2;
    if (employee_type == "zapper")
        image_speed = 0.8;
    scr_shakeobj();
};

unhappy = function()
{
    stop_anim();
    sprite_index = unhappy_sprite;
};

set_custom_sprite = function(arg0)
{
    stop_anim();
    sprite_index = arg0;
};
