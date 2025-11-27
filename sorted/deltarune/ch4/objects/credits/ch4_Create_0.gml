if (scr_is_switch_os())
    instance_create_depth(0, 0, 0, obj_switchAsyncHelper);
con = 0;
timer = 0;
lyric = stringset(" ");
textalpha = 1;
creditalpha = 1;
trackpos = 0;
modifier = 0;
song1 = 0;
menugray = hexcolor(#949494);
y_pos = __view_get(e__VW.YView, 0);
x_pos = __view_get(e__VW.XView, 0) + (__view_get(e__VW.WView, 0) / 2);
line_height = 20;
title_credit[0] = stringsetloc("DELTARUNE", "obj_credits_ch3_slash_Create_0_gml_18_0");
title_credit[1] = stringsetloc("Chapter 4", "obj_credits_ch4_slash_Create_0_gml_19_0");
title_credit[2] = stringset(" ");
title_credit[3] = stringsetloc("by Toby Fox", "obj_credits_ch3_slash_Create_0_gml_21_0");
continued_text[0] = stringsetloc("To be continued", "obj_credits_ch3_slash_Create_0_gml_23_0");
continued_text[1] = stringsetloc("in Chapter 5", "obj_credits_ch4_slash_Create_0_gml_24_0");
continued_text[2] = stringset(" ");
continued_text[3] = stringsetloc("2026", "obj_credits_ch4_slash_Create_0_gml_26_0");
year_alpha = 0;
credit_index = -1;
credits = generate_credits();
credits_con = 0;
init = false;
loaded = true;
unlocked_trophies = false;
measure_factor = 2;
measure_time = 1.89371 * measure_factor;
measure_timer = measure_time;
glowing_active = false;
glowing_text = [];
glowing_text[0][0] = stringsetloc("\\M0   WELL DONE./%", "obj_credits_ch4_slash_Create_0_gml_64_0");
glowing_text[1][0] = stringsetloc("\\M0  THE HALFWAY&   MARK HAS& BEEN ATTAINED./%", "obj_credits_ch4_slash_Create_0_gml_64_0_b");
glowing_text[2][0] = stringsetloc("\\M0    BUT&    IT&    IS STILL&    WAITING./%", "obj_credits_ch4_slash_Create_0_gml_67_0");
glowing_text[3][0] = stringsetloc("\\M0   HOW MUCH& LONGER NOW...?/%", "obj_credits_ch4_slash_Create_0_gml_68_0");
glowing_text[4][0] = stringsetloc("\\M0       MY ^6&   DELTARUNE./%", "obj_credits_ch4_slash_Create_0_gml_69_0");
alt_text_enabled = false;
if (obj_event_manager.trophies_enabled)
    alt_text_enabled = array_length(global.trophies) == 0;
if (alt_text_enabled)
{
    var completed_all = true;
    for (var i = 1; i < global.chapter; i++)
    {
        completed_all = scr_completed_chapter_any_slot(i);
        if (!completed_all)
            break;
    }
    if (!completed_all)
        alt_text_enabled = false;
}
if (alt_text_enabled)
{
    glowing_text[0][0] = stringsetloc("\\M0  INTERESTING./%", "obj_credits_ch4_slash_Create_0_gml_73_0");
    glowing_text[1][0] = stringsetloc("\\M0   YOU FAILED&   TO ACHIEVE&   ANY MARKS./%", "obj_credits_ch4_slash_Create_0_gml_74_0");
    glowing_text[2][0] = stringsetloc("\\M0    WHAT&    ARE&    YOU?/%", "obj_credits_ch4_slash_Create_0_gml_75_0");
    glowing_text[3][0] = stringsetsubloc("\\M0    \"~1\"/%", global.truename, "obj_credits_ch4_slash_Create_0_gml_76_0");
    glowing_text[4][0] = stringsetloc("\\M0  I VERY MUCH&  LOOK FORWARD&  TO THE NEXT./%", "obj_credits_ch4_slash_Create_0_gml_77_0");
}
glowing_text[0][1] = 60.4;
glowing_text[0][2] = 67;
glowing_text[1][1] = 68;
glowing_text[1][2] = 75.9;
glowing_text[2][1] = 76;
glowing_text[2][2] = 83.31;
glowing_text[3][1] = 84;
glowing_text[3][2] = 89.4;
glowing_text[4][1] = 90;
glowing_text[4][2] = 98;
glowing_index = 0;
text_con = 0;
text_buffer = 2;
auto_text = false;
auto_text_start = glowing_text[glowing_index][1];
auto_text_stop = glowing_text[glowing_index][2];
auto_text_buffer_time = 60;
auto_text_buffer = auto_text_buffer_time;
paused = false;

dequeue_text = function()
{
    global.typer = 666;
    global.fc = 0;
    global.msg[0] = glowing_text[glowing_index][0];
    auto_text_stop = glowing_text[glowing_index][2];
    var _writer = instance_create(70, 80, obj_writer);
    _writer.rate = 3;
    _writer.disablebutton1 = 1;
    _writer.skippable = 0;
    _writer.autocenter = 1;
    if (alt_text_enabled)
        _writer.jpspecial = 1;
    glowing_index++;
    if (glowing_index < array_length(glowing_text))
        auto_text_start = glowing_text[glowing_index][1];
};

restart_game = function()
{
    glowing_active = false;
    con = -1;
    game_restart();
};

enum e__VW
{
    XView,
    YView,
    WView,
    HView,
    Angle,
    HBorder,
    VBorder,
    HSpeed,
    VSpeed,
    Object,
    Visible,
    XPort,
    YPort,
    WPort,
    HPort,
    Camera,
    SurfaceID
}
