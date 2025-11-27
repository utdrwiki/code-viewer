scr_darksize();
image_speed = 0;
timer = 0;
gigatimer = 0;
spin = choose(1, -1);
random_aim = 0;
attack_speed = 0;
counter = 0;
sprite_index = spr_roaringknight_shift_ol;
image_index = 1;
state = "intro";
with (obj_growtangle)
    keep = true;
whiteout = false;
whiteout_counter = 0;
shudder = 0;
bar = 0;
density = 12;
createbullets = false;
if (i_ex(obj_battlecontroller))
    createbullets = true;
roarendtimer = 0;
roarendtimermax = 190;
