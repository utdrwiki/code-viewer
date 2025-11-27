con = -1;
customcon = 0;
gerson_npc = -4;
anvil_npc = instance_create(780, 200, obj_npc_room);
with (anvil_npc)
{
    scr_depth();
    sprite_index = bg_dw_gerson_arena_anvil;
    visible = 1;
}

disable_anvil = function()
{
    var anvil_marker = scr_dark_marker(anvil_npc.x, anvil_npc.y, bg_dw_gerson_arena_anvil);
    anvil_marker.depth = anvil_npc.depth;
    var anvil_solid = instance_create(anvil_marker.x + 4, anvil_marker.y + 16, obj_solidblockDark);
    with (anvil_solid)
        image_xscale = 2.6;
    with (anvil_npc)
        instance_destroy();
};

axe_marker = -4;
if (scr_flag_get(852) == 0)
{
    axe_marker = scr_dark_marker(anvil_npc.x + 30, anvil_npc.y - 26, bg_dw_gerson_arena_axe);
    axe_marker.depth = anvil_npc.depth - 10;
    if (scr_flag_get(851) == 2)
    {
        gerson_npc = instance_create(840, 210, obj_npc_gerson);
        gerson_npc.depth = 97300;
        with (gerson_npc)
        {
            facing_right = false;
            current_state = 9;
        }
    }
}
else
{
    disable_anvil();
}
axe_timer = 0;
axe_hover = false;
slow_writer = false;
susie_attack_fx = false;
susie_attack_timer = 0;
miss_fx = false;
miss_fx_offset = 0;
miss_counter = 0;
whiteall = scr_dark_marker(-10, -10, spr_pixel_white);
whiteall.image_xscale = 999;
whiteall.image_yscale = 999;
whiteall.depth = 100;
whiteall.image_alpha = 0;
fanfare[0] = -4;
fanfare[1] = -4;
background = -4;
if (scr_flag_get(852) == 0 && scr_flag_get(851) < 3)
{
    con = -1;
    if (scr_flag_get(851) == 1)
        con = 0;
    scr_setparty(1, 1, 0);
    if (scr_debug())
    {
        if (global.tempflag[90] >= 1)
        {
            con = 7;
            alarm[0] = 10;
            global.interact = 1;
            with (gerson_npc)
                instance_destroy();
            snd_free_all();
        }
    }
}
