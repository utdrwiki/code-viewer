init = false;
image_xscale = 2;
image_yscale = 2;
con = 0;
concon = -1;
spotlight_solo = [];
for (var i = 0; i < 3; i++)
{
    spotlight_solo[i] = instance_create(36 + (i * 190), 120, obj_rhythmgame_spotlight_solo);
    spotlight_solo[i].depth = obj_rhythmgame.depth - 10;
}

spotlight_active = function(arg0, arg1)
{
    spotlight_solo[arg0].con = arg1;
};
