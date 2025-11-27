global.interact = 1;
image_speed_fake = 0.2;
scr_speaker("noone");
myid = global.flag[800 + seat];
seat0 = global.flag[800];
seat1 = global.flag[801];
seat2 = global.flag[802];
seat3 = global.flag[803];
aite = -1;
if (seat == 0)
    aite = seat1;
if (seat == 1)
    aite = seat0;
if (myid == 5 && aite == 6)
    _dialogue[0] = stringsetloc("* Sure is great to be here with my best friend Hathy./%", "obj_npc_cafe_slash_Other_10_gml_27_0");
if (myid == 6 && aite == 5)
    _dialogue[0] = stringsetloc("* (Hathy seems fine.)/%", "obj_npc_cafe_slash_Other_10_gml_32_0");
if (myid == 5 && aite == 22)
    _dialogue[0] = stringsetloc("* Sigh..^1. does this guy have to one-up me on everything!?/%", "obj_npc_cafe_slash_Other_10_gml_38_0");
if (myid == 22 && aite == 5)
    _dialogue[0] = stringsetloc("* I'll have a double Starfait. No^1, triple. Oh^1, hi^1, boss^1! (Smile)/%", "obj_npc_cafe_slash_Other_10_gml_43_0");
if (myid == 6 && aite == 23)
    _dialogue[0] = stringsetloc("* (Hathy is letting Head Hathy have a sip of her latte.)/%", "obj_npc_cafe_slash_Other_10_gml_50_0");
if (myid == 23 && aite == 6)
    _dialogue[0] = stringsetloc("* (Head Hathy doesn't seem so alone...)/%", "obj_npc_cafe_slash_Other_10_gml_55_0");
if (myid == 35 && aite == 30)
    _dialogue[0] = stringsetloc("* We don't get along..^1. but we can drink together./%", "obj_npc_cafe_slash_Other_10_gml_61_0");
if (myid == 30 && aite == 35)
    _dialogue[0] = stringsetloc("* I'll get you next time^1, pipo^1! ..^1. Want some more sugar?/%", "obj_npc_cafe_slash_Other_10_gml_66_0");
if (myid == 32 && aite == 34)
{
    _dialogue[0] = stringsetloc("* [Miaouw]/%", "obj_npc_cafe_slash_Other_10_gml_72_0");
    if (i_ex(obj_npc_castle_cafe))
    {
        with (obj_npc_castle_cafe)
            t_con = 1;
    }
}
if (myid == 34 && aite == 32)
    _dialogue[0] = stringsetloc("* [Brrrrrrrr....]/%", "obj_npc_cafe_slash_Other_10_gml_77_0");
if (myid == 33 && aite == 40)
    _dialogue[0] = stringsetloc("* (..^1. it seems annoyed that its energy drink has been crushed.)/%", "obj_npc_cafe_slash_Other_10_gml_83_0");
if (myid == 40 && aite == 33)
    _dialogue[0] = stringsetloc("* (It's crushing many of the surrounding drinks.)/%", "obj_npc_cafe_slash_Other_10_gml_88_0");
if (myid == 13 && aite == 36)
    _dialogue[0] = stringsetloc("* (I'm the dust off his shoulder.^1)&* (Sukkiri.)/%", "obj_npc_cafe_slash_Other_10_gml_100_0_b");
if (myid == 36 && aite == 13)
    _dialogue[0] = stringsetloc("* We'll make sure to clean our plates^1.&* (Sukkiri.)/%", "obj_npc_cafe_slash_Other_10_gml_105_0");
if (seat0 == 36 && seat1 == 36 && seat2 == 36 && seat3 == 36)
    _dialogue[0] = stringsetloc("* Boss^1, are you enjoying your \\cYButler Cafe\\c0?/%", "obj_npc_cafe_slash_Other_10_gml_111_0");
if (myid == 23 && aite == 40)
{
    if (global.flag[327] == 0)
        global.flag[327] = 1;
    _dialogue[0] = stringsetloc("* (..^1. it seems relaxed its partner is so quiet.)/%", "obj_npc_cafe_slash_Other_10_gml_100_0");
}
if (myid == 40 && aite == 23)
{
    if (global.flag[327] == 0)
        global.flag[327] = 1;
    _dialogue[0] = stringsetloc("* (...)/%", "obj_npc_cafe_slash_Other_10_gml_110_0");
}
if (myid == 40 && global.flag[327] == 1 && aite != 23)
{
    if (seat0 == 23 || seat1 == 23)
    {
        if (seat1 == 33 || seat0 == 33)
            _dialogue[0] = stringsetloc("* (..^1. looks like it's about to flip its table over.)/%", "obj_npc_cafe_slash_Other_10_gml_120_0");
        else
            _dialogue[0] = stringsetloc("* (..^1. it's staring at the southern seats and crushing its drink hard.)/%", "obj_npc_cafe_slash_Other_10_gml_124_0");
    }
}
if (myid == 54 && aite == 30)
    _dialogue[0] = stringsetloc("* (Seems to just be enjoying the musical ambulance.)/%", "obj_npc_cafe_slash_Other_10_gml_155_0");
if (myid == 56 && aite == 36)
    _dialogue[0] = stringsetloc("* Dis pretty boy ain't nothin'^1, boss. Watch me down dis tea!/%", "obj_npc_cafe_slash_Other_10_gml_161_0");
if (myid == 36 && aite == 56)
    _dialogue[0] = stringsetloc("* Oh^1, boss. This brutish boor can't even handle a little tea.../%", "obj_npc_cafe_slash_Other_10_gml_167_0");
if (myid == 57 && aite == 13)
    _dialogue[0] = stringsetloc("* (Rabbit^1, rabbit..^1. Oops^1, forget I said that.)/%", "obj_npc_cafe_slash_Other_10_gml_173_0");
if (myid == 13 && aite == 57)
    _dialogue[0] = stringsetloc("* (Ribbit^1, ribbit..^1. Oops^1, forget I said that.)/%", "obj_npc_cafe_slash_Other_10_gml_179_0");
if (myid == 60)
{
    if (aite >= 5)
        _dialogue[0] = stringsetloc("* Kris^1! This doesn't look like a date^1, does it!? It's not!/%", "obj_npc_cafe_slash_Other_10_gml_189_0");
    if (seat0 == 61 || seat1 == 61)
        _dialogue[0] = stringsetloc("* What is that moon doing!? I'll have to make him jealous^1, too!!/%", "obj_npc_cafe_slash_Other_10_gml_195_0");
    if (aite == 61)
        _dialogue[0] = stringsetloc("* Did it hurt when you fell? Your tag says you're..^1. um^1, the moon./%", "obj_npc_cafe_slash_Other_10_gml_201_0");
    if (aite == 65)
    {
        _dialogue[0] = stringsetloc("* Haha^1, Kris^1! I think I've got a new BESTIE!!/", "obj_npc_cafe_slash_Other_10_gml_207_0");
        _dialogue[1] = stringsetloc("* Like I'm saying^1, water girls are the WAVE!!/%", "obj_npc_cafe_slash_Other_10_gml_208_0");
    }
    if (aite == 69)
    {
        _dialogue[0] = stringsetloc("* Haha^1, Kris^1! I think I've got a new BESTIE!!/", "obj_npc_cafe_slash_Other_10_gml_214_0");
        _dialogue[1] = stringsetloc("* Like I'm saying^1, water girls are the WAVE!^1! Here^1, selfie!!/%", "obj_npc_cafe_slash_Other_10_gml_215_0");
    }
}
if (myid == 61)
{
    if (aite >= 5)
        _dialogue[0] = stringsetloc("* Kris..^1. um^1, help^1! I'm not ready for a team relationship again.../%", "obj_npc_cafe_slash_Other_10_gml_225_0");
    if (seat0 == 60 || seat1 == 60)
        _dialogue[0] = stringsetloc("* Oh my rain!? What is she DOING with that rogue!?/%", "obj_npc_cafe_slash_Other_10_gml_231_0");
    if (aite == 60)
        _dialogue[0] = stringsetloc("* Oh my rain..^1. you put me on Cloud 9. Which^1, is the best cloud./%", "obj_npc_cafe_slash_Other_10_gml_237_0");
    if (aite == 65)
    {
        _dialogue[0] = stringsetloc("* Hmm..^1. something about you seems..^1. different tonight^1, Elnina./", "obj_npc_cafe_slash_Other_10_gml_243_0");
        _dialogue[1] = stringsetloc("* What is it..^1. a new hatcut? Oh^1, it's splendid!/%", "obj_npc_cafe_slash_Other_10_gml_244_0");
    }
    if (aite == 69)
    {
        _dialogue[0] = stringsetloc("* I'm not sure why you're so aggressive tonight^1, Elnina.../", "obj_npc_cafe_slash_Other_10_gml_250_0");
        _dialogue[1] = stringsetloc("* But - my stars - I kind of LIKE it!/%", "obj_npc_cafe_slash_Other_10_gml_251_0");
    }
}
if (myid == 58 && aite < 0)
{
    if (scr_flag_get(1144) == 1 || scr_flag_get(1144) == 3)
        _dialogue[0] = stringsetloc("* (Seems like you're invited for drinks..^1. but you're busy now.)/%", "obj_npc_cafe_slash_Other_10_gml_260_0");
}
if (myid == 62)
{
    if (aite == 65 || aite == 69)
        _dialogue[0] = stringsetloc("* (Guei's vibes seemed dampened...)/%", "obj_npc_cafe_slash_Other_10_gml_270_0");
}
if (myid == 63)
{
    if (aite == 62)
        _dialogue[0] = stringsetloc("* C h i l l..^1. b u d d y.../%", "obj_npc_cafe_slash_Other_10_gml_280_0");
}
if (myid == 65)
{
    if (aite == 69)
        _dialogue[0] = stringsetloc("* (Oh^1, anyone but her...)/%", "obj_npc_cafe_slash_Other_10_gml_290_0");
    if (aite == 60)
        _dialogue[0] = stringsetloc("* (Who is this city bob? She lacks the elegance of a fairy)/%", "obj_npc_cafe_slash_Other_10_gml_296_0");
    if (aite == 61)
        _dialogue[0] = stringsetloc("* (Who is this beautiful yet stupid man? A fine prince?)/%", "obj_npc_cafe_slash_Other_10_gml_302_0");
}
if (myid == 69)
{
    if (aite == 65)
        _dialogue[0] = stringsetloc("* O^1, paired with a regular sort. Well then^1, be my apprentice!/%", "obj_npc_cafe_slash_Other_10_gml_312_0");
    if (aite == 60)
        _dialogue[0] = stringsetloc("* Amusing. What are these \"sylphies\"^1, you so speak of?/%", "obj_npc_cafe_slash_Other_10_gml_318_0");
    if (aite == 61)
        _dialogue[0] = stringsetloc("* You brute^1! You betray your love^1, and treat me like a commoner!?/%", "obj_npc_cafe_slash_Other_10_gml_324_0");
}
for (j = 0; j < array_length(_dialogue); j++)
    msgset(j, _dialogue[j]);
remanimspeed = image_speed_fake;
myinteract = 3;
mydialoguer = instance_create(0, 0, obj_dialoguer);
talked += 1;
