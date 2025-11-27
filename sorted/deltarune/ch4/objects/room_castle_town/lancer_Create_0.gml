increment = 0.7853981633974483;
radius = 80;
timer = 0;
parade = [scr_dark_marker(x, y, spr_npc_lancer_tuba), scr_dark_marker(x, y, spr_jackperson_parade), scr_dark_marker(x, y, spr_topchef_parade), scr_dark_marker(x, y, spr_blockler_b_parade), scr_dark_marker(x, y, spr_npc_mrelegance_parade), scr_dark_marker(x, y, spr_npc_coody_parade)];
for (var i = 0; i < array_length(parade); i += 1)
{
    var parader = parade[i];
    with (parader)
    {
        image_speed = 0.2;
        scr_depth();
    }
}
