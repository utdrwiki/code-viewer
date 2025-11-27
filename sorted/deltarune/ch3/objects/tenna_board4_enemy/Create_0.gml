scr_enemy_object_init();
recruitcount = 5;
talkmax = 90;
image_speed = 0;
idlesprite = spr_tenna_point_up;
hurtsprite = spr_tenna_hurt;
sparedsprite = spr_tenna_sad;
custom_draw_example = 1;
darken = 0;
darkenalpha = 0;
myattackchoice = 0;
haveusedultimate = 0;
siner = 0;
turn = 0;
phaseturn = 0;
phase = 1;
phaseturn = 0;
endcon = 0;
endtimer = 0;
end_cutscene_version = 0;
balloonorder = 0;
ballooncon = 0;
balloonend = 1;
talkedcon = 0;
ralseitalks = 0;
susietalks = 0;
debugvar = 0;
attackchosen = false;
intro = 0;
introtimer = 0;
points = 0;
gothit = false;
bet = false;
betamount = 0;
pointsmultiplier = 1;
pointsmultiplierthisturn = 5;
haveusedbetbefore = false;
extrapointsviatension = 0;
popularboy = false;
saveralseihp = 0;
healthphase = 1;
resetralsei = false;
ilovetvcount = 0;
resistcount = 0;
intro = 0;
didkrisdoswordroute = false;
talked = 0.1;
softintro = false;
if (global.flag[1050] == 1)
    didkrisdoswordroute = true;
if (global.encounterno == 134 || global.encounterno == 135)
    tenna_actor = instance_create_depth(camerax() + 566, cameray() + 260, depth - 999999991, obj_actor_tenna);
else
    tenna_actor = instance_create_depth(camerax() + 526, cameray() + 260, depth - 999999991, obj_actor_tenna);
tenna_actor.preset = 2;
tenna_actor.reversal = 0;
if (instance_number(obj_monsterparent) == 1)
{
    tenna_actor.vspeed = -31;
    tenna_actor.x = camerax() + 330;
    tenna_actor.y = cameray() + 620;
    tenna_actor.depth = depth - 10;
}
else
{
    softintro = true;
    intro = 1;
    talktimer = -10;
    tenna_actor.sprite_index = spr_tenna_pose_podium;
    tenna_actor.image_index = 2;
}
scr_speaker("tenna");
global.fc = 22;
global.typer = 80;
gachainit = 0;
sharpshootmercy = 0;
digit_alpha = 0;
digit_flash_timer = 0;
digit_flash_duration = 10;
ilovetv = 0;
ilovetv_increase = 0;
ilovetv_increased = false;
ilovetv_pitch = 1;
tietimer = 0;
hurtvar = false;
global.spell[1][0] = 0;
battleresult = 0;
hidetvcount = false;
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
if (!variable_global_exists("board4ilovetvcount"))
    global.board4ilovetvcount = 0;
