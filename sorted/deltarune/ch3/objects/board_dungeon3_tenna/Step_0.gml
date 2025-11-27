if (kris == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kris = id;
    }
}
var tennawarpsound = 502;
if (active)
{
    if (mus_stop == 0)
    {
        mus_stop = 1;
        mus_fade(global.currentsong[1], 60);
        stopperblock = 1;
    }
}
var dside = 1;
if (con == 0)
{
    if (dist <= 96)
    {
        con++;
        scr_speaker("no_name");
        msgsetloc(0, "..^1. HOW DID THINGS TURN OUT LIKE THIS.../", "obj_board_dungeon3_tenna_slash_Step_0_gml_29_0");
        msgnextloc("..^1. KEEPING POOR TORIEL ALL LOCKED UP.../%", "obj_board_dungeon3_tenna_slash_Step_0_gml_30_0");
        var d = bw_make();
        d.side = dside;
        global.interact = 1;
    }
}
if (con == 1 && !bw_ex())
{
    global.interact = 0;
    x += 128;
    snd_play(tennawarpsound);
    dist = 999;
    con++;
}
if (con == 2)
{
    if (dist <= 96)
    {
        con++;
        scr_speaker("no_name");
        msgsetloc(0, "IF ONLY HE HADN'T ABANDONED ME./", "obj_board_dungeon3_tenna_slash_Step_0_gml_52_0");
        msgnextloc("MY OLD PARTNER.../%", "obj_board_dungeon3_tenna_slash_Step_0_gml_53_0");
        var d = bw_make();
        d.side = dside;
        global.interact = 1;
    }
}
if (con == 3 && !bw_ex())
{
    global.interact = 0;
    x += 256;
    snd_play(tennawarpsound);
    dist = 999;
    con++;
}
if (con == 4)
{
    if (dist <= 96)
    {
        con++;
        scr_speaker("no_name");
        msgsetloc(0, "I WAS GONNA PUT HIM ON TV^1! MAKE HIM A STAR!/", "obj_board_dungeon3_tenna_slash_Step_0_gml_76_0");
        msgnextloc("I GAVE HIM EVERYTHING^1! EVERYTHING I HAD^1! MY LIFE ADVICE!/%", "obj_board_dungeon3_tenna_slash_Step_0_gml_77_0");
        var d = bw_make();
        d.side = dside;
        global.interact = 1;
    }
}
if (con == 5 && !bw_ex())
{
    global.interact = 0;
    x += 128;
    snd_play(tennawarpsound);
    dist = 999;
    con++;
}
if (con == 6)
{
    if (dist <= 96)
    {
        con++;
        scr_speaker("no_name");
        msgsetloc(0, "ALL. HE HAD. TO DO. WAS TELL ME WHAT HIS LITTLE SECRET WAS./", "obj_board_dungeon3_tenna_slash_Step_0_gml_99_0");
        msgnextloc("HIS SECRET TO BEING A BIG SHOT.../%", "obj_board_dungeon3_tenna_slash_Step_0_gml_100_0");
        var d = bw_make();
        d.side = dside;
        global.interact = 1;
    }
}
if (con == 7 && !bw_ex())
{
    global.interact = 0;
    x += 256;
    snd_play(tennawarpsound);
    dist = 999;
    con++;
}
if (con == 8)
{
    if (dist <= 128)
    {
        con++;
        scr_speaker("no_name");
        msgsetloc(0, "IT TOOK A LITTLE SWEET TALK.../", "obj_board_dungeon3_tenna_slash_Step_0_gml_122_0");
        msgnextloc("BUT JUST WHEN I HAD^1, FINALLY^1, FINALLY ? HA HA --/", "obj_board_dungeon3_tenna_slash_Step_0_gml_123_0");
        msgnextloc("GOTTEN HIM TO SIGN THE DEAL./", "obj_board_dungeon3_tenna_slash_Step_0_gml_124_0");
        msgnextloc("HE SUDDENLY HAD TO TAKE A PHONE CALL./%", "obj_board_dungeon3_tenna_slash_Step_0_gml_125_0");
        var d = bw_make();
        d.side = dside;
        global.interact = 1;
    }
}
if (con == 9 && !bw_ex())
{
    global.interact = 0;
    x += 128;
    snd_play(tennawarpsound);
    dist = 999;
    con++;
}
if (con == 10)
{
    if (dist <= 96)
    {
        con++;
        scr_speaker("no_name");
        msgsetloc(0, "BUT WHEN HE PICKED IT UP^1, HIS FACE TURNED PALE.../", "obj_board_dungeon3_tenna_slash_Step_0_gml_146_0");
        msgnextloc("AND HE RAN RIGHT OUT OF THE ROOM WITH THE RECEIVER HANGING!/%", "obj_board_dungeon3_tenna_slash_Step_0_gml_147_0");
        var d = bw_make();
        d.side = dside;
        global.interact = 1;
    }
}
if (con == 11 && !bw_ex())
{
    global.interact = 0;
    x += 256;
    snd_play(tennawarpsound);
    dist = 999;
    con++;
}
if (con == 12)
{
    if (dist <= 96)
    {
        con++;
        scr_speaker("no_name");
        msgsetloc(0, "SO I WENT TO PICK IT UP..^1./", "obj_board_dungeon3_tenna_slash_Step_0_gml_169_0");
        msgnextloc("THINKING IT WAS FINALLY MY CHANCE TO BE A BIG SHOT./", "obj_board_dungeon3_tenna_slash_Step_0_gml_170_0");
        msgnextloc("..^1. BUT THERE WAS NOBODY THERE!/%", "obj_board_dungeon3_tenna_slash_Step_0_gml_171_0");
        var d = bw_make();
        d.side = dside;
        global.interact = 1;
    }
}
if (con == 13 && !bw_ex())
{
    global.interact = 0;
    x += 384;
    snd_play(tennawarpsound);
    dist = 999;
    con++;
}
if (con == 14)
{
    if (dist <= 128)
    {
        con++;
        scr_speaker("no_name");
        msgsetloc(0, "THAT LITTLE FREAK RIPPED ME OFF!/", "obj_board_dungeon3_tenna_slash_Step_0_gml_193_0");
        msgnextloc("..^1. I WISH THEY NEVER BROUGHT THAT LAPTOP HOME.../%", "obj_board_dungeon3_tenna_slash_Step_0_gml_194_0");
        var d = bw_make();
        d.side = dside;
        global.interact = 1;
    }
}
if (con == 15 && !bw_ex())
{
    global.interact = 0;
    dist = 999;
    con++;
}
if (con == 16)
{
    if (dist <= 64)
    {
        con++;
        y += 32;
        sprite_index = spr_board_npc_tenna;
        image_speed = 0;
        image_index = 0;
        scr_speaker("no_name");
        msgsetloc(0, "K..^1. KRIS^1! KRIS^1, I DIDN'T SEE YOU THERE!/", "obj_board_dungeon3_tenna_slash_Step_0_gml_219_0");
        msgnextloc("I..^1. I DID WHAT YOU SAID^1, KRIS^1! HA..^1. JUST LIKE OUR DEAL!/", "obj_board_dungeon3_tenna_slash_Step_0_gml_220_0");
        msgnextloc("Y-YOU AREN'T GONNA TURN ME OFF AGAIN^1, ARE YOU...?/%", "obj_board_dungeon3_tenna_slash_Step_0_gml_221_0");
        var d = bw_make();
        d.side = dside;
        global.interact = 1;
    }
}
if (con == 17 && !bw_ex())
{
    global.interact = 0;
    dist = 999;
    con++;
}
if (con == 18)
{
    if (place_meeting(x, y, obj_board_swordhitbox))
    {
        instance_create(x + 16, y + 16, obj_board_enemydefeatsplash);
        global.flag[1255]++;
        kris.swordlv++;
        kris.xp = 0;
        con++;
        setxy(room_width, room_height);
        with (obj_dungeon3_tennataps)
        {
            snd_stop(steps);
            instance_destroy();
        }
    }
}
if (con == 19)
{
    if (obj_board_camera.con != 0)
    {
        mus_play_ext("board_ocean.ogg", 1, 0.6);
        con++;
    }
}
if (scr_board_onscreen())
{
    if (i_ex(kris))
        dist = abs(x - kris.x);
    else
        dist = 99999;
}
if (stopperblock == 1)
{
    stopperblock = 2;
    blocker = instance_create(board_tilex(1) - 64, board_tiley(0), obj_board_solid);
    blocker.image_yscale = 10;
    debug_message("stopperblock!!");
}
if (stopperblock == 2)
{
    if (i_ex(blocker))
        blocker.x = board_tilex(1) - 64;
}
