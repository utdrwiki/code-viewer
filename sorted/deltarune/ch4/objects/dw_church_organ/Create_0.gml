siner = 0;
notes = instance_create(x, y, obj_dw_church_organ_notes);
notes.depth = 500;
if (scr_debug())
{
    scr_setparty(1, 1);
    if (keyboard_check(ord("1")))
    {
        debug_print("Came here for the first time.");
        scr_keyitemremove(30);
        global.flag[847] = 0;
        global.plot = 170;
    }
    if (keyboard_check(ord("2")))
    {
        debug_print("Returned here after closing eyes with ralsei.");
        setxy(1200, 252, 1049);
        scr_keyitemremove(30);
        global.flag[847] = 0;
        global.plot = 180;
    }
    if (keyboard_check(ord("3")))
    {
        debug_print("Returned here after getting the music sheet.");
        setxy(1200, 252, 1049);
        scr_keyitemget(30);
        global.plot = 180;
    }
    if (keyboard_check(ord("4")))
    {
        debug_print("Returned here after using the music sheet.");
        setxy(1200, 252, 1049);
        scr_keyitemget(30);
        global.flag[847] = 1;
        global.plot = 180;
    }
    with (obj_border_controller)
    {
        stop_custom_effect();
        set_border(border_dw_church_a, 1);
        show_border(1);
    }
}
engaged = false;
con = 0;
if (global.plot == 180 && !scr_keyitemcheck(30))
    con = 30;
customcon = 0;
buffer = 0;
soundtoplay = 0;
depth = 999990;
arrows = 1229;
baselight = 0.25;
arrowsalpha = baselight;
doalpha = 0;
realpha = 0;
mialpha = 0;
faalpha = 0;
soalpha = 0;
laalpha = 0;
tialpha = 0;
doaalpha = 0;
playalpha = 0;
pitchalpha = 0;
playlog[0] = 0;
playlogstring = "";
playloganswer = "313249864843218454218";
playindex = -1;
timer = 0;
solved = 0;
endtimer = 0;
endtime = 15;
makenote = false;
masteralpha = 0;
set_party = false;
kris_play = false;
piano_player = -4;
piano_track = false;
endless = 0;
if (room == room_debug_pianotest)
    endless = true;
if (room == room_test_pianoGimmick)
    endless = true;
chair_marker = scr_dark_marker(848, 290, spr_dw_church_organ_large_chair);
with (chair_marker)
    scr_depth();
organ_block = instance_create(x + 20, y + 240, obj_solidblockDark);
with (organ_block)
    image_xscale = 7;
is_canceled = false;
fail_counter = 0;
max_fail_count = string_length(playloganswer) + 8;
forceend = false;

move_to_position = function(arg0)
{
    global.interact = 1;
    playlogstring = "";
    is_canceled = false;
    if (scr_flag_get(847) > 0 && global.plot < 185)
        max_fail_count = 2;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_mus2("volume", 0, 30);
    c_pannable(1);
    c_pan(560, cameray(), 15);
    c_sel(kr);
    c_walkdirect(250 + arg0, kr_actor.y, 12);
    c_delaywalkdirect(13, 250 + arg0, 226, 12);
    c_delaywalkdirect(26, 302 + arg0, 226, 12);
    c_delayfacing(39, "u");
    c_sel(su);
    c_walkdirect(344 + arg0, 272, 12);
    c_sel(ra);
    c_walkdirect_wait(250 + arg0, 276, 12);
    c_facing("u");
    c_sel(su);
    c_facing("u");
    c_wait(30);
    c_var_instance(id, "engaged", true);
    c_waitcustom();
};

play_cancel = function()
{
    global.facing = 0;
    doalpha = 0;
    realpha = 0;
    mialpha = 0;
    faalpha = 0;
    soalpha = 0;
    laalpha = 0;
    tialpha = 0;
    doaalpha = 0;
    playalpha = 0;
    pitchalpha = 0;
    playlog = [];
    playlog[0] = 0;
    playindex = -1;
    timer = 0;
    buffer = 0;
    soundtoplay = 0;
    c_waitcustom_end();
    c_mus("free_all");
    c_mus2("initloop", "bell_ambience.ogg", 0);
    c_mus2("volume", 0, 0);
    c_mus2("volume", 1, 120);
    c_sel(kr);
    c_walkdirect(kr_actor.x - 50, kr_actor.y, 12);
    c_delaywalkdirect(13, kr_actor.x - 50, kr_actor.y + 40, 12);
    c_delaywalkdirect(26, kr_actor.x, kr_actor.y + 40, 12);
    c_delayfacing(39, "d");
    c_wait(44);
    c_pannable(1);
    c_panobj(kr_actor, 15);
    c_wait(16);
    c_var_instance(id, "is_canceled", true);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
};

if (!i_ex(obj_tutorial_text))
    instance_create(x, y, obj_tutorial_text);
if (global.plot >= 185)
    solved = 1;
depth = 900700;
endlessplaylog = "";
