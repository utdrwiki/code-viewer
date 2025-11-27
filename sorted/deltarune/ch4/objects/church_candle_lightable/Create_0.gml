lit = 0;
con = 0;
timer = 0;
siner = 0;
depth = 600000;
boss = 0;
if (instance_find(object_index, 0) == id)
    boss = 1;
if (boss == 1)
{
    layer_set_visible("TILES_DOOR2", 0);
    door2blocker = instance_create(1720, 320, obj_solidblocksized);
    door2blocker.image_xscale = 3;
    if (global.flag[705] == 1)
    {
        safe_delete(door2blocker);
        layer_set_visible("TILES_DOOR2", 1);
        if (i_ex(obj_overworld_bulletarea))
        {
            with (obj_overworld_bulletarea)
                y = room_height * sprite_height;
        }
    }
}
mylight = instance_create(x, y, obj_lightsource);
mylight.image_alpha = 0;
if (global.flag[705] == 1)
    lit = 2;
