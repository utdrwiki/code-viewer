con = 0
if (global.plot >= 15)
    instance_destroy()
else
{
    con = 1
    susie = scr_dark_marker_ch1(1200, 760, spr_susieu_dark_ch1)
    with (susie)
        depth = 500000
}
aftercon = false
tilearray = tile_get_ids_at_depth_ch1(99999)
for (var i = 0; i < array_length_1d(tilearray); i++)
    tile_set_alpha_ch1(tilearray[i], 0)
