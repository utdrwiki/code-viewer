con = -1;
global.darkzone = 1;
var cutscene_finished = global.plot >= 70;
if (cutscene_finished)
{
    reflayer = layer_get_id("GameshowAssets_REF");
    layer_set_visible(reflayer, 0);
    curtain_marker = scr_marker(0, 0, spr_dw_tv_curtain);
    curtain_marker.depth = 790100;
    scr_darksize(curtain_marker);
    instance_destroy();
    exit;
}
alarm[0] = 1;
scr_setparty(1, 1, 0);
screenshot = instance_find(obj_ch3_couch_video_screenshot, 0);
with (screenshot)
{
    persistent = false;
    depth = 7000;
    scr_script_delayed(scr_lerpvar, 20, "image_alpha", 1, 0, 8, 2, "out");
    scr_doom(id, 120);
}
textfade = 20;
tennafade = 8;
screenshot_overlay = scr_marker_ext(0, 0, spr_ch3_GSA01G_tvtimescreenshot);
with (screenshot_overlay)
{
    depth = 5999;
    visible = 0;
    scr_lerpvar("image_alpha", 1, 0, other.textfade);
}
screenshot_tenna = scr_marker_ext(0, 0, spr_ch3_GSA01G_tennascreenshot);
with (screenshot_tenna)
{
    depth = 6000;
    scr_script_delayed(scr_lerpvar, other.textfade, "image_alpha", 1, 0, other.tennafade, 2, "out");
}
if (scr_get_vhs_ini_value() == 1)
{
    screenshot_tenna.visible = false;
    var skip_overlay = scr_dark_marker(-10, 10, spr_pixel_white);
    var fade_time = (textfade + tennafade) - 6;
    with (skip_overlay)
    {
        image_blend = c_black;
        image_xscale = 999;
        image_yscale = 999;
        depth = -100;
        scr_lerpvar("image_alpha", 1, 0, fade_time);
        scr_doom(id, fade_time + 1);
    }
}
bgleft = scr_marker(0, 0, spr_dw_tv_cutscene1g_fakebg);
bgright = scr_marker(320, 0, spr_dw_tv_cutscene1g_fakebg);
bgleft.image_index = 0;
bgright.image_index = 1;
bgleft.depth = 777777;
bgright.depth = 777777;
tvsign = scr_marker(160, -174, spr_dw_tv_tvtimeSign_half);
scr_darksize(tvsign);
tvsign.depth = 1000189;
tvsign.image_speed = 0.08333333333333333;
mysterysign = scr_marker(176, -82, spr_dw_tv_mysterySign_half);
scr_darksize(mysterysign);
mysterysign.depth = 1000188;
rosecon = 0;
rosetimer = 0;
tennatelecon = 0;
startile = instance_create(x, y, obj_dw_tv_starbgtile);
startile.depth = 1000220;
tennamarker1 = instance_create(room_width * 2, room_height * 2, obj_tenna_marker_bouncing);
tennamarker1.depth = 9978;
tennamarker2 = instance_create(room_width * 2, room_height * 2, obj_tenna_marker_bouncing);
tennamarker2.depth = 9978;
gachadispenser = scr_marker(room_width * 10, room_height * 10, spr_dw_tv_gachapon_centered);
scr_darksize(gachadispenser);
gachadispenser.depth = 7980;
gachadispensercon = 0;
gachatimer = 0;
gachaxmod = 0;
gachaymod = 0;
var x_offset = (global.lang == "ja") ? -10 : 0;
funometer = instance_create(-80 + x_offset, 17, obj_dw_tv_funometer);
funometer.fun = 0;
funometer.depth = 1000020;
curtain_marker = scr_marker(0, -sprite_get_height(spr_dw_tv_curtain) * 2, spr_dw_tv_curtain);
curtain_marker.depth = 790100;
scr_darksize(curtain_marker);
reflayer = layer_get_id("GameshowAssets_REF");
if (reflayer != -1)
    layer_set_visible(reflayer, 0);
prize1splash = scr_marker_jitter(camerax(), cameray(), spr_dw_tv_prize_splashes_hires);
prize1splash.image_index = 0;
prize1splash.depth = 9999;
prize1object = scr_marker_jitter(camerax() + 20, cameray() + 180, spr_dw_tv_prize_curtain);
prize1object.image_index = 0;
prize1object.depth = 9998;
prize1object.image_xscale = 1;
prize1object.image_yscale = 1;
prize2splash = scr_marker_jitter(camerax(), cameray(), spr_dw_tv_prize_splashes_hires);
prize2splash.image_index = 1;
prize2splash.depth = 9997;
prize2object = scr_marker_jitter(camerax() + 390, cameray() + 20, scr_84_get_sprite("spr_dw_tv_prize_car"));
prize2object.image_index = 0;
prize2object.depth = 9996;
prize2object.image_xscale = 1;
prize2object.image_yscale = 1;
prize3splash = scr_marker_jitter(camerax(), cameray(), spr_dw_tv_prize_splashes_hires);
prize3splash.image_index = 2;
prize3splash.depth = 9995;
prize3object = scr_marker_jitter(camerax() + 10, cameray() + 10, spr_dw_tv_prize_talkback);
prize3object.image_index = 0;
prize3object.depth = 9994;
prize3object.image_xscale = 1;
prize3object.image_yscale = 1;
prize4splash = scr_marker_jitter(camerax(), cameray(), spr_dw_tv_prize_splashes_hires);
prize4splash.image_index = 3;
prize4splash.depth = 9993;
prize4object = scr_marker_jitter(camerax() + 460, cameray() + 200, spr_dw_tv_prize_sink);
prize4object.image_index = 0;
prize4object.depth = 9992;
prize4object.image_xscale = 1;
prize4object.image_yscale = 1;
prize5splash = scr_marker_jitter(camerax(), cameray(), spr_dw_tv_prize_splashes_hires);
prize5splash.image_index = 4;
prize5splash.depth = 9991;
prize5object = scr_marker_jitter(camerax() + 220, cameray(), spr_dw_tv_prize_gum);
prize5object.image_index = 0;
prize5object.depth = 9990;
prize5object.image_xscale = 1;
prize5object.image_yscale = 1;
prize6splash = scr_marker_jitter(camerax(), cameray(), spr_dw_tv_prize_splashes_hires);
prize6splash.image_index = 5;
prize6splash.depth = 9989;
prize6object = scr_marker_jitter(camerax() + 257, cameray() + 165, spr_dw_tv_prize_ralsei);
prize6object.depth = 9988;
prize6object.image_xscale = 1;
prize6object.image_yscale = 1;
with (obj_marker_jitter)
{
    if (sprite_index == spr_dw_tv_prize_splashes_hires)
    {
        jitteramount = 1;
        scr_size(1, 1);
    }
    visible = false;
}
startile2 = instance_create(x, y, obj_dw_tv_starbgtile);
startile2.depth = 1000220;
startile2.image_alpha = 0;
startile2.desiredImageAlpha = 0;
startile2.depth = 9970;
ball = scr_marker(318, 244, spr_gachapon_whole_opaque);
ball.visible = false;
ball.depth = gachadispenser.depth - 20;
ball_dark = scr_marker(318, 244, spr_gachapon_whole_opaque);
ball_dark.visible = false;
ball_dark.image_blend = c_black;
ball_dark.depth = ball.depth + 10;
balltop = scr_marker(room_width * 4, room_width * 4, spr_dw_tv_gachaball);
balltop.image_index = 1;
balltop.image_blend = c_black;
balltop.image_alpha = 1;
scr_darksize(balltop);
ballbot = scr_marker(room_width * 4, room_width * 4, spr_dw_tv_gachaball);
ballbot.image_index = 2;
ballbot.image_blend = c_black;
ballbot.image_alpha = 1;
scr_darksize(ballbot);
toriel_black = scr_marker(270, 128, spr_toriel_sleep_throne);
toriel_black.visible = false;
toriel_black.image_blend = c_black;
scr_darksize(toriel_black);
toriel = scr_marker(270, 128, spr_toriel_sleep_throne);
toriel.image_alpha = 0;
toriel.depth = toriel_black.depth - 10;
scr_darksize(toriel);
toriel_anchor = scr_marker(270, 128, spr_hitbox_10px);
toriel_anchor.visible = false;
bgwhite = scr_marker(-10, -10, spr_whitepx_10);
bgwhite.image_xscale = 72;
bgwhite.image_yscale = 56;
bgwhite.depth = gachadispenser.depth - 10;
bgwhite.image_alpha = 0;
torieladcon = 0;
torieladtimer = 0;
torielfloatcon = 0;
tsin = 0;
muscon = 0;
torielfinaly = 84;
torielfinalx = 410;
recapleft = scr_marker((camerax() + torielfinalx) - 640, torielfinaly, spr_dw_gachaballhalves_horizontal);
recapleft.image_index = 0;
scr_darksize(recapleft);
recapleft.depth = toriel.depth - 30;
recapright = scr_marker(camerax() + torielfinalx + 640, torielfinaly, spr_dw_gachaballhalves_horizontal);
recapright.image_index = 1;
scr_darksize(recapright);
recapright.depth = toriel.depth - 30;
recaptoriel = scr_marker(torielfinalx, torielfinaly, spr_dw_tv_gachaballRecapture);
recaptoriel.image_speed = 0;
recaptoriel.image_alpha = 0;
recaptoriel.depth = toriel.depth - 40;
scr_darksize(recaptoriel);
cancelled = scr_marker(328, 90, scr_84_get_sprite("spr_dw_tv_cancelled"));
cancelled.image_alpha = 0;
cancelled.image_angle = 2;
scr_darksize(cancelled);
rosecounter = 0;
dogmade = 0;
cancelcon = 0;
canceltimer = 0;
canceldist = 0;
cancelang = 0;
whipcrack = 0;
prize_shine = 0;
confetti_time = 0;
prize_light = instance_create(toriel.x + 47, toriel.y + 52, obj_prize_shine);
prize_light.visible = false;
tenna_shake = 0;
with (obj_savepoint)
    visible = false;
saveload = false;
shake_flip = 1;
tenna_snap = false;
tenna_snap_obj = -4;
audience_cheer = instance_create(0, 0, obj_ch3_audience);
laugh_track = false;
laugh_track_timer = 0;
laugh_track_finish = false;
mystery_sign = instance_create(160, -174, obj_dw_tv_mystery_sign);
with (mystery_sign)
    scr_depth();
ominous_track[0] = -4;
ominous_track[1] = -4;
ominous_fade = false;
ominous_stop = false;
bg_scroll_stop = false;
bg_scroll_start = false;
crowd_cheer_loop = false;
ooaatimer = 0;
ooaa_max = 60;
bg_darken = false;
border_switch = false;
