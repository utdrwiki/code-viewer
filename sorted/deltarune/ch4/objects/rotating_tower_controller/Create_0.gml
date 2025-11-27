if (room == room_dw_rotating_tower || room == room_dw_3d_tower_test || room == room_dw_titan_tower_test)
    global.flag[23] = 1;
depth = obj_mainchara.depth + 1;
tower_angle = 0;
yoffset = 480;
tower_angle_prev = tower_angle;
yoffset_prev = yoffset;
maincharayprevious = obj_mainchara.y;
towerpiececount = 500;
tower_image_index = 0;
timer = 0;
angle_extra = 0;
shake_timer = 0;
camerayoffset = 0;
tower_type = 0;
wide_tower = false;
i = 0;
ii = 0;
for (i = 0; i < 75; i += 1)
{
    tower_angle_record[i] = tower_angle;
    yoffset_record[i] = yoffset;
}
using_rotating_caterpillars = false;
shake_count = 0;
render_ypos_start_shake = 0;
render_ypos_end_shake = 0;
tower_falls_apart_i = 0;
tower_falls_apart_con = 0;
tower_falls_apart_timer = 0;
tower_falls_apart_i_dog = 0;
tower_falls_apart_timer_dog = 0;
rising_shadow_x = 0;
xstart_init = 0;
endclimb = false;
endclimbcon = 0;
endclimbtimer = 0;
doghasfallen = false;
renderalt = false;
eyesmoketimer = 0;
eyecalculate = 0;
if (room == room_dw_3d_tower_test)
{
    tower_type = 2;
    wide_tower = true;
    instance_create_depth(0, 0, 100000, obj_rotating_fg_controller);
}
if (room == room_dw_titan_tower_test)
    wide_tower = true;
var _towersprite = 5713;
if (tower_type == 2)
    _towersprite = 4168;
if (wide_tower == true)
    _towersprite = 861;
for (i = 0; i < towerpiececount; i++)
{
    tower_piece_sprite[i] = _towersprite;
    if (room == room_dw_church_dogclimb)
        tower_piece_sprite_dog[i] = _towersprite;
    tower_piece_image_index[i] = 0;
    tower_xoffset[i] = 0;
    tower_siner[i] = 0;
    tower_object[i][7] = 0;
    for (ii = 0; ii < 10; ii++)
    {
        _x[i][ii] = (x - 110) + (ii * 20);
        xscale[i][ii] = 1;
        _vis[i][ii] = true;
        mathtype[i][ii] = 0;
    }
    if (room == room_dw_titan_tower_test)
    {
        tower_object[i][10] = 0;
        if (tower_angle >= 190 && tower_angle < 350)
            vis[i][0] = false;
        else
            vis[i][0] = true;
        if (tower_angle >= 225 || tower_angle < 25)
            vis[i][1] = false;
        else
            vis[i][1] = true;
        if (tower_angle >= 260 || tower_angle < 60)
            vis[i][2] = false;
        else
            vis[i][2] = true;
        if (tower_angle >= 295 || tower_angle < 95)
            vis[i][3] = false;
        else
            vis[i][3] = true;
        if (tower_angle >= 330 || tower_angle < 130)
            vis[i][4] = false;
        else
            vis[i][4] = true;
        if (tower_angle > 5 && tower_angle < 165)
            vis[i][5] = false;
        else
            vis[i][5] = true;
        if (tower_angle > 40 && tower_angle < 200)
            vis[i][6] = false;
        else
            vis[i][6] = true;
        if (tower_angle > 75 && tower_angle < 235)
            vis[i][7] = false;
        else
            vis[i][7] = true;
        if (tower_angle > 110 && tower_angle < 270)
            vis[i][8] = false;
        else
            vis[i][8] = true;
        if (tower_angle > 145 && tower_angle < 305)
            vis[i][9] = false;
        else
            vis[i][9] = true;
    }
    tower_eyedrip[i][10] = 0;
    tower_eyeoffset[i] = 0;
}
if (room == room_dw_rotating_tower || room == room_dw_church_statueroom)
    event_user(0);
if (room == room_dw_church_dogclimb)
    event_user(1);
if (room == room_dw_titan_tower_test)
    event_user(2);
piececount = 7;
if (wide_tower)
    piececount = 9;
ladder_index = 4;
xx = 0;
vis = false;
towerback = false;
piecemaxdistance = 70;
if (wide_tower)
    piecemaxdistance = 110;
_tower_angle = tower_angle;
laddersprite = 5084;
stepssprite = 5714;
rocksprite = 1902;
eyesprite = 5370;
eyedripsprite = 2654;
if (wide_tower)
{
    laddersprite = 4785;
    stepssprite = 1308;
    rocksprite = 4829;
    eyesprite = 5130;
    eyedripsprite = 4973;
}
