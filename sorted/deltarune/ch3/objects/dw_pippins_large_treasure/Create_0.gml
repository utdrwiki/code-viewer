image_xscale = 10;
image_yscale = 10;
pippins_sprite = 2047;
pippins_anim = 0;
pippins_anim_speed = 0.2;
pippins_x = x + 60;
pippins_y = y + 80;
is_open = false;
is_inside = true;
open_box = false;
open_box_timer = 0;
is_opened = scr_flag_get(1162) > 0;
is_running = false;
jump_time = 20;
jump_timer = 5;
if (is_opened)
    image_index = 1;
event_inherited();

open_box = function()
{
    is_open = true;
    image_index = 1;
    snd_play(snd_closet_impact);
    scr_shakescreen();
    scr_var_delay("is_inside", false, 25);
    scr_var_delay("pippins_sprite", 2047, 25);
    scr_var_delay("pippins_anim", 4, 24);
    scr_script_delayed(snd_play, 24, snd_jump);
    scr_script_delayed(scr_lerpvar, 24, "pippins_y", pippins_y, pippins_y - 80, 6, 3, "out");
    scr_script_delayed(scr_lerpvar, 30, "pippins_y", pippins_y - 80, y + 130, 6, 3, "in");
    scr_var_delay("pippins_sprite", 1540, 36);
    scr_script_delayed(scr_lerpvar, 42, "pippins_x", pippins_x, camerax() + view_wport[0] + 100, 30, 3, "in");
    scr_var_delay("is_opened", true, 72);
    scr_delay_var("pippins_anim_speed", 0, 42);
    scr_delay_var("is_running", true, 42);
    scr_delay_var("is_running", false, 72);
};
