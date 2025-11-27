if (myinteract == 3)
{
    if (is_opened)
    {
        scr_flag_set(1162, 1);
        global.interact = 0;
        myinteract = 0;
        with (obj_mainchara)
            onebuffer = 5;
    }
}
if (is_running)
{
    jump_timer--;
    if (jump_timer <= 0)
    {
        jump_timer = jump_time + irandom(6);
        pippins_sprite = 2047;
        pippins_anim = 4;
        snd_play(snd_jump);
        var target_y_offset = irandom_range(-10, 20);
        scr_lerpvar("pippins_y", pippins_y, pippins_y - (80 + target_y_offset), 6, 3, "out");
        scr_script_delayed(scr_lerpvar, 7, "pippins_y", pippins_y - (80 + target_y_offset), pippins_y, 10, 3, "in");
        scr_var_delay("pippins_sprite", 1540, 18);
    }
}
