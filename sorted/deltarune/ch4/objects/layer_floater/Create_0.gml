layer_names = ["PARALLAX_1", "PARALLAX_2", "PARALLAX_3"];
layer_wave_distance = [6, 4, 2];
layer_count = 0;
layer_contents = [];
layer_contents_count = [];
for (var i = 0; i < array_length(layer_names); i++)
{
    if (layer_exists(layer_names[i]))
    {
        layer_contents[i] = layer_get_all_elements(layer_names[i]);
        layer_count++;
    }
}
for (var i = 0; i < layer_count; i++)
{
    layer_contents_count[i] = 0;
    for (var e = 0; e < array_length(layer_contents[i]); e++)
    {
        layer_contents[i][e] = 
        {
            element: layer_contents[i][e],
            inity: layer_sprite_get_y(layer_contents[i][e]),
            initx: layer_sprite_get_x(layer_contents[i][e]),
            offset: e * 0.11
        };
        layer_contents_count[i]++;
    }
}
