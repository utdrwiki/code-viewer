timer = 0;
full_timer = 999;
phase = 0;
ending_counter = 0;
bonk_side = -1;
anchor_x = obj_growtangle.x;
anchor_y = obj_growtangle.y - 40;
scr_darksize();
sprite_index = spr_gerson_swing;
image_index = 0;
image_speed = 0;
with (obj_hammer_of_justice_enemy)
    visible = false;
visible = false;
my_flash = scr_oflash();
my_flash.flashcolor = c_black;
my_flash.flashspeed *= 0.5;
scr_lerpvar("y", y, y + 80, 16, 2, "out");
scr_lerpvar("image_index", image_index, 6, 12);
snd_play(snd_boost);
global.turntimer = 9999;

box_bonk = function(arg0, arg1 = 24)
{
    with (obj_lerpvar)
    {
        if (target == other.id)
            instance_destroy();
    }
    x = obj_growtangle.x - (120 * arg0);
    y = anchor_y - 30;
    scr_lerpvar("image_index", 0, 6, 4);
    scr_lerpvar("y", y, y + choose(40, -40), 8, 2, "out");
    if (arg0 == -1)
    {
        image_xscale = abs(image_xscale);
        x -= 60;
    }
    else
    {
        image_xscale = -abs(image_xscale);
        x += 60;
    }
    my_flash = scr_oflash();
    my_flash.flashcolor = c_lime;
    my_flash.flashspeed *= 1;
    var new_x = anchor_x + ((100 + irandom(20)) * arg0);
    var new_y = anchor_y + irandom_range(-40, 40);
    snd_play(snd_queen_punched_lower);
    with (obj_growtangle)
    {
        scr_lerpvar("x", x, new_x, arg1 + 8, 2, "out");
        scr_lerpvar("y", y, new_y, arg1 + 8, 2, "out");
    }
};
