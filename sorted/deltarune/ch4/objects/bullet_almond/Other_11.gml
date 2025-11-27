if (instance_number(obj_bullet_almond) < (6 + danger_level))
{
    var rnd_dir = irandom(360);
    var bullet = scr_fire_bullet(clamp(obj_growtangle.x + lengthdir_x(200, rnd_dir), obj_growtangle.x - 125, obj_growtangle.x + 125), clamp(obj_growtangle.y + lengthdir_y(200, rnd_dir), obj_growtangle.y - 125, obj_growtangle.y + 125), obj_bullet_almond, 180, 3, spr_almond);
    scr_bullet_inherit(bullet);
    bullet.active = true;
    bullet.activated = true;
    bullet.draw_eye = true;
    bullet.danger_level = danger_level;
    bullet.my_dir = point_direction(bullet.x, bullet.y, obj_growtangle.x + irandom_range(-70, 70), obj_growtangle.y + irandom_range(-70, 70));
    bullet.direction = bullet.my_dir;
    bullet.speed = 3.5;
    bullet.gravity_direction = bullet.my_dir;
    bullet.friction = -0.15;
    bullet.image_alpha = 0;
    scr_lerpvar_instance(bullet.id, "image_alpha", 0, 1, 8);
}
