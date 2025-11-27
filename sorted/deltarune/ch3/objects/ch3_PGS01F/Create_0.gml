con = -1;
customcon = 0;
spotlight_fx = instance_create(2180, 600, obj_ch3_PGS01F_spotlight);
spotlight_fx.visible = 0;
both_talk = false;
both_talk_timer = 0;
both_writer = -4;
confetti_popper = -4;
confetti_timer = 0;
confetti_pop = false;
camera_y_pos = 678;
camera_pan = false;
camera_pan_timer = 0;
show_border = false;
with (obj_border_controller)
    hide_border();
if (global.plot == 45)
{
    con = 0;
    blackall = scr_dark_marker(-40, -40, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = -110;
    blackall.image_blend = c_black;
    blackall.image_alpha = 0;
    spotlight_marker = scr_dark_marker(2116, 678, spr_pixel_white);
    with (spotlight_marker)
    {
        image_xscale = 30;
        image_yscale = 60;
        scr_depth();
        image_alpha = 0.6;
        visible = 0;
    }
    ralsei_face_marker = scr_dark_marker(2320, 1018, spr_face_r_nohat);
    ralsei_face_marker.image_index = 32;
    ralsei_face_marker.visible = 0;
    scr_losechar();
    if (i_ex(obj_caterpillarchara))
    {
        with (obj_caterpillarchara)
            instance_destroy();
    }
    with (obj_mainchara)
    {
        y = -100;
        cutscene = 1;
        visible = 0;
    }
    camerax_set(1860);
    cameray_set(678);
}
else
{
    instance_destroy();
}
