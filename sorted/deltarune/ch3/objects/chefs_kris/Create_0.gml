pos = 0;
pos_range = 0;
jumping = 0;
jumpwait = 0;
image_xscale = 2;
image_yscale = 2;
depth = 20;
invincible = 0;
firewait = 0;
xstart = 320;
ystart = 280;
x = xstart;
y = ystart;
pointsprev = 0;
stun = 0;
stack_height = 0;

function add_to_stack(arg0)
{
    arg0.caught = true;
    arg0.falling = false;
    food[stack_height] = arg0;
    stack_height++;
    if (jumping >= 2)
    {
        snd_play_pitch(snd_egg, 1.5);
        instance_create(x, y, obj_chefs_jumpcatchtxt);
        obj_chefs_game.scorepoints++;
    }
    else
    {
        snd_play_pitch(snd_egg, 1.3);
    }
}

t = 0;

function burn_stack()
{
    var _fall = true;
    if (stack_height <= 0)
    {
        if (invincible || stun > 0)
            exit;
    }
    for (var i = 0; i < stack_height; i++)
    {
        with (food[i])
        {
            gravity = 0.8;
            direction = 80 + irandom(20);
            speed = 6;
            on_fire = true;
        }
        obj_chefs_game.scorepoints--;
    }
    obj_chefs_game.scorepoints = clamp(obj_chefs_game.scorepoints - 3, 0, abs(obj_chefs_game.scorepoints));
    if (abs(obj_chefs_game.scorepoints - pointsprev) > 0 && !i_ex(obj_tenna_enemy))
    {
        with (obj_chefs_scoretxt)
            instance_destroy();
        var _text = instance_create_depth(x, y, depth - 10, obj_chefs_scoretxt);
        _text.blurb = "-" + string(abs(obj_chefs_game.scorepoints - pointsprev));
        _text.red = true;
    }
    if (stack_height > 0)
    {
        stack_height = 0;
        array_delete(food, 0, array_length(food));
    }
    snd_play_pitch(snd_error, 1.2);
    snd_play_pitch(snd_explosion_mmx, 0.8);
    if (obj_chefs_game.microgame == 1)
        _fall = 0;
    if (i_ex(obj_tenna_enemy))
    {
        if (i_ex(obj_tenna_enemy))
        {
            global.inv = -1;
            obj_tenna_enemy.minigamefailcount++;
            if (obj_tenna_enemy.minigamefailcount == 3 && obj_tenna_zoom.con != 2 && obj_tenna_zoom.minigameinsanity == false)
            {
                with (obj_tenna_zoom)
                {
                    con = 2;
                    timer = -1;
                }
            }
        }
    }
    if (_fall)
    {
        firewait = 40;
        stun = 40;
        hspeed = 0;
        vspeed = -8;
        gravity = 1;
        y -= 2;
        image_speed = 0;
        sprite_index = spr_chefs_kris_stun;
        image_index = 0;
        jumping = 0;
        throwing = 0;
    }
    else
    {
        firewait = 10;
        invincible = 45;
    }
}

throwing = 0;
throwwait = 0;

function throw_food()
{
    if (throwing > 0)
        exit;
    if (stack_height <= 0)
        exit;
    throwing = 1;
    sprite_index = spr_krisb_throwplate;
    image_index = 0;
    image_speed = 0;
    throwwait = 3 + clamp(stack_height - 2, 0, 10);
    if (stack_height >= 6)
        snd_play_pitch(snd_noise, 1.2);
}

if (i_ex(obj_chefs_init))
    depth = obj_chefs_init.depth - 10;
