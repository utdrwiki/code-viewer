visible = false;

init = function()
{
    var _max_amount = round(image_xscale / 2);
    if (front_facing)
    {
        var _collider = instance_create(x + 4, y - 10, obj_solidblocksized);
        _collider.image_xscale = (image_xscale / 2) - 0.25;
        _collider.image_yscale = 0.15;
        for (var i = 0; i < _max_amount; i++)
        {
            var _stanchion = instance_create(x + (i * 40), y - 4, obj_dw_ch3_funny_stanchion);
            with (_stanchion)
                scr_depth_alt();
            _stanchion.image_xscale = 2;
            _stanchion.image_yscale = 2;
            var _pos = "center";
            if (i == 0)
                _pos = "left";
            else if (i == (_max_amount - 1))
                _pos = "right";
            with (_stanchion)
                set_pos(_pos);
        }
    }
    else
    {
        var _collider = instance_create(x + 4, (y - 20) + 4, obj_solidblocksized);
        _collider.image_xscale = (image_xscale / 2) - 0.25;
        _collider.image_yscale = 0.15;
        for (var i = 0; i < _max_amount; i++)
        {
            var _stanchion = scr_dark_marker(x + (i * 40), y - 10, spr_dw_teevie_funny_stanchion_back);
            with (_stanchion)
                scr_depth_alt();
            _stanchion.image_xscale = 2;
            _stanchion.image_yscale = 2;
            if (i == 0)
                _stanchion.sprite_index = spr_dw_teevie_funny_stanchion_back_left;
            else if (i == (_max_amount - 1))
                _stanchion.sprite_index = spr_dw_teevie_funny_stanchion_back_right;
        }
    }
};

init();
