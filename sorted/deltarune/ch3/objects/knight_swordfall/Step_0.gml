local_turntimer--;
obj_knight_enemy.siner2 = 0;
anchor_x = obj_knight_enemy.x;
anchor_y = obj_knight_enemy.y;
if ((global.time % 4) == 0 && sprite_index != spr_roaringknight_sword_ol && image_alpha != 0 && !alarm[5] && !alarm[2])
{
    if (sprite_index == spr_roaringknight_attack_ol_center)
    {
        fade = scr_afterimage();
        fade.x = camerax() + 544;
        fade.y = obj_knight_enemy.ystart + (cos(_siner / 8) * 8);
        fade.depth = creatorid.depth + 1;
        fade.image_alpha = 0.6;
        fade.fadeSpeed = 0.04;
        fade.hspeed = 4;
    }
    else
    {
        fade = scr_afterimage();
        fade.depth = creatorid.depth + 1;
        fade.image_alpha = 0.6;
        fade.fadeSpeed = 0.04;
        fade.hspeed = 4;
    }
}
if (alarm[0])
    exit;
countdown--;
if (countdown == 0)
{
    var ex = 0;
    if (difficulty == 1)
        ex = 30;
    if (local_turntimer < (turn_time - ex))
    {
        countdown = 99999;
        local_turntimer = 99999;
        if (turn_type != "start" && turn_type != "short start" && turn_type != "short mid")
        {
            alarm[1] = 8;
            alarm[2] = 60;
        }
        if (turn_type == "start" || turn_type == "short start" || turn_type == "short mid")
        {
            scr_lerpvar("image_index", 4, 0, 8);
            alarm[3] = 4;
        }
        exit;
    }
    with (instance_create((obj_growtangle.x - 110) + random(220), (obj_growtangle.y - 110) + random(30), obj_fallingsword))
    {
        image_angle = point_direction(x, y, clamp((obj_growtangle.x + 95) - random(190), x - 40, x + 40), obj_growtangle.y + 110);
        direction = image_angle;
        speed = -4;
        scr_lerpvar("image_yscale", 0, -1, 8);
        scr_script_delayed(scr_lerpvar, 8, "image_yscale", -1, 1, 8);
        scr_lerpvar("image_angle", image_angle, image_angle + 360, 16, 1, "out");
        scr_lerpvar("image_alpha", 0, 1, 16, 1, "out");
    }
    if (difficulty == 0)
    {
        countdowner = scr_approach(countdowner, 5, 5);
        countdown = countdowner - irandom(1);
    }
    if (difficulty == 1)
    {
        countdowner = scr_approach(countdowner, 4, 5);
        countdown = countdowner;
    }
}
