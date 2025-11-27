with (obj_heart)
    color = #020000;
idealdir = 90;
dir = 90;
neg = 0;
idealdirprevious = 0;
diagonal_enabled = 0;
diagonal_transform = 0;
origin_offset = 0;
just = 0;
justlength = 4;
justflash = 0;
bullethitid = -1;
funni = 777;
flash = 0;
radius = 30;
vanish = 0;
bumpaxecon = 0;
dark_brown = make_color_rgb(100, 0, 15);
light_green = make_color_rgb(62, 79, 57);
shadowpower = 0;
shadowpowerstart = 0;
shadowpowertarget = 0;
shadowpowercon = 0;
shadowpowertimer = 0;
shadowpowertimermax = 0;
wascymbalplayingprev = false;
image_speed = 0;
image_alpha = 0;
shake = 0;
fadealpha = 0;
image_angle_prev = 0;
frozentimer = 0;
parryflashtimer = 0;
transformflashtimer = 0;
transformtimer = 0;
forceheartpos = true;
if (i_ex(obj_hammer_of_justice_enemy) && obj_hammer_of_justice_enemy.diagonal_enabled == 1)
    diagonal_transform = 1;
if (i_ex(obj_sound_of_justice_enemy))
{
    idealdir = 180;
    image_angle = idealdir;
}
