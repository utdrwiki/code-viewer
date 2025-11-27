if (!variable_global_exists("mic_sensitivity"))
    global.mic_sensitivity = global.flag[1701];
__usable = true;
audio_record = -4;
instance_create_depth(0, 0, depth - 6, obj_mike_hand);
battle_active = false;

reset_control = function()
{
    battle_test = false;
    show_controls = true;
    type = 5;
    last_type = type;
    reload = 0;
    phase = 0;
    vis = true;
    wingbox_volume_thereshold = 1;
    line_width = 140;
    line_height = 0;
    line_xpos = 0;
    line_ypos = -32;
    line_side = choose(1, -1);
    for (i = 0; i < 36; i++)
        line_y[i] = line_ypos + (cameray() + (cameraheight() / 2));
    circle_width = 120;
    circle_height = round(circle_width * 0.75);
    circle_offset = -32;
    grazenoise = 0;
    swatnoise = 0;
    sign_xstart = camerax() + (camerawidth() / 2);
    sign_ystart = cameray() - 100;
    sign_x = sign_xstart;
    sign_y = sign_ystart;
    sign_col = 8421504;
    sign_index = 0;
    sign_action = 0;
    sign_vspeed = 0;
    sign_bounce = 0;
    sign_sound = 0;
    sign_x2 = sign_xstart;
    sign_y2 = sign_ystart;
    sign_col2 = 8421504;
    sign_action2 = 0;
    var i = 0;
    hand_sprite[i++] = spr_mike_hand;
    hand_sprite[i++] = spr_mike_grab1;
    hand_sprite[i++] = spr_mike_grab2;
    hand_sprite[i++] = spr_mike_give1;
    hand_sprite[i++] = spr_mike_give2;
    hand_sprite[i++] = spr_mike_ouch;
    hand_sprite[i++] = spr_mike_grab3;
    hand_xscale = 1;
    hand_speed = 0;
    hand_type = 0;
    hand_shake = 0;
    hand_act = 0;
    hand_target = -1;
    msx = 0;
    msy = 0;
    hand_fruit = -1;
    fruit_scale = 0;
    fruit_scale2 = 0;
    fruit_scale3 = 0;
    if (instance_number(obj_mainchara) == 1)
    {
        x = obj_mainchara.x;
        y = obj_mainchara.y;
    }
    mx = x;
    my = y;
    hand_anim = 10;
    hand_distance = 140;
    hand_angle = 0;
    hand_yscale = 1;
    hand_yscale2 = 1;
    hand_wait = 0;
    wait = 0;
};

reset_control();
battlewriter = 19212912;
myface = 1913918291;
tp = 0;
tpy = 50;
bp = 0;
bpy = 152;
intro = 1;
bcolor = merge_color(c_purple, c_black, 0.7);
bcolor = merge_color(bcolor, c_dkgray, 0.5);
for (i = 0; i < 3; i += 1)
{
    global.acting[i] = 0;
    global.actingsingle[i] = 0;
    global.actingsimul[i] = 0;
    global.actingtarget[i] = 0;
    global.actingchoice[i] = 0;
    global.charaction[i] = 0;
    global.charspecial[i] = 0;
    global.chartarget[i] = 0;
    global.faceaction[i] = 0;
    global.rembmenuno[i] = 0;
    global.targeted[i] = 0;
    global.battleat[i] = global.at[global.char[i]] + global.itemat[global.char[i]][0] + global.itemat[global.char[i]][1] + global.itemat[global.char[i]][2];
    global.battledf[i] = global.df[global.char[i]] + global.itemdf[global.char[i]][0] + global.itemdf[global.char[i]][1] + global.itemdf[global.char[i]][2];
    global.battlemag[i] = global.mag[global.char[i]] + global.itemmag[global.char[i]][0] + global.itemmag[global.char[i]][1] + global.itemmag[global.char[i]][2];
    global.battleactcount[i] = 0;
    global.monsterattackname[i] = " ";
    for (j = 0; j < 18; j++)
    {
        global.battlespell[i][j] = 0;
        global.battlespellname[i][j] = " ";
        global.battlespelldesc[i][j] = " ";
        global.battlespellcost[i][j] = 0;
        global.battlespelltarget[i][j] = 2;
        global.battlespellspecial[i][j] = 0;
    }
}
mmy[0] = 0;
mmy[1] = 0;
mmy[2] = 0;
mmy[3] = 0;
slmxx = 0;
slmyy = 0;
s_siner = 0;
t_siner = 0;
reset = 0;
timeron = 1;
noreturn = 0;
hpcolor[0] = c_aqua;
hpcolor[1] = c_fuchsia;
hpcolor[2] = c_lime;
hpcolor[3] = c_yellow;
xx = camerax();
yy = cameray();
newx = camerax() + (camerawidth() / 2);
newy = cameray() + (cameraheight() / 2) + line_ypos;
dir = 270;
new_dir = 270;
phase = 0;
circle_distance = 100;
for (i = 0; i < 36; i++)
{
    circle_xx[i] = camerax() + (camerawidth() / 2) + lengthdir_x(circle_distance, (i / 36) * 360);
    circle_yy[i] = (cameray() + (cameraheight() / 2) + lengthdir_y(circle_distance * 0.75, (i / 36) * 360)) - 32;
    circle_speed[i] = 0;
}
size1 = 0;
size2 = 31;
size3 = 10;
wing_angle1 = 180;
wing_angle2 = 180;
wing_angle3 = 0;
microphone_volume = 0;
microphone_volume2 = 0;
us_old = -1;
mic_buff = 0;
event_user(9);
var recordercount = audio_get_recorder_count();
debug_print("audio recorder count=" + string(recordercount));
if (recordercount <= 0)
{
    if (scr_debug())
        scr_debug_print("No Microphone!");
}
if (!variable_global_exists("right_click_mic"))
    global.right_click_mic = 0;
if (!variable_global_exists("use_mic"))
    global.use_mic = !(global.is_console || onSteamDeck());
if (global.use_mic && room != room_dw_castle_tv_zone_3)
{
    if (!variable_global_exists("microphone"))
        global.microphone = 0;
    audio_record = audio_start_recording(global.microphone);
    audio_buffer = buffer_create(9600, buffer_fixed, 2);
}
if (!variable_global_exists("microphone"))
    global.microphone = 0;
if (global.microphone > audio_get_recorder_count())
    global.microphone = 0;
x_target = 0;
y_target = 0;
speedx = 0;
speedy = 0;
prevx = x;
prevy = y;
