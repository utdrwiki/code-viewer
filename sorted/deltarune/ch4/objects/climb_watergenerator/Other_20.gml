if (i_ex(obj_rotating_tower_controller_new))
{
    drawwater = round(3 * sprite_get_number(spr_climb_waterbucket_splash));
}
else
{
    var spr = 279;
    var spd = round(3 * sprite_get_number(spr));
    with (scr_marker_ext(x, y, spr, 2, 2, 0, undefined, c_white, depth - 10, undefined, spd))
        scr_lerpvar("image_index", 0, 5, spd);
}
