scr_enemy_object_init();
recruitcount = 5;
talkmax = 90;
image_speed = 0.16666666666666666;
idlesprite = spr_holywater_alarm;
hurtsprite = spr_holywater_hurt;
sparedsprite = spr_holywater_alarm;
if (global.flag[1544] == 0)
{
    if (choose(0, 1) == 1)
        idlesprite = spr_holywater_idle;
    sparedsprite = idlesprite;
}
custom_draw_example = 1;
awake = true;
silence = 0;
ruckus = 0;
difficulty = 0;
timer = 0;
flirtedbefore = false;
havestolenbefore = false;
startedtired = false;
init = 0;
siner = random(100);
setbattlemsg = false;
dazzletimer = 0;
firstframe = 0;

wakeuptext = function()
{
    var __tiredwriter = instance_create(global.monsterx[myself], (global.monstery[myself] - (global.hittarget[global.chartarget[myself]] * 20)) + 20, obj_dmgwriter);
    __tiredwriter.type = 14;
    global.hittarget[global.chartarget[myself]] += 1;
};
