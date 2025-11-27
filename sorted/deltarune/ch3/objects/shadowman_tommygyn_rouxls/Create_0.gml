timer = -10;
dir = 0;
current_speed = 0;
speed_approach = 0;
bullet_timer = 0;
bullet_counter = 0;
sameattacker = 0;
sameattack = 1;
shot_angle = 0;
gun_angle = 180;
creator = -1;
creatorid = -1;
freeze = false;
shootsfx = 0;
siner = 0;
slower = false;
type = 0;
if (y < obj_rouxls_ch3_enemy.y)
{
    var a = choose(0, 1);
    if (obj_rouxls_ch3_enemy.turns == 1)
        a = 0;
    if (obj_rouxls_ch3_enemy.turns == 2)
        a = 1;
    if (a == 0)
    {
        slower = true;
        timer = -28;
    }
    if (a == 1)
        timer = 10;
    type = a;
}
gunshake = 0;
target = 0;
damage = 55;
grazepoints = 3;
image_xscale = 2;
image_yscale = 2;
image_speed = 1;
sprite_index = spr_shadowman_firing_bunny;
firefx = 0;
count = irandom(4);
