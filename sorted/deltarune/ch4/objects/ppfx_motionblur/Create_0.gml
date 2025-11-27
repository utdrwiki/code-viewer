ppfx_application_render_init();
ppfx_id = ppfx_create();
var _profile = ppfx_profile_create("Motion Blur", [new pp_bloom(true, 7, 0.6, 3.5, 16777215, true, false), new pp_lut3d(true, sprite_get_texture(spr_lut_test_0, 0), 1, [512, 512], 8), new pp_motion_blur(true, 0, 0, [0.5, 0.5], 0, 1, 1), new pp_dithering(true), new pp_white_balance(true, -0.2)]);
ppfx_profile_load(ppfx_id, _profile);
motion_blur_speed = 0;
motion_blur_angle = 0;
motion_blur_velocity = 0.15;
motion_blur_surface = -1;
