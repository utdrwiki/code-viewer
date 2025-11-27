alarm[1] = 30;
shootout_type = 0;
shootout_endtimer = 0;
endminigame = false;
endminigametimer = 0;
stopspawns = false;
totalhits = 0;
obj_mainchara.cutscene = 1;
obj_mainchara.freeze = 1;
train_x_prev = 9000;
train_x_target = 9000;
train_x = 9000;
train_y = 30;
shootout_carriages = [];
for (var _i = 0; _i < 9; _i++)
{
    var _cx = _i * 600;
    var _carriage = instance_create_depth(_cx, train_y, depth + 2, obj_shootout_carriage);
    if ((_i % 3) == 2)
    {
        _carriage.sprite_index = spr_shootout_train_new;
        _carriage.wave = array_length(shootout_carriages) + 1;
        array_push(shootout_carriages, _carriage);
    }
}
current_train = shootout_carriages[0];
state = "intro";
timer = 0;
wave_duration = 1800;
wave = 1;
speedfactor = 1;
pattern = -1;
pattern_prev = 0;
pattern_timer = -90;
if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity == true)
    alarm[1] = 0;
pattern_performed = [];
points = 0;
insanitytimer = 0;
windows = [];
window_columns = 3;
window_rows = 3;
tutorialorder = 0;
shootoutpointvar = 0;
for (var _xx = 0; _xx < window_columns; _xx++)
{
    windows[_xx] = [];
    for (var _yy = 0; _yy < window_rows; _yy++)
    {
        var _window_x = (80 + (_xx * 50)) * 2;
        var _window_y = (20 + (_yy * 48)) * 2;
        var _window = instance_create_depth(train_x + _window_x, train_y + _window_y, depth + 1, obj_shootout_window);
        _window.x_offset = _window_x;
        _window.y_offset = _window_y;
        _window.column = _xx;
        _window.row = _yy;
        windows[_xx][_yy] = _window;
    }
}
current_window_column = 1;
current_window_row = 1;
current_window = windows[current_window_column][current_window_row];
aim_x = current_window.x;
aim_y = current_window.y;
kris_hp = 5;
kris_state = "idle";
kris_timer = 0;
kris_actionable = false;
kris_can_shoot = true;
kris_invincible = false;
kris_jump_held = false;
kris_x = -100;
kris_x2 = 0;
kris_y_ground = 380;
kris_y = kris_y_ground;
kris_vy = 0;
dust_timer = 0;
instance_create_depth(80, kris_y, depth - 3, obj_shootout_susie);
instance_create_depth(80, kris_y, depth - 3, obj_shootout_kris);
instance_create_depth(80, kris_y, depth - 2, obj_shootout_horse);
hazard_warning = -1;
tennatimer = 0;
damage = 10;
target = 3;
reticle_index = 0;
susietimer = 0;
if (!i_ex(obj_tenna_enemy))
{
    with (obj_darkcontroller)
        charcon = 1;
}
windowdelay = 28;
if (i_ex(obj_tenna_enemy) && obj_tenna_enemy.cowboy1tooknodamage == true)
    windowdelay = 23;
beatwithoutgettinghit = true;
wreticle_x = 0;
wreticle_y = 0;
tutorialmode = false;
hitcount = 0;
if (!i_ex(obj_ch3_GSD03))
{
    state = "main";
    train_x_target = -1050;
    kris_actionable = true;
}
else
{
    tutorialmode = true;
}
kris_x = 80;
krishit = false;
hitwindow = false;
invtimer = 0;
minigameend = 0;
windowcount = 0;
music_init = 0;
music_init_timer = 0;
with (obj_shootout_carriage)
{
    x = obj_shootout_controller.train_x + x_offset;
    y = obj_shootout_controller.train_y + ((cos(x_offset + ((current_time * obj_shootout_controller.wave) / 200)) * 0.5) + 0.5);
}
var _jump_y_offset = min((kris_y_ground - kris_y) * 0.15, 8);
with (obj_shootout_kris)
{
    x = obj_shootout_horse.x + 68;
    y = obj_shootout_horse.y - 66 - _jump_y_offset;
}
with (obj_shootout_susie)
{
    x = obj_shootout_horse.x + 38;
    y = obj_shootout_horse.y - 72 - _jump_y_offset;
}
insanity_windows_hit = 0;
