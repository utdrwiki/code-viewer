myinteract = 0;
talked = 0;
tempvar = 0;
image_speed = 0;
depthcancel = 0;
normalanim = 1;
remanimspeed = 0;
flag = 0;
extflag = 0;
alwaysanimate = false;
jpspecial = 0;
skip = false;
if (global.darkzone == 0)
{
    if (room == room_krisroom)
        sprite_index = spr_redwagon;
    if (room == room_torhouse)
    {
        sprite_index = spr_chairiel_empty;
        if (global.chapter == 1)
        {
            if (global.plot >= 250)
                sprite_index = spr_chairiel;
        }
        if (global.chapter == 4)
        {
            if (global.plot >= 40 && global.plot < 300)
                sprite_index = spr_chairiel;
        }
    }
    if (room == room_graveyard)
    {
        fence = scr_marker(81, 122, spr_npc_graveyardfence);
        with (fence)
            scr_depth();
        if (x < 30)
            sprite_index = spr_npc_bench;
    }
    if (room == room_hospital_lobby)
        sprite_index = spr_npc_nurse;
    if (room == room_hospital_rudy)
    {
        if (global.chapter == 1)
            sprite_index = spr_rudy_d;
        if (global.chapter >= 2)
            sprite_index = spr_rudy_l;
    }
    if (room == room_library)
        sprite_index = spr_normalnpc;
    if (room == room_townhall)
    {
        sprite_index = (global.chapter >= 4) ? spr_npc_businessguy_briefless : spr_npc_businessguy;
        if (x > 100)
        {
            sprite_index = spr_npc_receptionist;
            depth = 100010;
        }
        if (x > 200)
            sprite_index = spr_npc_politicsbear;
    }
    if (room == room_diner)
    {
        if (global.chapter == 1)
        {
            if (x < 120)
                sprite_index = spr_npc_cattiwaitress;
            if (x < 60)
                sprite_index = spr_npc_dragonfamily;
            if (x >= 120 && x <= 140)
                sprite_index = spr_npc_qc;
            if (y > 130)
            {
                if (x > 180)
                    sprite_index = spr_npc_dresslion;
                if (x > 240)
                {
                    sprite_index = spr_npc_greenfire;
                    depth = 4000;
                    depthcancel = 1;
                }
                if (x > 260)
                {
                    sprite_index = spr_npc_flanneldemon;
                    depth = 4000;
                    depthcancel = 1;
                }
            }
            if (y < 120)
            {
                if (x > 160)
                    sprite_index = spr_npc_most_improved_1997;
                if (x > 200)
                    sprite_index = spr_npc_icewolf;
            }
        }
        if (global.chapter >= 2)
        {
            if (y < 85)
                sprite_index = spr_npc_qc;
            if (x > 150 && x < 180 && y < 115)
                sprite_index = spr_jockington_lt;
            if (x > 80 && x < 120)
                sprite_index = spr_npc_cattiwaitress;
        }
    }
    if (room == room_town_south)
    {
        if (global.chapter == 1)
        {
            if (x > 560)
                sprite_index = spr_npc_donutcar;
            if (x > 720)
                sprite_index = spr_npc_snailcar;
        }
    }
    if (room == room_town_church)
    {
        if (global.chapter == 1)
            sprite_index = spr_npc_alvin;
        if (global.chapter >= 2)
        {
            if (x > 270 && y < 320)
                sprite_index = spr_npc_terry;
            if (x > 220 && x < 260 && y > 310)
                sprite_index = spr_npc_icecap_r;
            if (x > 230 && x < 245 && y > 300)
                sprite_index = spr_npc_icecap_g;
            if (x > 250 && x < 260 && y > 300)
                sprite_index = spr_npc_icecap_b;
            if (x > 380)
                sprite_index = spr_npc_rgbun;
            if (x > 400)
                sprite_index = spr_npc_rgdragon;
            if (x > 590)
                sprite_index = spr_npc_rabbitkid;
        }
    }
    if (room == room_town_mid)
    {
        if (x >= 1800 && x < 1840)
        {
            if (global.chapter == 1)
                sprite_index = spr_mkid_dt;
            else
                instance_destroy();
        }
        if (x >= 1900 && x < 1920)
        {
            if (global.chapter == 1)
                sprite_index = spr_snowy_dt;
            else
                instance_destroy();
        }
    }
    if (room == room_town_north)
    {
        if (global.chapter == 1)
        {
            if (x >= 480)
                sprite_index = spr_npc_catty;
            if (x >= 640)
                sprite_index = spr_npc_cattydad;
            if (x >= 880)
                sprite_index = spr_npc_bratty;
        }
    }
    if (room == room_beach)
    {
        if (global.chapter == 1)
        {
            if (x >= 60)
                sprite_index = spr_npc_rgbun;
            if (x >= 100)
                sprite_index = spr_npc_rgdragon;
        }
    }
}
if (room == room_flowershop_1f)
{
    if (global.chapter >= 2)
        sprite_index = spr_asgored;
    else
        instance_destroy();
}
if (room == room_lw_police)
{
    if (x > 80)
        sprite_index = spr_npc_napstablook_police_down;
    if (x > 140)
        sprite_index = spr_undyne_dt;
    if (x > 170)
    {
        sprite_index = spr_npc_prisoner_dog_m;
        depthcancel = 1;
    }
    if (x > 190)
    {
        sprite_index = spr_npc_prisoner_dog_f;
        depthcancel = 1;
    }
}
if (room == room_alphysalley)
    sprite_index = spr_npc_bratty;
if (room == room_lw_conbini)
{
    if (x > 280)
        sprite_index = spr_npc_diamond_tallboy;
    else
        sprite_index = spr_npc_milklooker;
}
if (room == room_lw_noellehouse_dess)
{
    sprite_index = spr_dess_guitar;
    if (global.plot >= 67)
        instance_destroy();
}
if (global.darkzone == 1)
{
    image_xscale = 2;
    image_yscale = 2;
    if (room == room_castle_tutorial)
    {
        if (global.chapter == 1)
            sprite_index = spr_dummynpc;
        if (global.chapter >= 2)
        {
            if (x > 760 && x < 780)
            {
                if (global.chapter == 2 && (global.plot < 200 || global.plot < 9))
                    sprite_index = spr_dummynpc;
                else
                    sprite_index = spr_mannequin_ralsei_nugu;
            }
        }
    }
    if (room == room_dw_ralsei_castle_front)
    {
        if (x >= 250 && y >= 430)
        {
            if (scr_get_total_recruits(2) >= 9)
                sprite_index = spr_npc_ballperson_wig;
            else
                sprite_index = spr_ballperson;
        }
        if (x >= 650)
        {
            sprite_index = spr_npc_jackperson_hat;
            x = 740;
            y = 225;
        }
        if (x >= 350 && y >= 430)
        {
            if (scr_get_total_recruits(2) >= 9)
            {
                sprite_index = spr_npc_nubert;
                image_xscale = -2;
                x = 410;
            }
            else
            {
                instance_destroy();
            }
        }
    }
    if (room == room_dw_castle_town)
    {
    }
    if (room == room_dw_castle_dungeon)
    {
        sprite_index = spr_king_left;
        depthcancel = 1;
    }
    if (room == room_dw_church_worshiproom)
    {
        sprite_index = spr_npc_church_wafer;
        image_xscale = -2;
    }
    if (room == room_dw_church_npcroom_pools1)
    {
        if (x < 340)
        {
            sprite_index = spr_npc_church_wafer;
            image_xscale = -2;
            extflag = "leftNPC";
        }
        else
        {
            sprite_index = spr_npc_church_wafer;
            extflag = "rightNPC";
        }
    }
}
if (depthcancel == 0)
    scr_depth();
