inst = instance_create_depth(x + 120, y + 150, depth + 10, obj_shadowman_sharpshoot_target);
inst.type = 4;
if (obj_tenna_enemy.myattackchoice == 21)
    inst.type = 5;
if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigamedifficulty == 1)
    inst.type = 5;
inst.parentid = 136;
if (i_ex(obj_tenna_minigame_ui))
    depth = obj_tenna_minigame_ui.depth - 1;
if (inst.type == 4)
{
    if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity == true)
        inst.bullet_timer = 19;
}
instance_create(x, y, obj_lightemup_bg);
cursor_timer = 0;
cursor_con = 0;
cursor_siner = 66;
cursor_shoottimer = 0;
cursor_savex = 0;
cursor_savey = 0;
cursor_alpha = 0;
cursor_xscale = 3;
cursor_yscale = 3;
cursor_angle = 0;
cursor_alpha = 1;
cursor_x = camerax() + 200;
cursor_y = cameray() + 157;
cursor_xstart = cursor_x;
cursor_ystart = cursor_y;
shooting_enabled = true;
with (obj_tenna_enemy)
{
    var xx = camerax();
    var yy = cameray();
    obj_herokris.x -= 8;
    obj_herokris.y -= 12;
    obj_herosusie.x -= 8;
    obj_herosusie.y -= 6;
    obj_heroralsei.x -= 4;
    obj_herosusie.x = xx + 80;
    obj_herosusie.y = yy + 92;
    obj_herokris.x = xx + 116;
    obj_herokris.y = yy + 132;
    obj_heroralsei.x = xx + 64;
    obj_heroralsei.y = yy + 145;
    obj_herosusie.depth = obj_herokris.depth + 1;
    scr_act_charsprite("ralsei", spr_ralsei_zoosuit, 0, 0);
    scr_act_charsprite("kris", spr_kris_zoosuit, 0, 0);
    scr_act_charsprite("susie", spr_susie_zoosuit, 0, 0);
    with (obj_afterimage)
        instance_destroy();
}
if (obj_tenna_enemy.phaseturn == 18)
{
    with (obj_actor_tenna)
    {
        vspeed = 0;
        hspeed = 0;
        gravity = 0;
        image_xscale = 2;
        x = xstart;
        y = ystart;
        threepartmode = 1;
        with (obj_tenna_enemy)
        {
            minigametransition_con = 0;
            minigametransition_timer = 0;
        }
    }
}
endattack = false;
channelnumber = 1;
channeltransitioncount = 0;
transitioninit = 0;
shaketimer = 0;
starttimer = 0;
if (obj_tenna_enemy.alreadydidsharpshoot)
    starttimer = 1;
sharpshootlength = 0;
invincibility = 0;
extra_timer = 0;
strength = 200;
extravar = 0;
