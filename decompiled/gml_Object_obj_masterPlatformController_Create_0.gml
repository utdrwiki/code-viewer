freeze = false
mouseSpawn = 0
freezespawn = -1
hasbegun = 0
if (global.flag[379] == 0 || global.plot < 78)
{
    plat[0] = instance_create(x, y, obj_rotationtile_tower)
    with (plat[0])
    {
        x = lx
        y = ry
        phase = 3
        starter = 1
    }
    plat[1] = instance_create(x, y, obj_rotationtile_tower)
    with (plat[1])
    {
        x = rx
        y = ry
        phase = 1
    }
    currentPlatform = 1
    waitbuffer = 0
    makenewplatform = 0
    noelle = 0
    init = false
    active = false
}
