con = -1
customcon = 0
specialDraw = 0
glowvalue = 0
skipbattle = 0
drawx = 0
extra_con = 0
noelle_depth = 0
if (!snd_is_playing(global.currentsong[1]))
{
    global.currentsong[0] = snd_init("wind_highplace.ogg")
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 1, 1)
}
if (global.chapter != 2 || global.plot >= 170)
{
    if (global.plot == 170 && scr_sideb_get_phase() < 2)
        instance_create(0, 0, obj_ch2_scene27)
    else
    {
        queen_npc = instance_create(2030, 170, obj_npc_sign)
        queen_npc.sprite_index = spr_queen_walk_down
        queen_npc.image_speed = 0
        with (queen_npc)
            scr_depth()
        ralsei_npc = instance_create(2042, 245, obj_npc_sign)
        ralsei_npc.sprite_index = spr_ralsei_walk_up
        ralsei_npc.image_speed = 0
        with (ralsei_npc)
            scr_depth()
    }
    instance_destroy()
}
else
{
    queenhand = (scr_sideb_get_phase() < 2 ? scr_dark_marker(2060, 85, spr_cutscene_26_queen_giga_bonds) : scr_dark_marker(2060, 85, spr_cutscene_26_queen_giga_hand))
    with (queenhand)
        depth = 1000200
    rudebuster = 0
    rockanim = 0
    rockcon = 0
    rockanimstop = 0
    rockdog = 0
    rockdogobj = -1
    rockdogstop = 0
    winelaser = 0
    shakeloop = 0
    shakecon = 1
    fist_explode = 0
    fist_afterimage = 0
    explosions = 0
    wallanimstart = 0
    wallanimstop = 0
    wallcon = 0
    walltimer = 0
    walllayer = -1
    layerid = -1
    battletimer = 0
    whiteall = scr_marker(-10, -10, spr_pixel_white)
    whiteall.image_xscale = 999
    whiteall.image_yscale = 999
    whiteall.depth = 100
    whiteall.image_alpha = 0
    bg_cover = scr_marker(-10, -10, spr_pixel_white)
    bg_cover.image_xscale = 999
    bg_cover.image_yscale = 999
    bg_cover.depth = 1000350
    bg_cover.image_blend = c_black
    bg_cover.image_alpha = 0
    berdly_coaster = -1
    berdly_coaster_start = 0
    berdly_coaster_leave = 0
    anime_bg = instance_create(1640, 550, obj_anime_bg_controller)
    anime_bg.depth = 92000
    with (anime_bg)
        image_alpha = 0
    power_up = -4
    disable_face = false
    enable_face = false
    set_queen_voice = 0
    laser_con = -1
    release_queen = 0
    queen_laugh_start = 0
    queen_laugh_stop = 0
    queen_release_fast = 0
    queen_leave_fast = 0
    platform_fall = 0
    hand_shake = 0
    hand_catch = 0
    cityscape_fall = 0
    if (scr_sideb_get_phase() >= 2)
    {
        var lay_id = layer_get_id("TILES")
        platform_y = layer_get_y(lay_id)
        platform_fall = 0
        platform_timer = 0
        raise_hands = 0
        for (var i = 0; i < 3; i++)
        {
            hand_platform[i] = scr_marker((1550 + (i * 100)), ((cameray() + view_hport[0]) + (sprite_get_height(spr_cutscene_26_hand_platform) / 2)), spr_cutscene_26_hand_platform)
            with (hand_platform[i])
            {
                image_xscale = 2
                image_yscale = 2
                depth = (1000300 - (i * 10))
            }
        }
    }
    queen_afterimage = 0
    queen_npc = -4
    ralsei_npc = -4
    kris_active = 0
    make_npc_a = 0
    make_npc_b = 0
    shake_hand = 0
    queen_surprised = 0
    queen_laugh_start = 0
    queen_laugh_stop = 0
    queen_leave = 0
    hand_release = 0
    hand_leave = 0
    su_struggle = 1
    su_shocked = 0
    su_look_left = 0
    su_look_right = 0
    su_grin_1 = 0
    su_grin_2 = 0
    su_squint_1 = 0
    su_squint_2 = 0
    su_concerned = 0
    ra_struggle = 1
    ra_huh = 0
    ra_look = 0
    ra_smile = 0
    ra_scared = 0
    ra_stern = 0
    ra_mu = 0
    ra_shake = 0
}
