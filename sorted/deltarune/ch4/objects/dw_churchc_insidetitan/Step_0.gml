if (con < 0)
    exit;
if (con == 0)
{
    con = 1;
    alarm[0] = 2;
    snd_stop_all();
    global.interact = 1;
    global.facing = 0;
    background = instance_create(0, 0, obj_dw_churchc_insidetitan_background);
    background.depth = 100000;
    rumble = snd_play_volume(snd_rumble, 0);
    global.plot = 259;
    fall_speed = 0;
    debug_print("background created");
    var _trail = instance_create(kris.x, kris.y, obj_darkness_trail);
    _trail.target = kris;
    _trail.xoff = 0;
    _trail.yoff = 0;
    _trail.depth = depth + 10;
    _trail = instance_create(susie.x, susie.y, obj_darkness_trail);
    _trail.target = susie;
    _trail.xoff = 0;
    _trail.yoff = 0;
    _trail.depth = depth + 10;
    for (var i = 0; i < 13; i++)
    {
        var _ball = instance_create((camerax() + 640) - (i * 70), cameray() + bottom, obj_make_fountain_ball_titan);
        _ball.topper = true;
        _ball.image_xscale = 2;
        _ball.image_yscale = 2;
        _ball.siner = random(20);
        _ball.hspeed = 3;
        _ball.depth = depth - 5;
        _ball.friction = 0;
        _ball.gravity = 0;
        _ball.vspeed = 0;
        _ball.type = 1;
        _ball.bounce = randomsign();
    }
}
if (con == 2)
{
    con = 10;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_customfunc(function()
    {
        rumble = snd_loop(snd_rumble);
        snd_volume(rumble, 0, 0);
        snd_volume(rumble, 0.5, 40);
    });
    c_wait(20);
    c_var_lerp_to_instance(fade, "image_alpha", 0, 80);
    c_var_instance(id, "fall_speed", 1/30);
    c_wait(80);
    var _xease = 30;
    c_var_lerp_to_instance(id, "kris_y", 600, _xease, 2, "out");
    c_var_lerp_to_instance(id, "extra_y", 50, _xease, 2, "in");
    c_var_lerp_to_instance(id, "susie_y", 600, _xease, 2, "out");
    c_var_lerp_to_instance(id, "fall_speed", 1, _xease, 5, "in");
    c_var_lerp_to_instance(1229, "fall_speed", 2, 30);
    c_wait(5);
    c_var_lerp_to_instance(id, "spread", 50, 300);
    c_customfunc(function()
    {
        with (obj_darkness_trail)
        {
        }
    });
    c_wait(5);
    c_snd_play_x(snd_dark_odd, 1, 0.5);
    c_snd_play_x(snd_dark_odd, 1, 0.4);
    c_wait(_xease - 10);
    c_var_lerp_to_instance(id, "kris_y", 240, 40, 2, "inout");
    c_var_lerp_to_instance(id, "susie_y", 240, 40, 2, "inout");
    c_var_lerp_to_instance(id, "extra_y", 0, 40, 2, "out");
    c_wait(10);
    c_var_lerp_to_instance(id, "siner", 282.74333882308133, 380, 2, "inout");
    c_var_lerp_to_instance(id, "gap", 70, 380, 2, "inout");
    c_customfunc(function()
    {
        susie_y = susie.y;
        kris_y = kris.y;
        spin = true;
    });
    c_wait(35);
    c_var_lerp_to_instance(id, "kris_angle", 0, 180, 2, "inout");
    c_var_lerp_to_instance(id, "susie_angle", 0, 180, 2, "inout");
    c_customfunc(function()
    {
        scr_lerp_imageblend(kris, c_white, c_black, 240);
        scr_lerp_imageblend(susie, c_white, c_black, 240);
    });
    c_wait(85);
    c_var_lerp_to_instance(id, "fall_speed", 0, 90);
    c_var_lerp_to_instance(kris, "image_speed", 0.15, 60);
    c_var_lerp_to_instance(susie, "image_speed", 0.15, 60);
    c_wait(50);
    c_snd_play(snd_great_shine);
    c_customfunc(function()
    {
        heart.visible = true;
        heart.x = kris.x;
        heart.y = kris.y;
        heart.con = 1;
    });
    c_wait(20);
    c_move_to_instance(heart, 320, 252, 40, 2, "inout");
    c_wait(120);
    c_lerp_var_instance(kris_over, "image_alpha", 0, 1, 20);
    c_lerp_var_instance(susie_over, "image_alpha", 0, 1, 20);
    c_var_instance(heart, "con", 2);
    c_wait(20);
    c_var_add_instance(heart, "depth", -2);
    c_wait(10);
    c_var_instance(id, "spawner", 999999);
    c_wait(10);
    c_var_lerp_instance(id, "shake", 1, 2, 30);
    c_wait(10);
    c_customfunc(function()
    {
        snd_volume(rumble, 0, 60);
    });
    c_wait(20);
    c_var_lerp_instance(id, "shake", 2, 0, 10);
    c_wait(150);
    c_actortokris();
    c_actortocaterpillar();
    c_var_instance(id, "con", 50);
}
if (con == 50 && !i_ex(obj_cutscene_master))
{
    con = -1;
    debug_print("scene done!");
    snd_free_all();
    pers = instance_create(0, 0, obj_persistentfadein);
    pers.image_blend = c_white;
    pers.fadespeed = -0.02;
    global.interact = 0;
    global.facing = 0;
    room_goto(room_dw_churchc_titandefeated);
}
if (con <= 1)
    exit;
var _krisfall = kris_y;
var _susiefall = susie_y;
var _kris_spin = kris.sub_index;
var _susie_spin = susie.sub_index;
if (spin)
{
    var _sin = sin(siner / 30);
    var _cos = cos(siner / 30);
    _krisfall = kris_y + (_sin * 10);
    _susiefall = susie_y - (_sin * 10);
    kris.depth = depth - (round(_sin * 2) * 2);
    susie.depth = depth + (round(_sin * 2) * 2);
    kris.x = ((camerax() + 320) - (_cos * gap)) + xoff;
    susie.x = camerax() + 320 + (_cos * gap) + xoff;
    var _circle = 188.49555921538757;
    _circle = (siner % _circle) / _circle;
    _kris_spin = 2.5 + (_circle * 8);
    _susie_spin = 6.5 + (_circle * 8);
    kris.sub_index = scr_loop(_kris_spin + kris_angle, 8);
    scr_debug_print_persistent("susie_spin", string(scr_loop(_susie_spin + susie_angle, 8)));
    susie.sub_index = scr_loop(_susie_spin + susie_angle, 8);
}
kris.y = _krisfall - extra_y;
susie.y = _susiefall - extra_y;
spawner -= max(0.5, fall_speed);
if (spawner <= 0)
{
    spawner = spawntime;
    var _ball = instance_create(camerax() + 320 + (spread * toggle), cameray() + 600, obj_make_fountain_ball_titan);
    with (_ball)
    {
        speed = random_range(3, 7);
        direction = 90 - (other.toggle * 90);
        depth = other.depth + 10;
        size = 80;
        image_xscale = size / 50;
        image_yscale = size / 50;
        friction = 0.1;
        big = true;
    }
    _ball = instance_create(camerax() + 320 + ((spread + 100) * toggle), cameray() + 600, obj_make_fountain_ball_titan);
    with (_ball)
    {
        speed = random_range(3, 7);
        direction = 90 - (other.toggle * 90);
        depth = other.depth + 10;
        size = 120;
        image_xscale = size / 50;
        image_yscale = size / 50;
        friction = 0.1;
        big = true;
    }
    _ball = instance_create(camerax() + 320 + ((spread + 100) * toggle), cameray() + 600, obj_make_fountain_ball_titan);
    with (_ball)
    {
        speed = random_range(3, 7);
        direction = 90 - (other.toggle * 90);
        depth = other.depth - 10;
        size = 120;
        image_xscale = size / 50;
        image_yscale = size / 50;
        friction = 0.1;
        type = 2;
        big = true;
    }
    _ball = instance_create(camerax() + 320 + ((spread + 200) * toggle), cameray() + 600, obj_make_fountain_ball_titan);
    with (_ball)
    {
        speed = random_range(3, 7);
        direction = 90 - (other.toggle * 90);
        depth = other.depth - 10;
        size = 240;
        image_xscale = size / 50;
        image_yscale = size / 50;
        friction = 0.1;
        type = 2;
        big = true;
    }
    toggle = 0 - toggle;
}
with (obj_make_fountain_ball_titan)
{
    if (type == 1)
        y -= (other.fall_speed * 20);
    else if (type == 2)
        y -= (3 + (other.fall_speed * 10));
    else
        y -= (2 + (other.fall_speed * 8));
}
with (obj_darkness_trail)
{
    if (target == -4)
    {
        y -= (other.fall_speed * 20);
    }
    else if (target.y > (obj_dw_churchc_insidetitan_background.cover.y + 440) && !active)
    {
        debug_print("burst occurred at " + string(other.debug_timer) + " frames");
        active = true;
    }
}
debug_timer++;
kris_over.x = kris.x;
kris_over.y = kris.y;
kris_over.image_index = kris.image_index;
kris_over.sub_index = kris.sub_index;
kris_over.depth = kris.depth - 1;
if (shake > 0 || i_ex(obj_shake))
{
    if (!i_ex(obj_shake))
        scr_shakescreen(shake, shake);
    with (obj_shake)
    {
        permashake = true;
        shakex = other.shake;
        shakey = other.shake;
    }
}
if (shake == 0 && i_ex(obj_shake))
{
    with (obj_shake)
    {
        shakex = other.shake;
        shakey = other.shake;
    }
    with (obj_shake)
        permashake = false;
}
susie_over.x = susie.x;
susie_over.y = susie.y;
susie_over.image_index = susie.image_index;
susie_over.sub_index = susie.sub_index;
susie_over.depth = susie.depth - 1;
