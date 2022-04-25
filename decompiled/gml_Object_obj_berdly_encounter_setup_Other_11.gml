state = 1
instance_create(x, y, o_berdly_hide_intro_markers)
global.specialbattle = 3
global.encounterno = 58
encounterflag = 529
global.flag[54] = encounterflag
scr_encountersetup(global.encounterno)
if (global.flag[9] != 2)
{
    global.flag[9] = 1
    global.batmusic[0] = snd_init("berdly_chase.ogg")
}
global.interact = 2
if (global.flag[9] == 1)
    snd_volume(global.currentsong[1], 0, 20)
scr_encountersetup(global.encounterno)
with (obj_mainchara)
    visible = false
with (global.cinstance[0])
    visible = false
with (global.cinstance[1])
    visible = false
with (obj_mainchara)
    fun = false
with (obj_caterpillarchara)
    fun = false
count = 0
fightcon = 1
counttimer = 0
