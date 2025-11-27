scr_board_battlehealth();
depth = 100010;
kris = 1185;
with (obj_caterpillarchara)
{
    if (name == "ralsei")
        other.ralsei = id;
    if (name == "susie")
        other.susie = id;
}
plpo = obj_ch3_gameshow.playerpodiums;
tenna = obj_actor_tenna;
console = obj_ch3_gameshow.gameconsole;
couch = obj_ch3_gameshow.couch;
wires = obj_ch3_gameshow.wires;
con = 0;
timer = 0;
encounterflag = 0;
kris.ignoredepth = 1;
susie.ignoredepth = 1;
ralsei.ignoredepth = 1;
remmove = [];
battlesprite = 0;
khealth = 0;
rhealth = 0;
shealth = 0;
hitcount = 0;
battletime = 0;
turns = 1;
lettergrade = "Z";
rem1 = global.hp[1];
rem2 = global.hp[2];
rem3 = global.hp[3];
rcon = 0;
rtimer = 0;
reachedend_draw_triangle_siner = 0;
snd_play_delay(snd_tensionhorn, 3, 1, 1.1);
snd_play_delay(snd_tensionhorn, 10, 1, 1.2);
global.flag[1011]++;
specialend = 0;
battleseconds = 0;
battleminutes = 0;
tpgained = 0;
updatehealth = 0;
lerptime = 15;
downdist = 128;
