_party_people = [];
timer = 0;

get_party_list = function(arg0)
{
    var _people_pool = [798, 798, 960];
    var _people_list = [];
    for (var i = 0; i < arg0; i++)
        _people_list[array_length_1d(_people_list)] = _people_pool[irandom(array_length(_people_pool) - 1)];
    return _people_list;
};

start_party = function()
{
    for (var i = 0; i < array_length_1d(_party_people); i++)
    {
        with (_party_people[i])
        {
            init();
            start_partying();
        }
    }
};

stop_party = function()
{
    for (var i = 0; i < array_length_1d(_party_people); i++)
    {
        with (_party_people[i])
            stop_partying();
    }
};

shock_party = function()
{
    for (var i = 0; i < array_length_1d(_party_people); i++)
    {
        with (_party_people[i])
            shock();
    }
};

init = function(arg0)
{
    var _party_multiplier = arg0 ? 4 : 2;
    var _top_row = get_party_list(5 * _party_multiplier);
    var _middle_row = get_party_list(5 * _party_multiplier);
    var _bottom_row = get_party_list(5 * _party_multiplier);
    var _random_zapper = irandom(100) < 10;
    if (_random_zapper)
    {
        var _rand_row = (irandom(100) < 50) ? _top_row : _bottom_row;
        _rand_row[array_length_1d(_rand_row)] = 193;
    }
    var _x_space = arg0 ? 90 : 180;
    for (var i = 0; i < array_length_1d(_top_row); i++)
    {
        var _people = instance_create(95 + (_x_space * i), 60, _top_row[i]);
        with (_people)
            set_depth(990000 + (i * 2));
        _party_people[array_length_1d(_party_people)] = _people;
    }
    for (var i = 0; i < array_length_1d(_middle_row); i++)
    {
        var _people = instance_create(10 + (_x_space * i), 110, _middle_row[i]);
        with (_people)
            set_depth(980000 + (i * 2));
        _party_people[array_length_1d(_party_people)] = _people;
    }
    for (var i = 0; i < array_length_1d(_bottom_row); i++)
    {
        var _people = instance_create(85 + (_x_space * i) + choose(-8, -4, 0, 4, 8), 140, _bottom_row[i]);
        with (_people)
            set_depth(900000 + (i * 2));
        _party_people[array_length_1d(_party_people)] = _people;
    }
    start_party();
};
