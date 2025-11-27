function scr_layer_tilemap_get_id_fixed(arg0)
{
    var els = layer_get_all_elements(arg0);
    var n = array_length_1d(els);
    for (var i = 0; i < n; i++)
    {
        var el = els[i];
        if (layer_get_element_type(el) == 5)
            return el;
    }
    return -1;
}
