con = -1;
customcon = 0;
if (global.plot >= 310 && global.plot < 320)
{
    con = 0;
    spotlight_fx = instance_create(1540, -20, obj_ch3_PTB01_spotlight);
    spotlight_fx_susie = instance_create(1540, -20, obj_ch3_PTB01_spotlight_susie);
    spotlight_move = false;
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 90000;
    blackall.image_blend = c_black;
    blackall.image_alpha = 0;
    classroom_sepia = scr_dark_marker(0, 0, spr_classroom_sepia);
    classroom_sepia.depth = blackall.depth + 10;
    classroom_sepia.visible = 0;
    classroom_susie = scr_dark_marker(0, 0, spr_ch3_PTB01_susieu_white);
    classroom_susie.depth = classroom_sepia.depth - 5;
    classroom_susie.image_blend = #5C3714;
    classroom_susie.visible = 0;
    graveyard_sepia = scr_dark_marker(0, 0, spr_graveyard_sepia);
    graveyard_sepia.depth = blackall.depth + 10;
    graveyard_sepia.visible = 0;
    diner_sepia = scr_dark_marker(0, 0, spr_diner_sepia);
    diner_sepia.depth = blackall.depth + 10;
    diner_sepia.visible = 0;
    var x_offset = (global.lang == "ja") ? -10 : 0;
    funometer = instance_create(-80 + x_offset, 17, obj_dw_tv_funometer);
    funometer.hope = true;
    funometer.fun = 0;
    funometer.depth = 1000020;
    slow_text = false;
    spotlight_shrink = false;
    spotlight_nudge = false;
    tenna_shake = false;
    tenna_shake_timer = 0;
    tenna_spotlight = false;
    ralsei_spotlight = false;
    susie_spotlight = false;
    susie_solo = false;
    with (obj_mainchara)
        cutscene = 1;
    camerax_set(1040);
    with (obj_border_controller)
        set_border(border_dw_tv_black);
}
else
{
    instance_destroy();
}
