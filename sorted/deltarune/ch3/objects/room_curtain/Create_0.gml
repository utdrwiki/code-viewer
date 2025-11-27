con = -1;
if (!snd_is_playing(global.currentsong[1]))
{
    global.currentsong[0] = snd_init("baci_perugina.ogg");
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.5, 1);
}
var wall_npcs = instance_create(0, 0, obj_dw_ch3_curtainroomnpc);
if (global.plot < 70)
{
    global.plot = 70;
    alarm[0] = 30;
    global.interact = 1;
    curtain_marker = scr_marker(0, 0, spr_dw_tv_curtain);
    curtain_marker.depth = 6000;
    scr_darksize(curtain_marker);
    snd_play(snd_wing);
    with (curtain_marker)
    {
        scr_lerpvar("y", 0, y - 340, 15, 3, "out");
        scr_script_delayed(scr_lerpvar, 20, "y", y - 340, -240, 15, 3, "in");
        scr_delay_var("depth", 999990, 15);
    }
    with (obj_mainchara)
    {
        cutscene = 1;
        fun = 1;
        sprite_index = usprite;
        x = 84;
        y = 218;
    }
    with (obj_caterpillarchara)
    {
        fun = 1;
        follow = 0;
        if (name == "susie")
        {
            sprite_index = spr_susie_shock_r;
            x = 238;
            y = 184;
        }
        if (name == "ralsei")
        {
            sprite_index = spr_ralsei_shocked_right;
            x = 169;
            y = 188;
        }
    }
}
else
{
    curtain_marker = scr_marker(0, -240, spr_dw_tv_curtain);
    curtain_marker.depth = 999990;
    scr_darksize(curtain_marker);
    with (obj_border_controller)
        show_border(1);
}
