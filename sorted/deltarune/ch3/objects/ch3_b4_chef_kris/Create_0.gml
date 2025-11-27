pos = 0;
pos_range = 0;
jumping = 0;
jumpwait = 0;
image_xscale = 2;
image_yscale = 2;
depth = 7000;
invincible = 0;
firewait = 0;
xstart = 320;
ystart = 280;
x = xstart;
y = ystart;
stun = 0;
stack_height = 0;
throwing = 0;
throwwait = 0;

burn_stack = function()
{
    var _fall = true;
    if (invincible || stun > 0)
        exit;
    var damage_amount = choose(10, 15);
    if (global.hp[1] < (global.maxhp[1] / 2))
        damage_amount = choose(2, 3);
    global.hp[1] = clamp(global.hp[1] - damage_amount, 1, global.maxhp[1]);
    var _dmgwriter = instance_create(x, y, obj_dmgwriter);
    _dmgwriter.damage = damage_amount;
    snd_play_pitch(snd_error, 1.2);
    snd_play_pitch(snd_explosion_mmx, 0.8);
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
};
