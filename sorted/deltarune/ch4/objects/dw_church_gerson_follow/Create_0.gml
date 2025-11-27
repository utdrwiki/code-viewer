con = 0;
timer = 0;
init = 0;
assetname = "dspr_gspot";
locx[0] = 0;
locy[0] = 0;
numofgersons = 17;
for (var i = 1; i < numofgersons; i++)
{
    var loc = scr_assetloc("GERSON_LOCS", assetname + string(i));
    locx[i] = loc[0];
    locy[i] = loc[1];
}
if (scr_debug())
{
    var i = 1;
    while (i < array_length(locx))
        i++;
}
image_speed = 0;
moveindex = 1;
depth = 50;
scr_size(2, 2);
interactable = 0;
