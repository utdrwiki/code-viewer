if (!is_init)
    exit;
if (steal)
{
    steal_timer++;
    if (steal_timer == 1)
    {
        pippins_marker = scr_dark_marker(x + pippins_x, (y + pippins_y) - 30, spr_pippins_sneak);
        pippins_marker.depth = prize_marker.depth + 1;
        pippins_marker.image_speed = 0;
        with (prize_marker)
            scr_lerpvar("y", y, y - 30, 15, 3, "in");
        with (block)
            instance_destroy();
    }
    if (steal_timer == 30)
    {
        var _target = pippins_marker;
        with (prize_marker)
            scr_stickto(_target, -10);
        pippins_marker.image_speed = 0.4;
        snd_play(snd_escaped);
        with (pippins_marker)
        {
            scr_lerpvar("hspeed", hspeed, 12, 20);
            scr_doom(id, 300);
        }
    }
    if (steal_timer == 60)
    {
        if (prize_marker.sprite_index == spr_treasurebox)
            scr_flag_set(1277, scr_flag_get(1277) + 1);
    }
}
