scr_enemy_object_init();
recruitcount = 2;
talkmax = 90;
image_speed = 0.16666666666666666;
idlesprite = spr_shutta_idle;
hurtsprite = spr_shutta_idle;
sparedsprite = spr_shutta_spare;
custom_draw_example = 1;
floatsiner = irandom(100);
darken = 0;
darkenalpha = 0;
myattackchoice = 0;
jumping = false;
debugvar = false;
photosuccesscount = 0;
endbattle = false;
amiabossfight = true;
fastphoto = false;
filter = false;
intro = 0;
powerphoto = false;
attackorder = 0;
photoactcount = 1;
acedrotationphoto = false;
if (room == room_board_1 || room == room_board_2 || room == room_board_3 || (room == room_battletest && global.encounterno == 111))
{
    scr_speaker("tenna");
    global.fc = 22;
}
else
{
    with (obj_shutta_enemy)
        amiabossfight = false;
}
sharpshootmercy = 0;
changealpha = false;
sharpshootballoon = false;
photosuccessballoon = 0;
balloonorder = 0;
ballooncon = 0;
balloonend = 1;
talkedcon = 0;
ralseitalks = 0;
susietalks = 0;
posecon = 0;
posetimer = 0;
endtimer = 0;
endcon = 0;
justusedcameraact = false;
freefailcount = 0;
rotationfailcount = 0;
lancerfailcount = 0;
toiletfailcount = 0;
ralseifailcount = 0;
krsfailcount = 0;
