if (con == 0)
{
    if (global.dogtowerskipintro == true)
    {
        with (obj_camera_clamper)
        {
            xmin = 120;
            xmax = 120;
        }
    }
}
if (con == 0 && obj_mainchara.y < 8640)
{
    con = 1;
    if (global.dogtowerskipintro == true)
        con = 3;
    global.interact = 1;
    global.facing = 0;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
}
if (con == 1)
{
    timer++;
    if (timer == 1)
    {
        startcamy = cameray();
        with (obj_tower_dog_ladder_fake)
            depth = obj_rotating_tower_controller_new.depth - 5;
        with (obj_rotating_bullet_new)
            visible = false;
        with (obj_camera_clamper)
        {
            scr_lerpvar("xmin", 0, 120, 60);
            scr_lerpvar("xmax", 0, 120, 60);
        }
    }
    var lerpval = -(cos((pi * timer) / 60) - 1) / 2;
    camerax_set(lerp(0, 120, lerpval));
    cameray_set(lerp(startcamy, 3800, lerpval));
    if (timer == 5)
    {
    }
    if (timer == 15)
    {
    }
    if (timer == 60)
    {
        timer = 0;
        con = 2;
    }
}
if (con == 2)
{
    timer++;
    if (timer == 1)
    {
    }
    if (timer == 2)
    {
    }
    if (timer >= 120)
    {
        var lerpval = -(cos((pi * (timer - 120)) / 40) - 1) / 2;
        cameray_set(lerp(3800, 8434, lerpval));
    }
    if (timer == 160)
    {
        timer = 0;
        con = 3;
        with (obj_rotating_tower_controller_new)
        {
        }
    }
}
if (con == 3)
{
    dog.hspeed = -2;
    if (global.dogtowerskipintro == true)
        dog.hspeed = -4;
    global.facing = 1;
    scr_actor_facing(kr_actor, "r");
    if (dog.x <= 560)
    {
        dog.x = 560;
        dog.hspeed = 0;
        dog.image_speed = 0;
        con = 4;
    }
}
if (con == 4)
{
    timer++;
    if (global.dogtowerskipintro == true)
        timer = max(180, timer);
    if (timer == 60)
        letterboxcon = 1;
    if (timer == 210)
    {
        con = 5;
        timer = 0;
    }
}
if (con == 5)
{
    timer++;
    if (timer == 1)
    {
        layer_set_visible("TowerTop_Fake", false);
        snd_play(snd_jump);
        with (kr_actor)
        {
            scr_jump_to_point(296, 8440, 10, 25);
            sprite_index = spr_kris_jump_ball;
            image_speed = 1;
            walk = 0;
        }
        with (dog)
        {
            x -= 20;
            scr_jump_to_point(542, 8440, 10, 25);
            sprite_index = spr_dog_jump_ball;
            image_xscale = 1.5;
            image_yscale = 1.5;
            image_speed = 1;
        }
        scr_pan_lerp(camerax(), 8238, 25);
    }
    if (timer == 28)
    {
        instance_create((kr_actor.x + 4) - 120, kr_actor.y + 20, obj_climb_kris);
        obj_mainchara.freeze = true;
        obj_mainchara.y = kr_actor.y;
        with (obj_rotating_bullet_new)
            visible = true;
        instance_create_depth(0, 0, depth - 10, obj_tower_dog);
        with (kr_actor)
            visible = false;
        with (dog)
            visible = false;
        con = 6;
        timer = 0;
        global.dogtowerskipintro = true;
        global.currentsong[0] = snd_init("mus_race.ogg");
        global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
        global.interact = 0;
        obj_rotating_tower_controller_new.tower_falls_apart_con = 1;
    }
}
if (con == 6)
{
    timer++;
    if (obj_rotating_tower_controller_new.endclimb)
    {
        if (dogcon < 0)
        {
            dogcon -= 1;
            if (dogcon == -80)
            {
                dogcon = 0;
                var moved_up;
                for (moved_up = 0; obj_climb_kris.y > 1500; moved_up += 40)
                {
                    obj_climb_kris.y -= 40;
                    obj_climb_kris._cameray -= 40;
                    obj_climb_kris.remy -= 40;
                    obj_tower_dog.draw_y -= 40;
                    with (obj_tower_dog_stilts2)
                        y -= 40;
                }
                cameray_set(cameray() - moved_up);
            }
        }
    }
    if (dogcon >= 0)
    {
        if (camlerpstarty == -1)
        {
            camlerpstarty = cameray();
            camlerpstartsub = obj_rotating_tower_controller_new.endclimbtimer;
        }
        cameray_set(lerp(camlerpstarty, 0, clamp((obj_rotating_tower_controller_new.endclimbtimer - camlerpstartsub) / 120, 0, 1)));
    }
    if (dogcon == 0 && i_ex(obj_tower_dog) && (obj_rotating_tower_controller_new.tower_ystart + 400) > obj_tower_dog.draw_y && obj_rotating_tower_controller_new.endclimb == true)
    {
        snd_play(snd_jump);
        with (dog)
        {
            visible = true;
            x = 320;
            y = obj_tower_dog.draw_y;
            x -= 20;
            sprite_index = spr_dog_jump_ball;
            image_xscale = 1.5;
            image_yscale = 1.5;
            image_speed = 1;
            scr_jump_to_point(306, 264, 10, 22);
        }
        with (obj_tower_dog)
            instance_destroy();
        dogcon = 1;
    }
    if (dogcon == 1)
    {
        dogtimer++;
        if (dogtimer == 25)
        {
            dogtimer = 0;
            dogcon = 2;
            snd_play(snd_bump);
            with (dog)
            {
                x += 18;
                y += 10;
                sprite_index = spr_dog_walk;
                image_xscale = -2;
                image_yscale = 2;
                image_speed = 0.16666666666666666;
            }
        }
    }
    if (dogcon == 2)
    {
        timer = -30;
        con = 7;
        snd_free(global.currentsong[0]);
    }
}
if (con == 7 && !i_ex(obj_cutscene_master))
{
    cameray_set(lerp(cameray(), 0, clamp((obj_rotating_tower_controller_new.endclimbtimer - 60) / 100, 0, 1)));
    timer++;
    if (timer == 0)
        global.interact = 1;
    if (timer == 60)
    {
        dog.hspeed = 2;
        dog.image_xscale = -2;
    }
    if (timer == 119)
        dog.hspeed = 0;
    if (timer == 201)
        dog.hspeed = -1;
    if (timer == 209)
    {
        dog.hspeed = 8;
        scr_pan_lerp(camerax() + 220, cameray(), 60);
    }
    if (timer == 257)
    {
        dog.hspeed = 0;
        dog.image_xscale = 2;
    }
    if (timer == 278)
        dog.vspeed = -2;
    if (timer == 300)
    {
        dog.vspeed = 0;
        snd_play(snd_link_sfx_itemget);
        with (obj_tower_dog_bone)
        {
            scr_lerpvar("x", x, other.dog.x, 12, 2, "in");
            scr_lerpvar("y", y, other.dog.y - 32, 12, 2, "out");
        }
        obj_mainchara.x = 296;
        obj_mainchara.y = 200;
        with (obj_mainchara)
        {
            visible = 1;
            depth = -99999999;
        }
        with (obj_climb_kris)
            instance_destroy();
        with (kr_actor)
            instance_destroy();
        global.facing = 1;
    }
    if (timer == 306)
        makestars = true;
    if (timer == 340)
    {
        with (obj_tower_dog_bone)
            instance_destroy();
    }
    if (timer == 390)
    {
        dog.hspeed = 2;
        dog.image_xscale = -2;
    }
    if (timer == 510)
    {
        with (dog)
            instance_destroy();
        scr_pan_lerp(0, cameray(), 60);
    }
    if (timer == 570)
    {
        with (obj_mainchara)
            alarm[1] = 7;
        obj_mainchara.cutscene = 0;
        obj_mainchara.freeze = 0;
        global.interact = 0;
        con = 99;
        scr_flag_set(1642, 1);
        scr_tempsave();
    }
}
with (obj_mainchara)
{
    if (other.con < 6 && other.con > 0)
        cutscene = 1;
}
if (makestars == true)
{
    makestarstimer++;
    if ((makestarstimer % 2) == 0)
    {
        var star = instance_create(obj_tower_dog_bone.x, obj_tower_dog_bone.y, obj_marker);
        with (star)
        {
            sprite_index = spr_board_star_8px;
            direction = other.makestarstimer * 20;
            speed = 5;
            friction = 0.25;
            image_index = irandom(3);
            image_xscale = 2;
            image_yscale = 2;
            depth = obj_tower_dog_bone.depth + 1;
            image_speed = 0;
            scr_doom(id, random_range(13, 16));
        }
        star = instance_create(obj_tower_dog_bone.x, obj_tower_dog_bone.y, obj_marker);
        with (star)
        {
            sprite_index = spr_board_star_8px;
            direction = (other.makestarstimer * 20) + 180;
            speed = 5;
            friction = 0.25;
            image_index = irandom(3);
            image_xscale = 2;
            image_yscale = 2;
            depth = obj_tower_dog_bone.depth + 1;
            image_speed = 0;
            scr_doom(id, random_range(13, 16));
        }
    }
    if (makestarstimer >= 16)
        makestars = false;
}
