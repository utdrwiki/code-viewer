scr_enemy_object_init();
recruitcount = 5;
talkmax = 90;
image_speed = 0.16666666666666666;
idlesprite = spr_shadowman_idle_b;
hurtsprite = spr_shadowman_hurt;
sparedsprite = spr_shadowman_spare;
if (i_ex(obj_rouxls_ch3_enemy) && obj_rouxls_ch3_enemy.phase == 1)
{
    idlesprite = spr_shadowman_idle_bunny;
    thissprite = spr_shadowman_idle_bunny;
    sparedsprite = spr_shadowman_idle_bunny;
    sprite_index = spr_shadowman_idle_bunny;
}
if (i_ex(obj_rouxls_ch3_enemy) && obj_rouxls_ch3_enemy.phase == 2)
{
    idlesprite = spr_shadowman_idle_cat;
    thissprite = spr_shadowman_idle_cat;
    sparedsprite = spr_shadowman_idle_cat;
    sprite_index = spr_shadowman_idle_cat;
}
custom_draw_example = 1;
gainmercyovertime = 1;
gainmercytimer = 0;
savekrishp = global.hp[1];
savesusiehp = global.hp[2];
saveralseihp = global.hp[3];
sharpshoottimer = 0;
sharpshootmercy = 0;
sharpshootlength = 0;
everyone100mercy = false;
darken = 0;
darkenalpha = 0;
sinery = 0;
actype = 0;
forceacttype = 0;
timberb = 0;
turn = 0;
createballoon = true;
myattackchoice = 0;
skipattack = false;
stopanimating = 0;
board4sharpshootscene = false;
boogiedmgwriter = -1;
guntimer = 0;
dingus = false;
init = 0;
firstframe = 0;
krisdancing = false;
susiedancing = false;
ralseidancing = false;
