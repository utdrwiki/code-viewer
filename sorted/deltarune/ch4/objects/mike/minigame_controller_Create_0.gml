game_over = false;
with (obj_mike_controller)
{
    hand_type = 0;
    line_ypos = 0;
}
if (!i_ex(obj_tutorial_text))
    instance_create(0, 0, obj_tutorial_text);
var _m = instance_create(camerax() + 488, cameray() + 200, obj_mike_battle);
with (obj_mike_minigame_tv)
{
    switch (minigame)
    {
        case 1:
            _m.sprite_index = spr_mike_s;
            break;
        case 3:
            _m.sprite_index = spr_mike_m;
            break;
        case 2:
            _m.sprite_index = spr_mike_l;
            break;
    }
    if (minigame != 3)
    {
        with (other)
        {
            if (!i_ex(obj_volumebar))
                instance_create_depth(0, 0, depth + 2, obj_volumebar);
        }
    }
}
with (obj_mike)
{
    if (act == 3)
        _m.sprite_index = sprite_index;
}
hold_quit_timer = 0;
global.battleend = 0;
global.fighting = 1;
global.flag[9] = 1;
global.batmusic[1] = mus_loop_ext(global.batmusic[0], 1, 1);
finished = 0;
combo_buffer = 0;
countdown = 1800;
_cat_num_def[0] = 3;
_cat_time_def[0] = 30;
_cat_num[0] = _cat_num_def[0];
_cat_time[0] = _cat_time_def[0];
_grab_cats = 5;
if (!global.use_mic)
{
}
with (obj_mike_controller)
{
    battle_active = true;
    event_user(11);
}
if (instance_number(obj_heart) == 0)
{
    with (instance_create_depth(x, y, depth, obj_heart))
        visible = false;
}
gameover_timer = 0;
cave_speed = 1;
cave_speed2 = 1;
meteor_timer = 0;
meteor_max = 30;
cat_timer = 0;
cat_last_green = 0;
cat_max = 30;
cave_height = 120;
cave_y = 190;
cave_last_top = -1;
cave_last_bottom = -1;
fuel = 100;
last_fuel = 100;
cave_timer = 0;
cave_direction = 0;

create_wall = function(arg0, arg1, arg2, arg3)
{
    var _a = instance_create_depth(arg0, arg1, depth + 3, obj_cavern_wall);
    _a.image_xscale = arg2;
    _a.image_angle = arg3;
    return _a;
};

alarm[6] = 1;
retry_y = -64;
music_y = -64;
new_cat = 0;
music_on = true;
inv_mic = false;
bubble_timer = 0;
ball_side = choose(-1, 1);
score_next = 0;
last_score = 0;
hurt = 0;
life = 3;
msg_max = 0;
msg_current = 0;
msg_del = 1;
msg_cap = 1;
text = [];
text_current = 0;
text_last = choose(0, 1, 2);
text_skip = true;
myscore = 0;
new_hiscore = 0;
vis = 1;
alarm[1] = 6;
for (i = 0; i < 3; i++)
    pet_current[i] = 0;
score_timer = 0;
sign_side = choose(-1, 1);

wave_reset = function()
{
    applause_speed = 5;
    wave_timer = 60;
    wave_min = 120;
    wave_max = 150;
    wave_dist_min = 3;
    wave_dist_max = 3;
    wave_ang = 0;
    wave_double = 0;
    wave_y = 200;
};

wave_reset();
alarm[0] = 6;
flash = 1;
attacks = 0;
counter = -1;
pawtype = 0;
paw_aim = 0;
x = (camerax() + camerawidth()) / 2;
lastx = 0;
mid_attack = false;
mid_reload = 0;
paw_reload = 120;
current = 0;
canclick = false;
action = 0;
wave = 0;
last_wave = 3;
timer = 0;
move_party = false;
alpha = 0;
lastside = 3;
phase = 0;
mike = 0;
petting = 0;
txt_wait = 0;
last_talker = -1;
ending = false;
main_text = -1;
convo = 0;
talking = false;
mike_small = -1;
mike_medium = -1;
mike_big = -1;
combo = false;
text_speed = 2;
cat_max = 0;
cat_reload = 60;
cat_timer = 0;
playall = true;
display_hits = false;
for (i = 0; i < 16; i++)
    hits[i] = 0;
dog_x = -100;
dog_ind = 0;
dog_xs = 1;
dog_t = 0;
target = 0;
lasttarget = 0;
lasthp = global.hp[global.char[target]];

battle_text = function()
{
    with (obj_mike_minigame_tv)
        global.msg[0] = stringsetsubloc("* ~1\n* Pet Mike to play\n* Pet Kris to quit", string(name[minigame]), "obj_mike_minigame_controller_slash_Create_0_gml_185_0");
    scr_battletext_default();
    battlewriter.depth = -1;
};

battle_text();
tracker = 0;
plueyhealth = 3;
shelter_has_time_limit = false;
shelter_time_limit_max = 900;
shelter_time_limit_min = 100;
shelter_time_limit = shelter_time_limit_max;
shelter_current_time = 0;
shelter_current_time_eased = 99999;
has_shelter_on_left = true;
has_shelter_on_right = true;
cats_deposited = 0;
cats_bonus_timer = 0;
pluey_combo_chain = 0;
plueywater = instance_create(0, 0, obj_marker_fancy);
with (plueywater)
{
    depth = other.depth + 105;
    
    draw_func = function()
    {
        var contr = 240;
        if (!contr.shelter_has_time_limit)
            exit;
        var percent = contr.shelter_current_time_eased / contr.shelter_time_limit;
        var xx = (camerax() - 62) + ((current_time * 0.03) % 62);
        var eased_percent = ease_in_quart(clamp01(1 - percent), 0, 1, 1);
        if (contr.phase == 2 && contr.action == 1)
        {
            var yy = cameray() + 100 + (300 * max(percent, 0));
            for (var i = 0; i < 12; i++)
                draw_sprite_ext(spr_plueywater, 0, (xx + (62 * i)) - 31, yy, 2, 2, 0, c_aqua, eased_percent * 0.3);
        }
        var shake = sin(current_time / 250) * 2;
        draw_set_color(merge_color(c_aqua, c_white, (sin(current_time / 200) * 0.35) + 0.35));
        draw_set_font(scr_84_get_font("mainbig"));
        draw_set_alpha(eased_percent * 0.3);
        var str = stringsetloc("DANGER! RISING PLUEY LEVELS!", "obj_mike_minigame_controller_slash_Create_0_gml_246_0");
        draw_text(((camerax() + (0.5 * camerawidth())) - (0.5 * string_width(str))) + shake, cameray() + 60, str);
        draw_set_color(c_white);
        draw_set_alpha(1);
    };
}
