con = (scr_flag_get(1161) == 0) ? 0 : -1;
customcon = 0;
pippins_list = [];
pippins_runaway = false;
pippins_runaway_timer = 0;
car_steal = false;
car_steal_timer = 0;
pippins_marker = -4;
noskip = false;
scr_setparty(1, 1, 0);
var _bg = instance_create(0, 0, obj_dw_tv_starbgtile);
_bg.depth = 1000020;
var _word_fx = instance_create(0, 0, obj_dw_teevie_bonus_word_fx);
with (_word_fx)
    init();
var _coin_flags = [1157, 1158, 1159, 1160];
var coins = [];
coins[0] = instance_create(100, 230, obj_dw_points_coin);
with (coins[0])
    init(1, _coin_flags[0]);
coins[1] = instance_create(140, 190, obj_dw_points_coin);
with (coins[1])
    init(1, _coin_flags[1]);
coins[2] = instance_create(280, 250, obj_dw_points_coin);
with (coins[2])
    init(1, _coin_flags[2]);
coins[3] = instance_create(360, 220, obj_dw_points_coin);
with (coins[3])
    init(1, _coin_flags[3]);
prize_ids = ["yak", "sink", "curtain", "car", "gum"];
prize_list = [];
special_prize_list = [];
prize_index = 0;
prize_car = -4;
current_prize = -4;
steal_sequence = false;
steal_sequence_timer = 0;
steal_con = 0;
steal_index = 4;
var _treasure = instance_create(240, 170, obj_dw_treasure_points);
with (_treasure)
    init(1154);
_treasure = instance_create(320, 170, obj_dw_treasure_points);
with (_treasure)
    init(1155);
_treasure = instance_create(446, 170, obj_dw_treasure_points);
with (_treasure)
    init(1156);
_empty_treasures = [];
_empty_blocks = [];
for (var i = 0; i < 13; i++)
{
    var _offset = ((i % 2) == 1) ? 0 : -20;
    if ((i % 3) == 1)
    {
        var _prize = instance_create(490 + (i * 80), 100 + _offset, obj_dw_pippins_steal);
        with (_prize)
            init();
        prize_list[array_length_1d(prize_list)] = _prize;
        _prize.set_depth(100000 - _offset);
    }
    else
    {
        _treasure = scr_dark_marker(490 + (i * 80), 100 + _offset, spr_treasurebox);
        with (_treasure)
        {
            image_xscale = 4;
            image_yscale = 4;
            image_index = 1;
            depth = 100000 - _offset;
        }
        var _block = instance_create(_treasure.x, _treasure.y, obj_solidblocksized);
        with (_block)
        {
            image_xscale = 2;
            image_yscale = 2;
        }
        _empty_treasures[array_length(_empty_treasures)] = _treasure;
        _empty_blocks[array_length(_empty_blocks)] = _block;
    }
}
if (scr_flag_get(1161) == 0)
{
    for (var i = 0; i < array_length_1d(prize_ids); i++)
    {
        var _y_offset = ((i % 2) == 1) ? -10 : -30;
        var _prize = instance_create(740 + (i * 160), _y_offset, obj_dw_pippins_steal);
        var _prize_id = prize_ids[i];
        with (_prize)
            init(_prize_id);
        special_prize_list[array_length_1d(special_prize_list)] = _prize;
        if (_prize_id == "car")
            prize_car = _prize;
        with (_prize)
            set_depth(99000 + (i * 2));
    }
}
for (var i = 0; i < 18; i++)
{
    var _offset = ((i % 2) == 1) ? 0 : -20;
    if (i > 3)
    {
        var _pippins_mode = ((i % 5) == 1) ? 2 : 1;
        _pippins_mode = ((i % 3) == 1) ? 0 : _pippins_mode;
        _treasure = instance_create(470 + (i * 60), 140 + _offset, obj_dw_pippins_rummage);
        with (_treasure)
        {
            init(_pippins_mode);
            set_depth(98900 - _offset);
        }
        pippins_list[array_length_1d(pippins_list)] = _treasure;
    }
    else
    {
        var _prize = instance_create(470 + (i * 60), 140 + _offset, obj_dw_pippins_steal);
        with (_prize)
            init();
        prize_list[array_length_1d(prize_list)] = _prize;
        _prize.set_depth(98900 - _offset);
    }
}
treasure_large = instance_create(1620, 50, obj_dw_pippins_large_treasure);
with (treasure_large)
{
    image_xscale = 10;
    image_yscale = 10;
    depth = (scr_flag_get(1161) == 0) ? 9000 : 98000;
}

clean_up = function()
{
    var i = array_length_1d(prize_list) - 1;
    while (i >= 0)
    {
        with (prize_list[i])
            clean_up();
        i--;
    }
    i = array_length_1d(special_prize_list) - 1;
    while (i >= 0)
    {
        with (special_prize_list[i])
            clean_up();
        i--;
    }
    i = array_length_1d(pippins_list) - 1;
    while (i >= 0)
    {
        with (pippins_list[i])
            clean_up();
        i--;
    }
    prize_list = [];
    special_prize_list = [];
    pippins_list = [];
    for (i = 0; i < array_length(_empty_treasures); i++)
    {
        var _treasure = _empty_treasures[i];
        if (_treasure.x < 700)
        {
            _treasure.visible = 0;
            with (_empty_blocks[i])
                instance_destroy();
        }
    }
};

if (scr_flag_get(1161) > 0)
{
    var max_stolen = scr_flag_get(1277);
    var i = array_length(prize_list) - 1;
    while (i >= 0)
    {
        if (max_stolen <= 0)
            break;
        var prize = prize_list[i];
        if (prize.prize_marker.sprite_index == spr_treasurebox)
        {
            prize.is_stolen = true;
            max_stolen--;
        }
        i--;
    }
    clean_up();
}
