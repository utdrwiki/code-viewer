scr_enemy_object_init();
recruitcount = 5;
talkmax = 90;
image_speed = 0;
idlesprite = spr_jackenstein_battle_eyes;
hurtsprite = spr_jackenstein_battle_eyes;
sparedsprite = spr_jackenstein_battle_eyes;
custom_draw_example = 1;
darken = 0;
darkenalpha = 0;
myattackchoice = 0;
haveusedultimate = false;
siner = 0;
turn = 0;
phase = 1;
phaseturn = 1;
endcon = 0;
endtimer = 0;
end_cutscene_version = 0;
balloonorder = 0;
ballooncon = 0;
balloonend = 1;
talkedcon = 0;
ralseitalks = 0;
susietalks = 0;
intro = 0;
introtimer = -30;
rs_rand = choose(0, 1, 2, 3, 4);
init = false;
spooked = false;
depth = 5;
fader = -1;
with (obj_battleback)
    instance_destroy();
with (obj_heroparent)
    visible = false;
susiemarker = -1;
susieblinktimer = choose(40, 75, 90);
susietimer = 0;
ralseimarker = -1;
ralseiblinktimer = choose(40, 75, 90);
ralseitimer = 0;
sact = false;
ract = false;
burnon = 0;
unleash = 0;
lightup = 0;
lightupx = 0;
fuelsaver = 0;
fuelsaverx = 0;
unleashcount = 0;
unleashfirstused = 0;
treasurehunt = 0;
checkcount = 0;
jackotimer = 0;
scr_setchar(1, 1);
if (!i_ex(obj_lightsource_heartlight))
{
    heartlight = instance_create(x, y, obj_lightsource_heartlight);
    heartlight.radius = 40;
    heartlight.heart_active = false;
}
if (!i_ex(obj_darkness_overlay))
{
    darkness = instance_create_depth(x, y, depth + 5, obj_darkness_overlay);
    darkness.sprite_index = spr_nothing;
    darkness.darkfight = true;
}
with (obj_light_following)
    lightalpha = 0;
global.drawdimmerlight = true;
antijacko = instance_create(x, y + 26, obj_marker);
antijacko.image_xscale = 80;
antijacko.image_yscale = 44;
antijacko.sprite_index = spr_whitepixel;
antijacko.visible = false;
juststartedbulletphase = false;
eyeflashtimer = 0;
fadeaway = 0;
finalattackballoon = 0;
flashcon = 0;
flashtimer = 0;
fun = 0;
funtimer = 0;
rr = -1;
mytarget = 4;
susiemarker = instance_create_depth(camerax() + 52, cameray() + 110, 3, obj_marker);
susiemarker.sprite_index = spr_susie_eyes_idle;
susiemarker.image_xscale = 2;
susiemarker.image_yscale = 2;
ralseimarker = instance_create_depth(camerax() + 80, cameray() + 210, 3, obj_marker);
ralseimarker.sprite_index = spr_ralsei_eyes_idle;
ralseimarker.image_xscale = 2;
ralseimarker.image_yscale = 2;
stopdrawing = false;
scaredycatcount = 0;
scaredycat = false;
