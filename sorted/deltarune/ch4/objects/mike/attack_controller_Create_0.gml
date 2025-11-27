global.battleend = 0;
global.fighting = 1;
global.batmusic[1] = mus_loop_ext(global.batmusic[0], 1, 1);
finished = 0;
var i = 0;
name[i++] = "";
name[i++] = "Applause 1";
name[i++] = "Applause 2";
name[i++] = "Applause 3";
name[i++] = "Small Cats";
name[i++] = "Big Cats 1";
name[i++] = "Big Cats 2";
name[i++] = "Big Paw";
name[i++] = "Falling Paws";
name[i++] = "Big Paw 2";
name[i++] = "Grab Cats";
name[i++] = "Paw + Cats";
name[i++] = "(skipped)";
name[i++] = "(skipped)";
name[i++] = "Combination";
name[i++] = "";
name[i++] = "";
name[i++] = "";
if (global.use_mic)
{
    i = 0;
    _cat_num[i] = 10;
    _cat_time[i++] = 20;
    _cat_num[i] = 15;
    _cat_time[i++] = 25;
    _cat_num[i] = 15;
    _cat_time[i++] = 20;
    _cat_num[i] = 6;
    _cat_time[i++] = 30;
    _grab_cats = 5;
    _falling_num = 15;
    _falling_time = 15;
    i = 0;
    _paw_time[i++] = 90;
    _paw_time[i++] = 60;
    _paw_time[i++] = 90;
    cat_happiness = 1;
    applause_speed = 1;
}
else
{
    i = 0;
    _cat_num[i] = 10;
    _cat_time[i++] = 30;
    _cat_num[i] = 15;
    _cat_time[i++] = 15;
    _cat_num[i] = 20;
    _cat_time[i++] = 20;
    _cat_num[i] = 6;
    _cat_time[i++] = 20;
    _grab_cats = 5;
    _falling_num = 20;
    _falling_time = 12;
    i = 0;
    _paw_time[i++] = 60;
    _paw_time[i++] = 45;
    _paw_time[i++] = 45;
    cat_happiness = 1.2;
    applause_speed = 1.25;
}
with (obj_mike_controller)
{
    battle_active = true;
    event_user(11);
}
instance_create_depth(0, 0, depth + 1, obj_volumebar);
if (i_ex(obj_astream))
{
    if (obj_astream.mystream == global.batmusic[0])
    {
        if (obj_astream.songname != "mus/battle.ogg")
            battlemusicvolume = 1;
    }
    scr_debug_print(obj_astream.songname);
}
if (instance_number(obj_heart) == 0)
{
    with (instance_create_depth(x, y, depth, obj_heart))
        visible = false;
}
msg_max = 0;
msg_current = 0;
msg_del = 1;
msg_cap = 1;
text = [];
text_current = 0;
text_last = choose(0, 1, 2);
text_skip = true;
for (i = 0; i < 3; i++)
    pet_current[i] = 0;
i = 0;
pet_text[i++] = stringsetloc("* Mike got pet!/", "obj_mike_attack_controller_slash_Create_0_gml_145_0");
pet_text[i++] = stringsetloc("* The Maus offered you a Fruit Bonus!/", "obj_mike_attack_controller_slash_Create_0_gml_146_0");
pet_text[i++] = stringsetloc("* The Maus was bitten!/", "obj_mike_attack_controller_slash_Create_0_gml_147_0");
pet_text[i++] = stringsetloc("* Ralsei got pet!/", "obj_mike_attack_controller_slash_Create_0_gml_148_0");
i = 0;
text[0][i] = stringsetloc("* Mike keeps talking loudly, as he always does.", "obj_mike_attack_controller_slash_Create_0_gml_152_0");
text[1][i] = stringsetloc("* Mike combs his head back.", "obj_mike_attack_controller_slash_Create_0_gml_153_0");
text[2][i++] = stringsetloc("* Mike is definitely a microphone!", "obj_mike_attack_controller_slash_Create_0_gml_154_0");
text[0][i] = stringsetloc("* Mike dances silently, as he always does.", "obj_mike_attack_controller_slash_Create_0_gml_157_0");
text[1][i] = stringsetloc("* Mike seems to be a little too into the jazz music.", "obj_mike_attack_controller_slash_Create_0_gml_158_0");
text[2][i++] = stringsetloc("* Mike is definitely a cat!", "obj_mike_attack_controller_slash_Create_0_gml_159_0");
text[0][i] = stringsetloc("* Mike is definitely a cowboy!", "obj_mike_attack_controller_slash_Create_0_gml_162_0");
text[1][i] = stringsetloc("* Mike seems slightly uncomfortable in their jacket.", "obj_mike_attack_controller_slash_Create_0_gml_163_0");
text[2][i++] = stringsetloc("* Mike considers manipulating the volume.", "obj_mike_attack_controller_slash_Create_0_gml_164_0");
text[0][i] = stringsetloc("* Mike is definitely...!?", "obj_mike_attack_controller_slash_Create_0_gml_167_0");
text[1][i] = stringsetloc("* Sounds like feedback.", "obj_mike_attack_controller_slash_Create_0_gml_168_0");
text[2][i] = stringsetloc("* Which one's the real Mike!?", "obj_mike_attack_controller_slash_Create_0_gml_169_0");
text[3][i++] = stringsetloc("* Mike(s) are getting ready to turn it up!", "obj_mike_attack_controller_slash_Create_0_gml_171_0");
text[0][i] = stringsetloc("* Smells like dried gel pen.", "obj_mike_attack_controller_slash_Create_0_gml_174_0");
global.msg[0] = stringsetloc("* It's Mike!", "obj_mike_attack_controller_slash_Create_0_gml_176_0");
scr_battletext_default();
battlewriter.depth = -1;
i = 0;
hero_text[0][i] = stringsetloc("* It was effective!", "obj_mike_attack_controller_slash_Create_0_gml_184_0");
hero_text[1][i] = stringsetloc("* It was sort of effective!", "obj_mike_attack_controller_slash_Create_0_gml_185_0");
hero_text[2][i++] = stringsetloc("* It was crunchy, and not very fruit like!", "obj_mike_attack_controller_slash_Create_0_gml_186_0");
hero_text[0][i] = stringsetloc("* Touch me and you'll lose a finger, dumb ass!", "obj_mike_attack_controller_slash_Create_0_gml_188_0");
hero_text[1][i] = stringsetloc("* Lay off, idiot!", "obj_mike_attack_controller_slash_Create_0_gml_189_0");
hero_text[2][i++] = stringsetloc("* ...", "obj_mike_attack_controller_slash_Create_0_gml_190_0");
hero_text[0][i] = stringsetloc("* Ahahah! That tickles!", "obj_mike_attack_controller_slash_Create_0_gml_192_0");
hero_text[1][i] = stringsetloc("* Haha, i-is it okay to receive this much attention!?", "obj_mike_attack_controller_slash_Create_0_gml_193_0");
hero_text[2][i++] = stringsetloc("* ... petting overdose!", "obj_mike_attack_controller_slash_Create_0_gml_194_0");
alarm[0] = 6;
flash = 1;
attacks = 0;
counter = -1;
pawtype = 0;
paw_aim = 0;
x = (camerax() + camerawidth()) / 2;
lastx = 0;
mid_attack = false;
mid_reload = 0;
paw_reload = 120;
current = 0;
canclick = false;
action = 0;
wave = 0;
last_wave = 3;
timer = 0;
move_party = false;
alpha = 0;
lastside = 3;
phase = 0;
mike = 0;
petting = 0;
txt_wait = 0;
last_talker = -1;
ending = false;
main_text = -1;
convo = 0;
talking = false;
mike_small = -1;
mike_medium = -1;
mike_big = -1;
combo = false;
text_speed = 2;
cat_max = 0;
cat_reload = 60;
cat_timer = 0;
playall = true;
display_hits = false;
for (i = 0; i < 16; i++)
    hits[i] = 0;
dog_x = -100;
dog_ind = 0;
dog_xs = 1;
dog_t = 0;
target = 0;
lasttarget = 0;
lasthp = global.hp[global.char[target]];

debug_mikes = function()
{
    with (obj_mike_battle)
    {
        obj_mike_attack_controller.mike_small = id;
        with (instance_create(xstart + 80, y + 25, obj_mike_battle))
        {
            sprite_index = spr_mike_big;
            x = xstart + 300;
            image_xscale = 2;
            image_yscale = 2;
            type = 1;
            depth = other.depth - 1;
            obj_mike_attack_controller.mike_big = id;
        }
        with (instance_create(xstart + 80, y - 100, obj_mike_battle))
        {
            sprite_index = spr_mike_med;
            x = xstart + 300;
            image_xscale = 2;
            image_yscale = 2;
            type = 1;
            obj_mike_attack_controller.mike_medium = id;
        }
    }
};

if (global.mike_skip)
{
    action = 13;
    mike = 0;
    debug_mikes();
}
