con = -1;
customcon = 0;
enter_dark = false;
dark_con = 0;
slow_writer = false;
susie_hide = false;
susie_shadow = 0;
kris_hide = false;
kris_shadow = 0;
if (global.plot >= 100 && global.plot < 105)
{
    con = 0;
    dark_door = instance_create(283, 264, obj_ch4_PDC16_church_door);
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 110;
    blackall.image_blend = c_black;
    blackall.visible = 1;
    blackall.image_alpha = 0;
    vfx = instance_create(0, 0, obj_ch4_PDC16_vfx);
    with (vfx)
        depth = 96800;
    with (obj_npc_room)
        instance_destroy();
    if (scr_debug())
    {
        with (obj_border_controller)
        {
            set_custom_effect(2);
            show_border(1);
        }
    }
    var trigger = instance_create(230, 320, obj_trigger);
    with (trigger)
    {
        image_xscale = 10;
        image_yscale = 12;
    }
}
else
{
    instance_destroy();
}

answer_choice = function(arg0, arg1)
{
    scr_flag_set(1557, arg1 + 1);
    if (arg1 == 0)
        con = 10;
    else
        con = 20;
};
