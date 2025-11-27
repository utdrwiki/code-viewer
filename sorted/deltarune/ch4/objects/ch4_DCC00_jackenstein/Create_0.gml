_is_init = false;
image_speed = 0;
image_was = 0;
scr_darksize(id);
current_mode = 0;
current_state = 0;
dust_timer = 0;
dust_counter = 0;
dust = -4;
climb_speed = 1;
fixed_x_pos = 210;
glassrows = obj_dw_churchc_finalclimb.glassrows;
glassheights = obj_dw_churchc_finalclimb.glassheights;

dust_effect = function()
{
    dust_counter++;
    snd_play(snd_wing, 1, 1.2);
    snd_play(snd_glass_crunch, 0.4, 1.2);
    var x_offset = ((dust_counter % 2) == 1) ? 0 : 40;
    dust = instance_create(x + 100 + x_offset, y + 260, obj_slidedust);
    dust.depth = depth + 5;
    with (dust)
    {
        vspeed = -2;
        hspeed = -1 + random(2);
    }
};

crack_a_row = function()
{
    for (var i = 0; i < array_length(glassheights); i++)
    {
        var _top = glassheights[i];
        var _bot = glassheights[i] + 164;
        var _hand = bbox_top + 40;
        var _foot = bbox_bottom - 120;
        if ((_hand > _top && _hand < _bot) || (_foot > _top && _foot < _bot))
        {
            with (obj_dw_churchc_finalclimb)
            {
                glass_row_crack(i);
                if (i > 8)
                    glass_row_shake([i, 3]);
                else
                    glass_row_shake([i, 1]);
            }
        }
    }
};

start_climbing = function()
{
    change_mode(1);
};

stop_climbing = function()
{
    change_mode(0);
};

start_slipping = function()
{
    change_mode(2);
};

start_falling = function()
{
    change_mode(3);
};

change_mode = function(arg0)
{
    if (current_mode == arg0)
        exit;
    exit_mode(arg0);
};

enter_mode = function(arg0)
{
    switch (arg0)
    {
        case 0:
            change_state(0);
            break;
        case 1:
            break;
        case 2:
            change_state(0);
            vspeed = 10;
            scr_lerpvar("friction", 0, 1, 12, "out");
            scr_shakeobj();
            break;
        case 3:
            gravity = 2;
            break;
    }
    current_mode = arg0;
};

exit_mode = function(arg0)
{
    switch (current_mode)
    {
        case 0:
            break;
        case 1:
            break;
        case 2:
            break;
    }
    enter_mode(arg0);
};

change_state = function(arg0)
{
    if (current_state == arg0)
        exit;
    exit_state(arg0);
};

enter_state = function(arg0)
{
    switch (arg0)
    {
        case 0:
            image_speed = 0;
            break;
        case 1:
            image_speed = 0.2 * climb_speed;
            break;
    }
    current_state = arg0;
};

exit_state = function(arg0)
{
    switch (current_state)
    {
        case 0:
            break;
        case 1:
            image_speed = 0;
            break;
    }
    enter_state(arg0);
};
