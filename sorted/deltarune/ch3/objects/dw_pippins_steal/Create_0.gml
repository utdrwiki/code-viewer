pippins_marker = -4;
pippins_x = 0;
pippins_y = 0;
timer = 0;
steal = false;
steal_timer = 0;
is_stolen = false;
is_init = false;
block = -4;

init = function(arg0)
{
    var prize_sprite = scr_84_get_sprite("spr_dw_tv_prize_car");
    var prize_marker_index = 0;
    var prize_x_offset = 0;
    var prize_y_offset = 0;
    var prize_scale = 1;
    switch (arg0)
    {
        case "car":
            prize_x_offset = -170;
            prize_y_offset = 40;
            pippins_y = 90;
            break;
        case "yak":
            prize_x_offset = -280;
            prize_sprite = 4692;
            pippins_x = -170;
            pippins_y = 100;
            break;
        case "sink":
            prize_sprite = 3540;
            prize_x_offset = -200;
            prize_y_offset = 60;
            pippins_x = -120;
            pippins_y = 70;
            break;
        case "curtain":
            prize_sprite = 4360;
            prize_x_offset = -140;
            pippins_x = 20;
            pippins_y = 100;
            break;
        case "gum":
            prize_sprite = 2011;
            pippins_x = 90;
            pippins_y = 100;
            break;
        default:
            prize_sprite = 755;
            prize_marker_index = 1;
            prize_scale = 4;
            pippins_x = 40;
            pippins_y = 20;
            block = instance_create(x, y, obj_solidblocksized);
            with (block)
            {
                image_xscale = 2;
                image_yscale = 2;
            }
            break;
    }
    prize_marker = scr_marker(x, y, prize_sprite);
    prize_marker.image_index = prize_marker_index;
    prize_marker.image_xscale = prize_scale;
    prize_marker.image_yscale = prize_scale;
    prize_marker.x += prize_x_offset;
    prize_marker.y += prize_y_offset;
    is_init = true;
};

set_depth = function(arg0)
{
    prize_marker.depth = arg0;
};

start_stealing = function()
{
    if (!is_stolen)
    {
        is_stolen = true;
        steal = true;
    }
};

clean_up = function()
{
    if (steal)
        exit;
    if (!is_stolen)
    {
        if (y > 40)
        {
            var _treasure_marker = scr_dark_marker(x, y, spr_treasurebox);
            _treasure_marker.depth = prize_marker.depth;
            _treasure_marker.image_index = 1;
            _treasure_marker.image_xscale = 4;
            _treasure_marker.image_yscale = 4;
        }
    }
    else
    {
        with (block)
            instance_destroy();
    }
    with (prize_marker)
        instance_destroy();
    with (pippins_marker)
        instance_destroy();
    instance_destroy();
};
