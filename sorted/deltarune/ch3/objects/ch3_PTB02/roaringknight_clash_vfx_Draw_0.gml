if (timer >= 9)
    instance_destroy();
var scale = 1;
if (timer == 7)
    scale = 1.2;
if (timer == 8)
    scale = 0.8;
if (timer == 9)
    scale = 0.6;
if (timer == 10)
    scale = 0.5;
if (timer > 3)
    draw_sprite_ext(spr_rude_orb, 0, (x + 200) - 38, (y + 37) - 10, 0.6 * scale, 0.9 * scale, image_angle - (timer * 80), c_white, image_alpha);
if (timer < 7)
{
    var px = (x + 200) - 36;
    var py = (y + 37) - 10;
    repeat (4)
    {
        var randdir = irandom(360);
        var dist = 40 + irandom(180);
        var randsizex = 0.35 + random(0.85);
        var randsizey = 0.45 + random(0.55);
        with (instance_create(px + lengthdir_x(dist, randdir), py + lengthdir_y(dist, randdir), obj_particle_generic))
        {
            image_xscale = randsizex;
            image_yscale = randsizey;
            direction = point_direction(x, y, px, py);
            image_angle = direction;
            scr_lerpvar("speed", 30, 60 + irandom(8), 6, 1, "in");
            scr_lerpvar("image_xscale", image_xscale * 16, 0, 6, 1, "in");
            scr_lerpvar("image_yscale", image_yscale, image_xscale * 0.5, 6, 1, "in");
        }
    }
    with (obj_particle_generic)
    {
        if (point_distance(x, y, px, py) <= 60)
            instance_destroy();
    }
}
