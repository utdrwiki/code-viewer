spike_list = [];
max_scale = 0;

init_tiles = function(arg0)
{
    max_scale = arg0;
};

show_tiles = function()
{
    for (var i = 0; i < max_scale; i++)
    {
        spike_list[i][0] = scr_dark_marker(x, y + (i * 40), spr_spiketile);
        spike_list[i][0].depth = depth - 10;
        spike_list[i][1] = instance_create(x, y + (i * 40), obj_solidblocksized);
    }
};

hide_tiles = function()
{
    if (array_length_1d(spike_list) == 0)
    {
        for (var i = 0; i < max_scale; i++)
        {
            spike_list[i][0] = scr_dark_marker(x, y + (i * 40), spr_spiketile);
            spike_list[i][0].depth = depth - 10;
            spike_list[i][1] = instance_create(x, y + (i * 40), obj_solidblocksized);
        }
    }
    for (var i = 0; i < array_length_1d(spike_list); i++)
    {
        spike_list[i][0].image_index = 1;
        with (spike_list[i][1])
            instance_destroy();
    }
};
