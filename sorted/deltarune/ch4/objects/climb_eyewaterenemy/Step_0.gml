event_inherited();
var _blocked = 0;
if (global.interact != 0 || damagecon != 0)
    _blocked = 1;
if (!_blocked)
{
    watertimer++;
    if (watertimer >= waterfreq)
        watertimer = 0;
    else if (watertimer == (waterfreq - 1))
        makewater = 1;
}
image_speed = 0;
if (watertimer >= (waterfreq - 30))
    image_index = min(floor((watertimer - (waterfreq - 40)) / 4), 5);
else if (watertimer < 30)
    image_index = max(5 - floor(watertimer / 4), 0);
else
    image_index = 0;
if (makewater == 1)
{
    makewater = 0;
    var water = instance_create(x, y + 24, obj_climb_water);
    if (i_ex(obj_rotating_tower_controller_new))
        water.depth = obj_rotating_tower_controller_new.depth - 2;
    water.fallingtimer = waterfalltimer;
    water.tilelimit = watertilelimit;
    water.bad = 1;
    water.moverate = watermoverate;
    water.spawnrate = waterspawnrate;
    water.activetime = wateractivetime;
    water.falldir = 0;
    water.watertype = 2;
    water.sprite_index = spr_climb_badwater;
    water.damage = 10;
    scr_darksize(water);
}
