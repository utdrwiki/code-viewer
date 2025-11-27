image_xscale = 2;
image_yscale = 2;
image_speed = 1;
food_type = -1;
foods_needed = 1;
movetype = 0;
t = 0;
f = 0.04;
a = 160;
blink = 0;
foods = 0;
leaving = false;
eating = 0;
special = 0;
side = 1;
moves = 4;
movespeed = 6;
tenna = false;
spriteset = 0;

function set_spriteset(arg0)
{
    switch (arg0)
    {
        default:
            exit;
        case 0:
            sprWalk = 3928;
            sprEat = 4256;
            sprLeave = 3131;
            break;
        case 1:
            sprWalk = 3005;
            sprEat = 3239;
            sprLeave = 4414;
            break;
        case 2:
            sprWalk = 1136;
            sprEat = 2689;
            sprLeave = 1085;
            break;
    }
    spriteset = arg0;
}

set_spriteset(0);
if (i_ex(obj_chefs_init))
    depth = obj_chefs_init.depth - 20;
specinit = 0;
