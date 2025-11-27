var organ_readable = instance_create(360, 150, obj_readable_room1);
with (organ_readable)
{
    extflag = "organ";
    image_xscale = 5;
}
var door_top = instance_create(530, 140, obj_readable_room1);
with (door_top)
    extflag = "door_top";
if (global.plot < 280)
{
    var light_vfx = instance_create(0, 0, obj_bg_church_light);
    var layerarray = layer_get_all();
    for (var i = 0; i < array_length(layerarray); i++)
    {
        if (layer_get_name(layerarray[i]) != "COLLISION_CANDLES_NIGHT")
            continue;
        var elements = layer_get_all_elements(layerarray[i]);
        var j = array_length(elements) - 1;
        while (j >= 0)
        {
            if (layer_get_element_type(elements[j]) != 2)
            {
            }
            else
            {
                var __inst = layer_instance_get_instance(elements[j]);
                var __name = object_get_name(__inst.object_index);
                instance_destroy(__inst);
            }
            j--;
        }
        break;
    }
}
else
{
    var layerarray = layer_get_all();
    for (var i = 0; i < array_length(layerarray); i++)
    {
        if (layer_get_name(layerarray[i]) != "COLLISION_CANDLES_DAY")
            continue;
        var elements = layer_get_all_elements(layerarray[i]);
        var j = array_length(elements) - 1;
        while (j >= 0)
        {
            if (layer_get_element_type(elements[j]) != 2)
            {
            }
            else
            {
                var __inst = layer_instance_get_instance(elements[j]);
                var __name = object_get_name(__inst.object_index);
                instance_destroy(__inst);
            }
            j--;
        }
        break;
    }
    if (global.plot < 300)
    {
        with (obj_caterpillarchara)
            visible = 0;
    }
}
