scr_enemy_object_init();
recruitcount = 5;
talkmax = 90;
image_speed = 0.16666666666666666;
idlesprite = spr_roaringknight_idle;
hurtsprite = spr_roaringknight_idle;
sparedsprite = spr_roaringknight_hurt;
custom_draw_example = 1;
siner = 0;
siner2 = 0;
if (i_ex(obj_ch3_PTB02_roaringknight))
{
    siner2 = obj_ch3_PTB02_roaringknight.siner2;
    ystart = obj_ch3_PTB02_roaringknight.ystart;
    y = obj_ch3_PTB02_roaringknight.y;
}
aetimer = 0;
combo_power = 1;
first_attack = 4;
second_attack = 2;
third_attack = 3;
rotatingslash3used = false;
holdbreathcount = 0;
sactcount = 0;
ractcount = 0;
chargeupcon = 0;
chargeuptimer = 0;
turn = 0;
phaseturn = 0;
phase = 1;
phaseturn = 0;
myattackchoice = 0;
endcon = 0;
endtimer = 0;
end_cutscene_version = 0;
balloonturn = 0;
with (obj_battlecontroller)
    cantspare[0] = 1;
talkedcon = 0;
ralseitalks = 0;
susietalks = 0;
balloonorder = 0;
ballooncon = 0;
balloonend = 1;
blocking = 1;
blockanim = 0;
blockcon = 0;
blocktimer = 0;
introtimer = 0;
damagereduction = 0.04;
damagereductiontimer = 0;
krisdamagereduction = 0.5;
whiteflash = 0;
haveusedroaring = false;
suddenlyattackrose = false;
checkcount = 0;
aoedamage = false;
stronghurtanim = false;
debugvar = false;
progamer = true;
krisdownmessage = false;
susiedownmessage = false;
ralseidownmessage = false;
setdownmessage = false;
damagecounter = 0;
phase4turn = 0;
if (!variable_global_exists("firstknightbattle"))
    global.firstknightbattle = 1;
else
    global.firstknightbattle++;
overrideAttack = 0;
with (obj_herosusie)
{
    normalsprite = spr_susier_dark_unhappy;
    idlesprite = spr_susieb_idle_serious;
    defendsprite = spr_susieb_defend_unhappy;
    actreadysprite = spr_susieb_actready;
    attacksprite = spr_susieb_attack_serious;
    if (global.charweapon[2] == 0)
        idlesprite = spr_susieb_idle_unarmed_unhappy;
    itemsprite = spr_susieb_item_unhappy;
    itemreadysprite = spr_susieb_itemready_unhappy;
    spellreadysprite = spr_susieb_spellready_unhappy;
    spellsprite = spr_susieb_spell_unhappy;
    defeatsprite = spr_susie_dw_fell;
}
with (obj_battleback)
    instance_destroy();
instance_create(x, y, obj_bgfountaintest);
global.tempflag[96] = 0;
