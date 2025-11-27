if (!init)
{
    init = true;
    part_type_direction(ptdebris, 45 + (90 * image_xscale), 135 + (90 * image_xscale), 0, 0);
    part_type_direction(btballs, 45 + (90 * image_xscale), 135 + (90 * image_xscale), 0, 0);
}
if (wing)
    wing.image_index = floor(current_time / 200) % 6;
if (con == 0)
{
    if (i_ex(obj_climb_kris))
    {
        if (obj_climb_kris.y < (y + 160))
        {
            con = 1;
            snd_play(snd_explosion, 0.5);
            if (dowing)
            {
                var marker = instance_create(x, y, obj_marker);
                wing = marker;
                marker.sprite_index = spr_climb_titanwing;
                marker.image_xscale = 0;
                marker.image_yscale = 0;
                marker.depth = obj_rotating_tower_controller_new.depth + 0.5;
                marker.image_speed = 0;
                with (marker)
                {
                    scr_lerpvar("x", (x - 90) + (90 * other.image_xscale), x - (90 * other.image_xscale), 40, 1, "out");
                    scr_lerpvar("image_xscale", 0, other.image_xscale, 40, 1, "out");
                    scr_lerpvar("image_yscale", 0, 1, 40, 1, "out");
                }
            }
        }
    }
}
else if (con == 1)
{
    timer += 1;
    if (timer <= 21)
        obj_rotating_tower_controller_new.tower_xshake = clamp(10 - (timer * 0.5), 0, 4) * (((floor(20 - timer) % 2) * 2) - 1);
    if (timer == 8)
        part_emitter_burst(ps, pemitter, ptdebris, 15);
    if (timer >= 8 && timer <= 30)
        part_emitter_burst(bs, bemitter, btballs, 1);
    if (timer > 150)
        con = 2;
    if (timer > 15 && (timer % 4) == 0)
        part_emitter_burst(bs, bemitter, btballs, 1);
}
