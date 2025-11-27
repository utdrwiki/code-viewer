if (!shelvesinit)
{
    var copos = scr_heromarker(undefined, "couch");
    couchmarker = scr_marker_ext(copos[0], copos[1], spr_dw_church_couch, 2, 2, undefined, global.flag[865], undefined, undefined, 1);
    var ramark = scr_heromarker("ralsei", "ranpc");
    ranpc = instance_create(ramark[0], ramark[1], obj_trigger_interact);
    ranpc.talked = 0;
    ranpc.strict = true;
    ranpc.issolid = true;
    ranpc.marker = scr_marker_ext(ramark[0], ramark[1], spr_ralsei_walk_down, 2, 2, 0, undefined, undefined, undefined, 1);
    scr_depth(ranpc.marker, -10);
    scr_sizeexact(ramark[2].bbox_right - ramark[2].bbox_left, ramark[2].bbox_bottom - ramark[2].bbox_top, ranpc);
    setxy(ramark[2].bbox_left, ramark[2].bbox_top, ranpc);
    var sumark = scr_heromarker("susie", "sunpc");
    sunpc = instance_create(sumark[0], sumark[1], obj_trigger_interact);
    sunpc.talked = 0;
    sunpc.strict = true;
    sunpc.susprite = 436;
    sunpc.marker = scr_marker_ext(sumark[0], sumark[1], sunpc.susprite, 2, 2, 0, undefined, undefined, undefined, 1);
    sunpc.sitting = false;
    scr_sizeexact(sumark[2].bbox_right - sumark[2].bbox_left, sumark[2].bbox_bottom - sumark[2].bbox_top, sunpc);
    setxy(sumark[2].bbox_left, sumark[2].bbox_top, sunpc);
    var sawralseiroom = 0;
    if (global.flag[710] >= 2)
        sawralseiroom = 1;
    if (!sawralseiroom || global.flag[866] == 1)
    {
        sunpc.marker.sprite_index = spr_susie_dark_sitchurch;
        sunpc.sitting = true;
        setxy(308, 656, sunpc.marker);
        setxy(308, 720, sunpc);
    }
    if (global.flag[866] == 1)
    {
        setxy(364, 658, ranpc.marker);
        ranpc.marker.sprite_index = spr_ralsei_darkchurch_sit_happy;
        if (global.flag[865])
        {
            setxy(364, 666, ranpc.marker);
            ranpc.marker.sprite_index = spr_ralsei_darkchurch_sit_sad;
        }
        ranpc.marker.depth = couchmarker.depth - 1;
        setxy(368, 736, ranpc);
    }
    setxy(600, 346, piano1);
    scr_depth(piano1);
    piano1.depth -= 1000;
    shelvesinit = true;
    layerarray = layer_get_all();
    for (var i = 0; i < array_length(layerarray); i++)
    {
        if (layer_get_name(layerarray[i]) == "spr_shelves")
        {
            elements = layer_get_all_elements(layerarray[i]);
            for (var j = 0; j < array_length(elements); j++)
            {
                if (layer_get_element_type(elements[j]) == 4)
                {
                    sprite_array_size++;
                    layersprite[sprite_array_size] = instance_create(layer_sprite_get_x(elements[j]), layer_sprite_get_y(elements[j]), obj_marker);
                    layersprite[sprite_array_size].sprite_index = layer_sprite_get_sprite(elements[j]);
                    layersprite[sprite_array_size].image_speed = 0;
                    layersprite[sprite_array_size].image_index = layer_sprite_get_index(elements[j]);
                    with (layersprite[sprite_array_size])
                    {
                        image_index = (x / 40) + (y / 40);
                        scr_size(2, 2);
                        scr_depth_alt(undefined, -40);
                        if (sprite_index == spr_church_ladder)
                            depth -= 4;
                    }
                    layer_sprite_destroy(elements[j]);
                }
            }
            break;
        }
    }
}
if (flooractive == 1)
{
    with (obj_solid_temp)
    {
        if (extflag == "FLOOR1")
            active = 1;
        else
            active = 0;
    }
}
if (flooractive == 2)
{
    with (obj_solid_temp)
    {
        if (extflag == "FLOOR2")
            active = 1;
        else
            active = 0;
    }
}
wasactive = flooractive;
