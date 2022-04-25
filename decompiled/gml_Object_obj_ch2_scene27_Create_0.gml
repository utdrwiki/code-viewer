con = -1
customcon = 0
if (global.chapter != 2 || global.plot >= 171)
    instance_destroy()
else
{
    scr_tempsave()
    scr_losechar()
    if instance_exists(obj_caterpillarchara)
        instance_destroy(obj_caterpillarchara)
    blackall = scr_marker(-10, -10, spr_pixel_white)
    blackall.image_xscale = 999
    blackall.image_yscale = 999
    blackall.depth = 100
    blackall.image_blend = c_white
    pacifist_talk = 0
    npc_ralsei = instance_create(174, 208, obj_npc_sign)
    npc_ralsei.sprite_index = spr_ralsei_walk_down
    npc_ralsei.visible = false
    npc_susie = instance_create(234, 204, obj_npc_sign)
    npc_susie.sprite_index = spr_susie_down_dw
    npc_susie.visible = false
    npc_noelle = instance_create(295, 200, obj_npc_sign)
    npc_noelle.sprite_index = spr_noelle_walk_down_dw
    npc_noelle.visible = false
    npc_berdly = instance_create(353, 212, obj_npc_sign)
    npc_berdly.sprite_index = spr_cutscene_27_berdly_walk_down
    npc_berdly.visible = false
    berdly_power_up_start = 0
    berdly_power_up = 0
    berdly_power_up_cancel = 0
    static_queen = 0
    static_queen_stop = 0
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
    tender_goodbye = 0
    tender_cancel = 0
    tender_finish = 0
    noelle_qs = 0
    susie_qs = 0
    kris_qs = 0
    berdly_qs = 0
    set_queen_voice = 0
    queen_happy = 0
    queen_sad = 0
    hide_border = 0
    show_border = 0
}
