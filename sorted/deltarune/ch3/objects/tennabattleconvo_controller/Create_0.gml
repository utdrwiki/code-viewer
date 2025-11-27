timer = 0;
con = 0;
enemyspared = false;
enemydefeated = false;
grazed10bullets = false;
herodowned = false;
statustext = "";
krisdowned = false;
susiedowned = false;
ralseidowned = false;
damagecount = 0;
damagecountthisturn = 0;
chattedduringbulletphase = false;
introcon = 0;
talktimer = 0;
if (!variable_global_exists("firstboardbattle"))
    global.firstboardbattle = 0;
global.firstboardbattle++;
with (obj_face)
    instance_destroy();
scr_speaker("tenna");
global.fc = 22;
global.battletyper = 80;
rr = choose(0, 1, 2, 3);
if (rr == 0)
    statustext = stringsetloc("* Don't let mother see THIS! ANOTHER smackdown! Only on TV Time!", "obj_tennabattleconvo_controller_slash_Create_0_gml_26_0");
if (rr == 1)
    statustext = stringsetloc("* Mike, hit that funky music! It's fightin' time!", "obj_tennabattleconvo_controller_slash_Create_0_gml_27_0");
if (rr == 2)
    statustext = stringsetloc("* And we ARE BACK in the ring! Who will TV-TRIUMPH!?", "obj_tennabattleconvo_controller_slash_Create_0_gml_28_0");
if (rr == 3)
    statustext = stringsetloc("* Don't adjust your set! Kris is BLUE, and FIGHTING AGAIN!", "obj_tennabattleconvo_controller_slash_Create_0_gml_29_0");
if (global.firstboardbattle > 1 || room == room_board_2 || room == room_board_3)
    introcon = 3;
else
    statustext = stringsetloc("It's a battle scene! Win hard and fast for extra points!", "obj_tennabattleconvo_controller_slash_Create_0_gml_36_0");
global.battlemsg[0] = statustext;
msgset(0, statustext);
init = 0;
