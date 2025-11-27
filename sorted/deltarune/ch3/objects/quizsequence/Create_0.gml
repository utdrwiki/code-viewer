global.flag[1019] = 0;
grandaddy = 0;
con = 0;
timer = 0;
buffer = 0;
commentshown = 0;
itemname[0] = stringsetloc("LANCER", "obj_quizsequence_slash_Create_0_gml_15_0");
itemname[1] = stringsetloc("ROUXLS", "obj_quizsequence_slash_Create_0_gml_16_0");
itemname[2] = stringsetloc("------", "obj_quizsequence_slash_Create_0_gml_17_0");
itemname[3] = stringsetloc("------", "obj_quizsequence_slash_Create_0_gml_18_0");
itemtype[0] = 1;
itemtype[1] = 1;
itemtype[2] = 1;
itemtype[3] = 1;
itemamount[0] = 1;
itemamount[1] = 1;
itemamount[2] = 1;
itemamount[3] = 1;
init = 0;
menu = 0;
menucoord[0] = 0;
menucoord[1] = 0;
susiecoord = 0;
ralseicoord = 0;
teambuffer = 0;
bufferedcoord = 0;
ralBehavior = 0;
susBehavior = 1;
ralbuffer = 0;
schoose = 0;
rchoose = 0;
susbuffer = 0;
ra_wait = 300;
su_wait = 300;
ra_guess = -1;
su_guess = -1;
rtarget = 0;
starget = 0;
sCon = 0;
stimer = 0;
stimer2 = 0;
ksel = false;
ssel = false;
rsel = false;
choicepitch = 0.9;
rCon = 0;
rtimer = 0;
ktimer = 0;
turntimer = 0;
gameshowblue = 15245824;
flashtimer = 0;
commentobj = 0;
commenttimer = 0;
endtimer = 60;
quizzler = -4;
movelock = false;
quizid = "";
tt = 0;
commentqueue = 20;
correct = 0;
sresult = 0;
rresult = 0;
total_correct = 0;
q_correct = 0;
kcorrect = 0;
rcorrect = 0;
scorrect = 0;
question_count = 0;
subcon = 0;
timelimit = 360;
base_timelimit = 360;
fast_timelimit = 150;
countdown = 0;
myanswer = -1;
quiz_length = 0;
quiz_index = 0;
quizQs[0] = 0;
questionwriter = -4;
wrongDamage = 1;
perfect = false;
perugina = -4;
extra_obj = -4;
extra = false;
pausestart = 0;
suname = "ASS";
drawquestion = 0;
debugpause = 0;
ra_answer[0] = 0;
kr_answer[0] = 0;
su_answer[0] = 0;
result_krcount = 0;
result_sucount = 0;
result_racount = 0;
bonus_kr = "null";
bonus_su = "null";
bonus_ra = "null";
bonus_total = 0;
painstring = stringsetloc("PAIN", "obj_quizsequence_slash_Create_0_gml_115_0");
bonusstring = stringsetloc("BONUS", "obj_quizsequence_slash_Create_0_gml_116_0");
result_perfect = stringsetloc("PERFECT!!!", "obj_quizsequence_slash_Create_0_gml_117_0");
result_decent = stringsetloc("DECENT!!!", "obj_quizsequence_slash_Create_0_gml_118_0_b");
result_notbad = stringsetloc("NOT BAD!!!", "obj_quizsequence_slash_Create_0_gml_118_0");
result_notgreat = stringsetloc("BARELY FORGIVABLE", "obj_quizsequence_slash_Create_0_gml_121_0");
result_terrible = stringsetloc("YOU DID BAD", "obj_quizsequence_slash_Create_0_gml_120_0");
result_worst = stringsetloc("NOT ON MY CHANNEL!!!", "obj_quizsequence_slash_Create_0_gml_124_0");
result_string = "null";
hurt_su = 0;
hurt_kr = 0;
hurt_ra = 0;
subtimer = 0;
hurtmarker_su = 0;
hurtmarker_kr = 0;
hurtmarker_ra = 0;
resultsskip = 0;
correctAnswers = 0;
sprite = -4;
spritex = 0;
spritey = 0;
sprite_timer = 0;
auto = false;
paused = false;
board4 = false;
screen = -4;
newdepth = depth;
skiptimer = 30;
hurt_counter = -1;
create_timer = 40;
postcomment = false;
tenna_timer = 0;
timer_delay = 0;

function checkskip(arg0, arg1)
{
    var _skip = false;
    if (timer > (arg0 + 5) && timer < (arg1 - 1))
    {
        if (button3_h())
            _skip = true;
    }
    if (timer > (arg0 + 1) && timer < (arg1 - 1))
    {
        if (button1_p())
            _skip = true;
    }
    if (_skip)
    {
        timer = arg1 - 1;
        safe_delete(obj_tennatalkbubble);
        safe_delete(obj_couchwriter);
        _skip = false;
    }
}
