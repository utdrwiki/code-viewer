visible = false;
_colliders = [];
_stanchions = [];

init = function()
{
    switch (facing)
    {
        case "down":
            var _max_amount = round(image_xscale / 2);
            var _collider = instance_create(x + 4, y - 10, obj_solidblocksized);
            _collider.image_xscale = (image_xscale / 2) - 0.25;
            _collider.image_yscale = 0.15;
            _colliders[array_length(_colliders)] = _collider;
            for (var i = 0; i < _max_amount; i++)
            {
                var _stanchion = instance_create(x + (i * 40), y - 4, obj_dw_ch3_funny_stanchion);
                with (_stanchion)
                    scr_depth_alt();
                _stanchion.image_xscale = 2;
                _stanchion.image_yscale = 2;
                _stanchions[array_length(_stanchions)] = _stanchion;
                var _pos = "center";
                if (i == 0)
                    _pos = "left";
                else if (i == (_max_amount - 1))
                    _pos = "right";
                with (_stanchion)
                    set_pos(_pos);
            }
            break;
        case "up":
            var _max_amount = round(image_xscale / 2);
            var _collider = instance_create(x + 4, (y - 20) + 4, obj_solidblocksized);
            _collider.image_xscale = (image_xscale / 2) - 0.25;
            _collider.image_yscale = 0.15;
            _colliders[array_length(_colliders)] = _collider;
            for (var i = 0; i < _max_amount; i++)
            {
                var _stanchion = scr_dark_marker(x + (i * 40), y - 10, spr_dw_teevie_funny_stanchion_back);
                with (_stanchion)
                    scr_depth_alt();
                _stanchion.image_xscale = 2;
                _stanchion.image_yscale = 2;
                _stanchions[array_length(_stanchions)] = _stanchion;
                if (i == 0)
                    _stanchion.sprite_index = spr_dw_teevie_funny_stanchion_back_left;
                else if (i == (_max_amount - 1))
                    _stanchion.sprite_index = spr_dw_teevie_funny_stanchion_back_right;
            }
            break;
        case "right":
            var _max_amount = image_yscale / 2;
            var _collider = instance_create(x + 14, y - (40 * _max_amount) - 40, obj_solidblocksized);
            _collider.image_xscale = 0.25;
            _collider.image_yscale = (image_yscale / 2) + 1;
            _colliders[array_length(_colliders)] = _collider;
            for (var i = 0; i < _max_amount; i++)
            {
                var _stanchion = scr_dark_marker(x, y - (i * sprite_get_height(spr_dw_teevie_funny_stanchion_right_dir) * 2) - 4, spr_dw_teevie_funny_stanchion_right_dir);
                with (_stanchion)
                    scr_depth_alt();
                _stanchion.image_xscale = 2;
                _stanchion.image_yscale = 2;
                _stanchions[array_length(_stanchions)] = _stanchion;
            }
            break;
        case "left":
            var _max_amount = image_yscale / 2;
            var _collider = instance_create(x + 14, y - (40 * _max_amount) - 20, obj_solidblocksized);
            _collider.image_xscale = 0.25;
            _collider.image_yscale = (image_yscale / 2) + 1;
            _colliders[array_length(_colliders)] = _collider;
            for (var i = 0; i < _max_amount; i++)
            {
                var _stanchion = scr_dark_marker(x, y - (i * sprite_get_height(spr_dw_teevie_funny_stanchion_left_dir) * 2), spr_dw_teevie_funny_stanchion_left_dir);
                with (_stanchion)
                    scr_depth_alt();
                _stanchion.image_xscale = 2;
                _stanchion.image_yscale = 2;
                _stanchions[array_length(_stanchions)] = _stanchion;
            }
            break;
    }
};

init();

clean_up = function()
{
    var i = array_length(_stanchions) - 1;
    while (i >= 0)
    {
        with (_stanchions[i])
            instance_destroy();
        i--;
    }
    i = array_length(_colliders) - 1;
    while (i >= 0)
    {
        with (_colliders[i])
            instance_destroy();
        i--;
    }
};

if (global.flag[1661] == 0)
    clean_up();
