scr_enemy_object_init();
recruitcount = 5;
talkmax = 90;
image_speed = 1/3;
idlesprite = spr_pippins_idle;
hurtsprite = spr_pippins_hurt;
sparedsprite = spr_pippins_spare;
noballoon = false;
bribe = false;
bet = false;
fixedbet = false;
cheat = false;
krismarker = false;
ralseimarker = false;
cheatcount = 0;
balloonorder = 0;
ballooncon = 0;
balloonend = 1;
talked = 0;
talktimer = 0;
talkedcon = 0;
ralseitalks = 0;
susietalks = 0;
attackanim = false;
attackanimtimer = 0;
attackanimcon = 0;
attackanimindex = 0;
board2event = false;
if (global.encounterno == 123)
{
    board2event = true;
    scr_speaker("ralsei");
    global.fc = 2;
}
sharpshootmercy = 0;
sharpshootballoon = false;
