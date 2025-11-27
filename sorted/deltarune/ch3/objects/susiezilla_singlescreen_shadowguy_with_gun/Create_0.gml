event_inherited();
scr_darksize();
value = 5;
states = 
{
    none: -1,
    rope: 0,
    intro: 1,
    reposition: 2,
    idle: 3,
    gun: 4,
    dead: 6
};
state = states.intro;
state_timer = 0;
shoot_angle = 0;
s_idle = 1408;
s_fire = 4427;
s_hurt = 4389;
s_grab = 1093;
s_grab_rise = 4606;
s_grab_fall = 4458;
s_spin = 4523;
s_spin_large = 4102;
s_fallen = 4314;
sprite_index = s_idle;
image_speed = 0.25;
y = clamp(y, 200, 380);
xanchor = x;
yanchor = y;
myxcenter = x;
myycenter = y;
fakeheight = -20;
maxheight = -20;
bobble = 0;
fric_var = 0.85;
state = states.rope;
scr_lerpvar("ropeheight", -360, 0, 16, 1, "out");
scr_script_delayed(scr_var, 16, "con", 0);
with (obj_susiezilla_gamecontroller)
{
    if (mode == 0 && !gunman_spawned)
    {
        gunman_spawned = true;
        var tetalk = stringsetloc("* See a ball!? Send it back!", "obj_susiezilla_singlescreen_shadowguy_with_gun_slash_Create_0_gml_65_0");
        var tetalk2 = stringsetloc("* Just like catch with pops!!", "obj_susiezilla_singlescreen_shadowguy_with_gun_slash_Create_0_gml_66_0");
        scr_tennashouter(tetalk, 120);
        scr_script_delayed(scr_tennashouter, 119, tetalk2, 120);
    }
}
