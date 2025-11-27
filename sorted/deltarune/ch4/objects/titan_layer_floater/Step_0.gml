var _cy = cameray();
var _cx = camerax();
for (var l = 0; l < layer_count; l++)
{
    var _count = 0;
    var _layery = layer_get_y(layer_names[l]);
    var _layerx = layer_get_x(layer_names[l]);
    for (var e = 0; e < layer_contents_count[l]; e++)
    {
        var _element = layer_contents[l][e];
        var _yy = (_element.inity + _layery) - _cy;
        var _xx = (_element.initx + _layerx) - _cx;
        if (_yy > -100 && _yy < 580 && _xx > -100 && _xx < 740)
        {
            var a4 = ((_element.inity + layer_wave_distance[l]) - _element.inity) * 0.5;
            layer_sprite_y(_element.element, _element.inity + a4 + (sin((((current_time * 0.001) + (2 * _element.offset)) / 2) * (2 * pi)) * a4));
            _count++;
        }
    }
}
