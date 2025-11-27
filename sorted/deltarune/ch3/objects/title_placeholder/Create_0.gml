if (os_type == os_macosx)
    snd_play(snd_txtsans);
choice[0] = "Go to Main Menu";
choice[1] = "Go to Debug Room";
choice[2] = "Quick Load";
choice[3] = "File Menu";
choice[4] = "Credits";
choice_index = 0;
global.cinstance[0] = 4343434343;
global.cinstance[1] = 343434343434;
var car = scr_dark_marker((camerax() + (view_wport[0] / 2)) - 40, 320, spr_dogcar);
car.image_speed = 0.15;
specialmode = 0;
n = 0;
auto = 1;
autotimer = 0;
