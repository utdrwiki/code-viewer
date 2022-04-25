myinteract = 0
talked = false
tempvar = 0
image_speed = 0
depthcancel = false
normalanim = 1
remanimspeed = 0
if (global.darkzone == false)
{
    if (room == room_krisroom_ch1)
        sprite_index = spr_redwagon_ch1
    if (room == room_torhouse_ch1)
    {
        sprite_index = spr_chairiel_empty_ch1
        if (global.plot >= 250)
            sprite_index = spr_chairiel_ch1
    }
    if (room == room_graveyard_ch1)
    {
        sprite_index = spr_npc_bench_ch1
        fence = scr_marker_ch1(81, 122, spr_npc_graveyardfence_ch1)
        with (fence)
            scr_depth_ch1()
    }
    if (room == room_hospital_lobby_ch1)
        sprite_index = spr_npc_nurse_ch1
    if (room == room_hospital_rudy_ch1)
        sprite_index = spr_rudy_d_ch1
    if (room == room_library_ch1)
        sprite_index = spr_normalnpc_ch1
    if (room == room_townhall_ch1)
    {
        sprite_index = spr_npc_businessguy_ch1
        if (x > 100)
            sprite_index = spr_npc_receptionist_ch1
        if (x > 200)
            sprite_index = spr_npc_politicsbear_ch1
    }
    if (room == room_diner_ch1)
    {
        if (x < 120)
            sprite_index = spr_npc_cattiwaitress_ch1
        if (x < 60)
            sprite_index = spr_npc_dragonfamily_ch1
        if (x >= 120 && x <= 140)
            sprite_index = spr_npc_qc_ch1
        if (y > 130)
        {
            if (x > 180)
                sprite_index = spr_npc_dresslion_ch1
            if (x > 240)
            {
                sprite_index = spr_npc_greenfire_ch1
                depth = 4000
                depthcancel = true
            }
            if (x > 260)
            {
                sprite_index = spr_npc_flanneldemon_ch1
                depth = 4000
                depthcancel = true
            }
        }
        if (y < 120)
        {
            if (x > 160)
                sprite_index = spr_npc_most_improved_1997_ch1
            if (x > 200)
                sprite_index = spr_npc_icewolf_ch1
        }
    }
    if (room == room_town_south_ch1)
    {
        if (x > 560)
            sprite_index = spr_npc_donutcar_ch1
        if (x > 720)
            sprite_index = spr_npc_snailcar_ch1
    }
    if (room == room_town_church_ch1)
        sprite_index = spr_npc_alvin_ch1
    if (room == room_town_mid_ch1)
    {
        if (x >= 1800)
            sprite_index = spr_mkid_dt_ch1
        if (x >= 1900)
            sprite_index = spr_snowy_dt_ch1
    }
    if (room == room_town_north_ch1)
    {
        if (x >= 480)
            sprite_index = spr_npc_catty_ch1
        if (x >= 640)
            sprite_index = spr_npc_cattydad_ch1
        if (x >= 880)
            sprite_index = spr_npc_bratty_ch1
    }
    if (room == room_beach_ch1)
    {
        if (x >= 60)
            sprite_index = spr_npc_rgbun_ch1
        if (x >= 100)
            sprite_index = spr_npc_rgdragon_ch1
    }
}
if (global.darkzone == true)
{
    image_xscale = 2
    image_yscale = 2
    if (room == room_castle_tutorial_ch1)
        sprite_index = spr_dummynpc_ch1
    if (room == room_field2A_ch1 || room == room_field_puzzle1_ch1 || room == room_field4_ch1)
        sprite_index = spr_candytree_ch1
    if (room == room_field_topchef_ch1)
    {
        sprite_index = spr_topchef_ch1
        if (y <= 120)
        {
            sprite_index = spr_smoldercake_ch1
            alarm[11] = 1
        }
    }
    if (room == room_field_puzzletutorial_ch1)
    {
        sprite_index = spr_npc_puzzlepiece_ch1
        if (global.flag[251] == 1)
            instance_destroy()
    }
    if (room == room_field_maze_ch1)
    {
        if (x < 1600)
            sprite_index = spr_jigsawry_idle_ch1
        if (x > 1600)
            sprite_index = spr_lancer_dt_ch1
    }
    if (room == room_field_boxpuzzle_ch1)
        sprite_index = spr_npc_block_broken_ch1
    if (room == room_field_checkers7_ch1)
    {
        if (x <= (room_width / 2))
        {
            sprite_index = spr_npc_mrelegance_ch1
            if (global.plot >= 60)
                instance_destroy()
        }
        else
            sprite_index = spr_npc_mrsociety_ch1
    }
    if (room == room_forest_savepoint1_ch1)
    {
        if (x <= (room_width / 2))
        {
            sprite_index = spr_npc_puzzlepiece_ch1
            if (global.flag[251] == 0)
                instance_destroy()
        }
        else
            sprite_index = spr_npc_mrelegance_ch1
    }
    if (room == room_forest_area1_ch1)
        sprite_index = spr_diamond_overworld_ch1
    if (room == room_forest_area2A_ch1)
    {
        if (x <= (room_width / 2))
            sprite_index = spr_jackperson_ch1
        if (x >= (room_width / 2))
            sprite_index = spr_ballperson_ch1
    }
    if (room == room_forest_area3A_ch1)
    {
        if (x <= (room_width / 2))
            sprite_index = spr_blockler_b_ch1
        if (x >= (room_width / 2))
            sprite_index = spr_blockler_o_ch1
    }
    if (room == room_forest_savepoint2_ch1)
    {
        sprite_index = spr_bakesale_rudinn_ch1
        if (x >= 800 && x <= 880)
            sprite_index = spr_bakesale_hathy_ch1
        if (x >= 980)
            sprite_index = spr_bakesale_lancer_ch1
    }
    if (room == room_forest_area4_ch1)
        sprite_index = spr_npc_coody_ch1
    if (room == room_forest_starwalker_ch1)
        sprite_index = spr_npc_originalstarwalker_ch1
    if (room == room_forest_savepoint_relax_ch1)
    {
        if (x <= 200)
            sprite_index = spr_diamond_overworld_ch1
        if (x > 260)
        {
            if (global.plot >= 90)
                instance_destroy()
            if (y >= 240)
                sprite_index = spr_lancer_dark_relax_ch1
            else
                sprite_index = spr_susie_dark_relax_ch1
        }
    }
    if (room == room_forest_fightsusie_ch1)
    {
        sprite_index = spr_lancer_dt_ch1
        if (global.plot >= 150)
            instance_destroy()
    }
    if (room == room_cc_prison_cells_ch1)
        sprite_index = spr_diamond_trash_ch1
    if (room == room_cc_prison2_ch1)
    {
        global.flag[296] = 1
        sprite_index = spr_npc_gouldensam_ch1
        if (x > 240 && x < 440)
        {
            king = instance_create_ch1(-100, -100, obj_npc_room_ch1)
            king.x = x
            king.y = y
            king.sprite_index = spr_npc_cage_king_ch1
            scr_depth_ch1()
            king.depth = (depth - 10)
        }
        if (x > 480 && x < 680)
        {
            x += 4
            puzz = instance_create_ch1(-100, -100, obj_npc_room_ch1)
            puzz.x = 660
            puzz.y = 130
            puzz.sprite_index = spr_npc_puzzlepiece_jail_ch1
            tempvar = 1
        }
        if (x > 680 && x < 900)
        {
            x += 8
            rudinn = instance_create_ch1(-100, -100, obj_npc_room_ch1)
            rudinn.x = 900
            rudinn.y = 115
            rudinn.sprite_index = spr_diamond_overworld_ch1
            tempvar = 2
        }
        if (x > 900 && x < 1120)
        {
            x += 12
            tempvar = 3
            animal = instance_create_ch1(-100, -100, obj_npc_room_ch1)
            animal.x = x
            animal.y = y
            animal.sprite_index = spr_npc_cage_animals_ch1
        }
    }
    if (room == room_cc_rudinn_ch1)
        sprite_index = spr_diamond_overworld_ch1
    if (room == room_cc_rurus1_ch1)
        sprite_index = spr_diamond_overworld_ch1
    if (room == room_cc_hathy_ch1)
        sprite_index = spr_heartenemy_overworld_ch1
    if (room == room_cc_rurus2_ch1)
        sprite_index = spr_diamond_overworld_ch1
    if (room == room_cc_clover_ch1)
    {
        sprite_index = spr_clubs_overworld_ch1
        if (x < 160)
            sprite_index = spr_diamond_overworld_ch1
        if (x > 400)
            sprite_index = spr_heartenemy_overworld_ch1
    }
    if (room == room_cc_throneroom_ch1)
    {
        if (global.plot < 240)
            instance_destroy()
        else if (y < 300 && y > 80)
        {
            sprite_index = spr_npc_gouldensam_ch1
            if (x < (room_width / 2))
            {
                king = instance_create_ch1(-100, -100, obj_npc_room_ch1)
                king.x = x
                king.y = y
                king.sprite_index = spr_npc_cage_king_ch1
                scr_depth_ch1()
                king.depth = (depth - 10)
            }
            else
            {
                tempvar = 1
                animal = instance_create_ch1(-100, -100, obj_npc_room_ch1)
                animal.x = x
                animal.y = y
                animal.sprite_index = spr_npc_cage_animals_ch1
            }
        }
        else if (x < (room_width / 2))
            sprite_index = spr_diamond_overworld_ch1
        else
            sprite_index = spr_topchef_ch1
    }
    if (room == room_cc_preroof_ch1)
    {
        if (global.plot < 240)
            instance_destroy()
        if (x > 180)
            sprite_index = spr_diamond_overworld_ch1
        if (x > 320)
            sprite_index = spr_heartenemy_overworld_ch1
        if (x > 460)
            sprite_index = spr_clubs_overworld_ch1
        if (x > 680)
            sprite_index = spr_diamond_overworld_ch1
    }
    if (room == room_cc_kingbattle_ch1)
    {
        if (global.plot < 240)
            instance_destroy()
        if (x < 440)
            sprite_index = spr_rurus_idle_ch1
        if (y < 160)
        {
            if (x == 398)
                sprite_index = spr_npc_mrsociety_ch1
            if (x == 522)
                sprite_index = spr_npc_mrelegance_ch1
            if (x == 740)
                sprite_index = spr_blockler_b_ch1
            if (x == 820)
                sprite_index = spr_blockler_o_ch1
            if (x == 940)
                sprite_index = spr_blockler_o_ch1
            if (x == 1020)
                sprite_index = spr_blockler_b_ch1
            if (x > 1140)
            {
                sprite_index = spr_npc_puzzlepiece_happy_ch1
                if (global.flag[216] == 1)
                    sprite_index = spr_npc_puzzlepiece_shaved_ch1
            }
        }
        else if (x < 900)
            sprite_index = spr_jackperson_ch1
        else
            sprite_index = spr_ballperson_ch1
    }
}
if (depthcancel == false)
    scr_depth_ch1()
