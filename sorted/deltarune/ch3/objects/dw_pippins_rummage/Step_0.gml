if (is_running)
{
    jump_timer--;
    if (jump_timer <= 0)
    {
        jump_timer = jump_time + irandom(6);
        pippins_sprite = 2047;
        pippins_anim = 4;
        snd_play_x(snd_jump, 0.2, 1);
        var target_y_offset = irandom_range(-10, 20);
        scr_lerpvar("pippins_y", pippins_y, pippins_y - (80 + target_y_offset), 6, 3, "out");
        scr_script_delayed(scr_lerpvar, 7, "pippins_y", pippins_y - (80 + target_y_offset), pippins_y, 10, 3, "in");
        scr_var_delay("pippins_sprite", 1540, 18);
    }
}
