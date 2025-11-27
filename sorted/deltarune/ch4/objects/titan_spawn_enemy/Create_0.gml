light_radius = 48;
battlecontroller = false;
if (instance_number(obj_titan_spawn_enemy) == 1)
    battlecontroller = true;
scr_enemy_object_init();
talkmax = 90;
idlesprite = spr_titan_spawn_idle;
hurtsprite = spr_titan_spawn_hurt;
sparedsprite = spr_titan_spawn_idle;
custom_draw_example = 1;
rtimer = 0;
myattackchoice = 0;
first_barrage = true;
attack_chooser = 6;
with (obj_battlecontroller)
    cantspare[0] = 1;
with (obj_battlecontroller)
    cantspare[1] = 1;
balloonorder = 0;
ballooncon = 0;
balloonend = 1;
talked = 0;
talktimer = 0;
talkedcon = 0;
ralseitalks = 0;
susietalks = 0;
sactcount = 0;
ractcount = 0;
brighten = 0;
racttimer = 0;
phaseturn = 0;
myattackchoice = 0;
difficulty = 0;
dualhealcount = 0;
dualhealcon = 0;
dealhealtimer = 0;
scr_setchar(1, 1);
