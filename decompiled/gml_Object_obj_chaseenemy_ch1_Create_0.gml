image_xscale = 2
image_yscale = 2
facing = 0
walk_index = 0
state = 0
alertcon = 0
alerttimer = 0
facetimer = 0
chasetype = 0
pacetype = 1
pacecon = 0
pacecon2 = 0
pacetimer = 0
targetx = 0
targety = 0
scr_depth_ch1()
radius = 200
moveradius = 160
pacespeed = 1
frozen = false
hadfrozen = false
offscreen_frozen = true
remspeed = 0
myencounter = 4
touchsprite = spr_diamondm_hurt_ch1
cancelwalk = false
eraser = false
touchflag = 0
ignoresolid = false
if (room == room_battletest_ch1)
    myencounter = 40
if (room == room_field1_ch1)
    myencounter = 4
if (room == room_field2_ch1)
{
    myencounter = 5
    if (global.flag[501] > 0)
        instance_destroy()
}
if (room == room_field_puzzle1_ch1)
{
    myencounter = 6
    radius = 200
    pacetype = 5
}
if (room == room_field_getsusie_ch1)
{
    myencounter = 7
    sprite_index = spr_smallchecker_front_ch1
    touchsprite = sprite_index
    pacetype = 6
    image_speed = 0.2
}
if (room == room_field4_ch1)
    myencounter = 33
if (room == room_field_secret1_ch1)
{
    sprite_index = spr_jigsawry_idle_ch1
    touchsprite = spr_jigsawry_idle_ch1
    myencounter = 23
    if (global.plot < 130)
        instance_destroy()
}
if (room == room_forest_area0_ch1)
{
    sprite_index = spr_rabbick_enemy_overworld_ch1
    myencounter = 16
    touchsprite = spr_rabbick_enemy_overworld_ch1
    alertcon = -1
    pacetype = 10
}
if (room == room_forest_area1_ch1 || room == room_forest_area3_ch1 || room == room_forest_secret1_ch1)
{
    pacetype = 7
    sprite_index = spr_rabbick_enemy_overworld_ch1
    if (room == room_forest_area1_ch1)
        pacetype = 11
    myencounter = 17
    touchflag = 505
    touchsprite = spr_rabbick_enemy_overworld_ch1
    if (room == room_forest_area3_ch1)
        myencounter = 24
    if (room == room_forest_secret1_ch1)
        myencounter = 32
    alertcon = -1
}
if (room == room_forest_maze1_ch1)
{
    touchflag = 505
    sprite_index = spr_rabbick_enemy_overworld_ch1
    myencounter = 17
    touchsprite = spr_rabbick_enemy_overworld_ch1
    pacetype = 1
    if (global.flag[505] == 1)
        chasetype = 3
}
if (room == room_forest_maze2_ch1)
{
    touchflag = 506
    myencounter = 18
    sprite_index = spr_blockguy_overworld_ch1
    touchsprite = spr_blockguy_overworld_ch1
    pacetype = 1
    if (global.flag[506] == 1)
        chasetype = 3
    else
        chasetype = 4
}
if (room == room_forest_beforeclover_ch1)
{
    myencounter = 18
    sprite_index = spr_blockguy_overworld_ch1
    touchsprite = spr_blockguy_overworld_ch1
    pacetype = 7
    alertcon = -1
}
if (room == room_forest_area4_ch1)
{
    myencounter = 19
    sprite_index = spr_blockguy_overworld_ch1
    touchsprite = spr_blockguy_overworld_ch1
    pacetype = 7
    if (x < (room_width / 2))
        pacetype = 7.5
    eraser = true
    touchflag = 506
    chasetype = 4
    radius = 90
    ignoresolid = true
    offscreen_frozen = false
    if (global.flag[506] >= 1)
        alertcon = -1
}
if (room == room_cc_1f_ch1)
{
    pacetype = 9
    chasetype = 4
    moveradius = 160
    sprite_index = spr_daimond_knight_idle_ch1
    myencounter = 28
    touchsprite = spr_daimond_knight_idle_ch1
    touchflag = 507
    if (global.flag[507] == 1)
        alertcon = -1
}
if (room == room_cc_3f_ch1)
{
    eraser = true
    ignoresolid = true
    chasetype = 4
    pacetype = 9
    radius = 165
    moveradius = 160
    if (x >= (room_width / 2))
        moveradius = -160
    sprite_index = spr_hathyx_overworld_ch1
    myencounter = 30
    touchsprite = spr_hathyx_overworld_ch1
    offscreen_frozen = false
    touchflag = 508
    if (global.flag[508] == 1)
        alertcon = -1
}
