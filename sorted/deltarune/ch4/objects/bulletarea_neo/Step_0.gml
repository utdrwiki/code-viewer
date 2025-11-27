if (init == 0)
{
    init = 1;
    with (instance_create(0, 0, obj_battlealphaer))
    {
        me = id;
        with (object_index)
        {
            if (id != me)
                instance_destroy();
        }
    }
    with (instance_create(0, 0, obj_battleLayerHighlight))
    {
        me = id;
        with (object_index)
        {
            if (id != me)
                instance_destroy();
        }
    }
    var me = id;
    with (object_index)
    {
        if (id != me)
        {
            debug_message("killed duplicate obj_bulletarea_neo");
            instance_destroy();
        }
    }
}
with (obj_mainchara)
{
    battlemode = 0;
    if (place_meeting(x, y, obj_bulletarea))
        battlemode = 1;
}
if (obj_mainchara.battlemode == 0)
    timer++;
else
    timer = 0;
if (timer >= 60)
{
    with (obj_darkcontroller)
        charcon = 0;
}
