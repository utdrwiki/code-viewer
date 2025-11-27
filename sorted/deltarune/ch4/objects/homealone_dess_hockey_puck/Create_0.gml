t = 0;
g = 0;
image_speed = 0;
loop = false;
throw_choco = false;
is_thrown = false;
base_alpha = 1;
depth = 80000;
bounce = false;
bounce_timer = 0;
bounce_bottle = -4;
bounce_xpos = 0;
bounce_ypos = 0;

create_puck = function(arg0, arg1, arg2)
{
    bounce_xpos = arg0;
    bounce_ypos = arg1;
    bounce_bottle = scr_marker(bounce_xpos, bounce_ypos, sprite_index);
    bounce_bottle.depth = arg2 - 1;
};

clean_up = function()
{
    with (bounce_bottle)
        scr_depth();
    var readable = instance_create(bounce_bottle.x - 2, bounce_bottle.y + 2, obj_readable_room1);
    with (readable)
    {
        extflag = "hockey_puck";
        image_xscale = 0.5;
        image_yscale = 0.5;
    }
    instance_destroy();
};
