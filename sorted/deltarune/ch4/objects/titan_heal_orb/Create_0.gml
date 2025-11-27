var rand = random(0.3);
if (choose(true, false))
    sprite_index = spr_sneo_bigcircle;
else
    sprite_index = choose(spr_darkshape, spr_darkshape_evolving);
image_speed = 0;
image_angle = irandom(360);
image_alpha = 0;
targetx = camerax() + 500;
targety = cameray() + 210;
start_distance = 300;
timer = 0;
con = 0;
strongerheal = false;
init = false;
absorber = 1;
