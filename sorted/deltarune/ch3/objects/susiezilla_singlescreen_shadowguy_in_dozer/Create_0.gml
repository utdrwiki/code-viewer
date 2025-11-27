event_inherited();
scr_darksize();
value = 10;
states = 
{
    none: -1,
    approach: 0,
    ram: 1,
    dead: 2
};
state = states.approach;
state_timer = 0;
image_speed = 0;
if (i_ex(obj_susiezilla_statue))
{
    if (obj_susiezilla_statue.x < (x - 24))
        facing = -1;
    else
        facing = 1;
}
block_facing = facing;
xanchor = x;
y = clamp(y, 200, 380);
ystart = y;
myxcenter = x;
myycenter = y;
dozing_speed = 0;
damage = 15;
knockback = 10;
blockable = false;
pushalong = 15;
flash = 0;
scr_lerpvar("ropeheight", -360, 0, 16, 1, "in");
scr_script_delayed(scr_var, 16, "blockable", true);
alarm[5] = 16;
snd_play_x(snd_drive, 0.5, 1.2);

instant_defeat_dozer = function()
{
    if (state == states.dead)
        exit;
    if (ropeheight != 0)
    {
        with (obj_lerpvar)
        {
            if (target == other.id)
                instance_destroy();
        }
        with (obj_script_delayed)
        {
            if (target == other.id)
                instance_destroy();
        }
    }
    sprite_index = spr_susiezilla_shadowguy_driver;
    image_index = 0;
    image_speed = 0;
    state = states.dead;
    state_timer = 0;
    blockable = false;
    flash = 0;
    alarm[5] = -1;
    scr_lerpvar("ropeheight", ropeheight, ropeheight + 16, 8, 1, "out");
    scr_script_delayed(scr_lerpvar, 8, "ropeheight", ropeheight + 16, -360, 24, 1, "in");
    scr_script_delayed(instance_destroy, 44);
    with (instance_create_depth(x - (34 * facing), y - 74, depth, obj_dozer_parts))
    {
        sprite_index = spr_susiezilla_dozer_pieces;
        image_index = 0;
        image_xscale *= other.facing;
        h_speed = -3 * other.facing;
        v_speed = -8;
        ground = other.y;
    }
    with (instance_create_depth(x + (34 * facing), y - 74, depth, obj_dozer_parts))
    {
        sprite_index = spr_susiezilla_dozer_pieces;
        image_index = 2;
        image_xscale *= other.facing;
        h_speed = 3 * other.facing;
        v_speed = -8;
        ground = other.y;
    }
    with (instance_create_depth(x - (34 * facing), y - 16, depth, obj_dozer_parts))
    {
        sprite_index = spr_susiezilla_dozer_pieces;
        image_index = 1;
        image_xscale *= other.facing;
        h_speed = -4 * other.facing;
        v_speed = -5;
        ground = other.y;
    }
    with (instance_create_depth(x + (34 * facing), y - 16, depth, obj_dozer_parts))
    {
        sprite_index = spr_susiezilla_dozer_pieces;
        image_index = 3;
        image_xscale *= other.facing;
        h_speed = 4 * other.facing;
        v_speed = -5;
        ground = other.y;
    }
    with (obj_susiezilla_gamecontroller)
        check_enemies();
};

with (obj_susiezilla_gamecontroller)
{
    if (dozer_count < 2)
    {
        dozer_count++;
        if (dozer_count == 2)
        {
            var tetalk = stringsetloc("* More dozers!! Susie!! Don't let them scrap me!!!", "obj_susiezilla_singlescreen_shadowguy_in_dozer_slash_Create_0_gml_148_0");
            scr_script_delayed(scr_tennashouter, 15, tetalk, 150);
        }
    }
}
