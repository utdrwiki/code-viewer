with (obj_floorshadow)
    instance_destroy();
if (shadowinit == 0)
{
    shadowinit = 1;
    instance_create(x, y, obj_darkness_overlay);
    var lights = [];
    var spritesArray = layer_get_all_elements("WINDOWS");
    for (var i = 0; i < array_length(spritesArray); i++)
    {
        var loc = scr_assetgetinfo(spritesArray[i]);
        var light = instance_create(loc[2] - 30, 0, obj_light_area_simple);
        scr_sizeexact(62, 480, light);
        array_push(lights, light);
        var light2 = instance_create(light.x + 62, 0, obj_light_area_simple_dim);
        scr_sizeexact(18, 480, light2);
        with (light2)
        {
            if (place_meeting(x, y, obj_solidenemy_2))
                instance_destroy();
        }
    }
    with (obj_light_area_simple_dim)
    {
        with (instance_create(x, 240, obj_solidblocksized))
            scr_sizeexact(other.sprite_width, 40);
    }
    scr_populatechars();
    with (instance_create(x, y, obj_floorshadow))
    {
        target = other.kris;
        name = "kris";
    }
    with (instance_create(x, y, obj_floorshadow))
    {
        target = other.susie;
        name = "susie";
    }
    var pos = scr_heromarker(undefined, "leftx");
    leftx = pos[0];
    pos = scr_heromarker(undefined, "rightx");
    rightx = pos[0];
    var endpo = scr_heromarker(undefined, "goback1");
    goback1 = endpo[0];
    endpo = scr_heromarker(undefined, "goback2");
    goback2 = endpo[0];
}
