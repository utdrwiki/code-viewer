if (!obj_chefs_game.gamestart)
    exit;
t++;
if (i_ex(obj_chefs_game))
    pointsprev = obj_chefs_game.scorepoints;
if (firewait > 0)
{
    firewait--;
    if (firewait <= 0)
        invincible = 60;
}
if (invincible > 0)
{
    invincible--;
    if (image_alpha == 0.3)
        image_alpha = 1;
    else
        image_alpha = 0.3;
}
else
{
    image_alpha = 1;
}
var _x = clamp(x, xstart - 128, xstart + 128);
if (x != _x)
{
    x = _x;
    hspeed = 0;
}
if (obj_chefs_game.gameover)
{
    image_speed = 0;
    gravity = 0;
    speed = 0;
    y = yprevious;
    x = xprevious;
    image_alpha = 1;
    exit;
}
var _h = 0;
var _cap = max(4, stack_height) + 3;
if (jumping == 0)
{
    if (left_h())
        _h = -1;
    if (right_h())
        _h = 1;
    if (throwing || firewait > 0 || stun > 0)
        _h = 0;
    var _maxspd = 8;
    var _spd = _h * ((_cap - stack_height) / _cap) * _maxspd;
    var _acc = (((_cap - stack_height) / _cap) * (_maxspd / 3)) + (_maxspd / 3);
    hspeed = clamp_gradual(hspeed, _spd, _spd, _acc);
    if (!throwing)
    {
        if (round(hspeed) == 0)
        {
            sprite_index = spr_kris_chef;
        }
        else
        {
            image_speed = _h * ((_cap - stack_height) / _cap);
            sprite_index = spr_kris_chef_walk;
        }
    }
    if ((button2_p() || (i_ex(obj_tenna_enemy) && button1_p())) && !throwing && !(firewait > 0 || stun > 0))
    {
        jumping = 1;
        jumphspeed = hspeed;
        hspeed = 0;
        jumpwait = 1 + stack_height;
    }
}
if (jumping == 1)
{
    jumpwait--;
    if (!throwing)
        sprite_index = spr_kris_chef_squat;
    if (jumpwait <= 0)
    {
        hspeed = jumphspeed;
        snd_play(snd_jump);
        gravity_direction = 270;
        gravity = 1;
        vspeed = -12 + ((stack_height / _cap) * 5);
        hspeed = clamp(hspeed, -4, 4);
        jumping = 2;
        jump_spinspd = 0.5 + (0.5 * ((10 - min(stack_height, 10)) / 10));
        if (hspeed != 0)
            jump_spinspd *= sign(hspeed);
    }
}
if (jumping == 2 && !throwing)
{
    image_speed = jump_spinspd;
    sprite_index = spr_krisb_pirouette_plate;
}
if ((jumping == 2 || stun > 0) && y >= (ystart - abs(vspeed)) && vspeed > 0)
{
    jumping = false;
    gravity = 0;
    y = ystart;
    vspeed = 0;
}
if (stun > 0)
{
    stun--;
    image_speed = 0;
    sprite_index = spr_chefs_kris_stun;
    if (y < ystart)
    {
        image_index = 0;
    }
    else
    {
        y = ystart;
        image_index = 1;
        vspeed = 0;
    }
}
if (throwing == 0 && button1_p() && !i_ex(obj_tenna_enemy) && obj_chefs_game.microgame != 1)
    throw_food();
if (throwing == 1)
{
    throwwait--;
    if (throwwait <= 0)
    {
        if (stack_height > 0)
        {
            var _stack = instance_create(x, food[0].y, obj_chefs_stackbox);
            _stack.vspeed = 20;
            _stack.stack_height = stack_height;
            snd_play_pitch(snd_wing, 0.8);
            repeat (stack_height)
            {
                with (food[stack_height - 1])
                {
                    if (i_ex(obj_chefs_firewhip))
                        depth = -999999;
                    thrown = true;
                    vspeed = 20;
                    if (other.pos == 0)
                        x = other.x;
                    _stack.food[other.stack_height - 1] = id;
                    fixate = _stack;
                    fixate_y = y - _stack.y;
                }
                array_delete(food, stack_height - 1, 1);
                stack_height--;
            }
            var _scale = clamp(_stack.stack_height, 1, 5) / 5;
            _stack.image_yscale = _scale;
        }
        throwing = 2;
        image_index = 1;
        image_speed = 1;
    }
}
