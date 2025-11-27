var lightcol = image_blend;
depth = 950000;
if (global.interact == 0 || premove == 0)
    timer += timerrate;
if (movetype == 1)
    y = (wally - mt1off) + (sin(timer / rate) * movespeed);
if (movetype == 2 && global.interact == 0)
{
    y += movespeed;
    if (y > 700)
        y -= 900;
}
if (movetype == 3)
{
    y = (wally - 60) + (sin(timer / rate) * movespeed);
    x = xstart + (sin(timer / rate / 2) * movespeed * 2);
}
if (movetype == 4)
{
    x = xstart - (sin(timer / amplitude) * xrange);
    y = ystart + (cos(timer / amplitude) * range);
}
var drawx = x;
var drawy = y;
if (type == 0)
{
    draw_sprite_ext(sprite_index, 0, drawx + (sin(timer / 10) * 4), drawy + (cos(timer / 23) * 1), image_xscale * 2, image_yscale, 0, lightcol, image_alpha * 0.5);
    draw_sprite_ext(sprite_index, 0, drawx + (sin(timer / 11) * 4), drawy, (image_xscale * 2) + 0.5, image_yscale + 0.2, 0, lightcol, image_alpha * 0.4);
}
if (type == 1)
{
    var wallStretchScale = 8;
    var normalStretchScale = 4;
    var fullHeight = sprite_height;
    var squashedTop = -1;
    var stretchedHeight = sprite_height;
    var squashedHeight = 1;
    stretchedHeight = min((wally - y) / wallStretchScale, sprite_height);
    var withinCollision = 0;
    var collisionx1 = x + 80;
    var collisionx2 = (x + (sprite_width * normalStretchScale)) - 80;
    var collisiony1 = wally - 40;
    var collisiony2 = wally + 40;
    var foundObject = -4;
    var caught = 0;
    if (global.interact == 0 && !alerted)
    {
        if (detecttype == 0)
        {
            if (y < wally && abs(y - wally) < 110)
            {
                foundObject = collision_rectangle(collisionx1, collisiony1, collisionx2, collisiony2, obj_mainchara, false, true);
                if (foundObject != -4)
                    caught = 1;
                draw_set_color(c_white);
                if (caught == 1)
                {
                    alerter = foundObject;
                    alerted = 1;
                }
            }
        }
        if (detecttype == 1)
        {
            withinCollision = 0;
            collisionx1 = x + 50;
            collisionx2 = (x + (sprite_width * normalStretchScale)) - 50;
            collisiony1 = bbox_top;
            collisiony2 = y + 30;
            foundObject = -4;
            caught = 0;
            foundObject = collision_rectangle(collisionx1, collisiony1, collisionx2, collisiony2, obj_mainchara, false, true);
            if (foundObject != -4)
                framecount++;
            else
                framecount = 0;
            if (framecount >= 2)
                caught = 1;
            if (caught == 1)
            {
                alerter = foundObject;
                alerted = 1;
            }
        }
        if (detecttype == 2)
        {
            collisionx1 = x + 84;
            collisionx2 = (x + (sprite_width * normalStretchScale)) - 84;
            collisiony1 = wally;
            collisiony2 = wally + 40;
            if (y < (wally + 10) && abs(y - wally) < 112)
            {
                foundObject = collision_rectangle(collisionx1, collisiony1, collisionx2, collisiony2, obj_mainchara, false, true);
                if (foundObject != -4)
                    framecount++;
                else
                    framecount = 0;
                if (framecount >= 2)
                    caught = 1;
                draw_set_color(c_white);
                if (caught == 1)
                {
                    alerter = foundObject;
                    alerted = 1;
                    snd_play(snd_error);
                }
            }
        }
    }
    if (givepoints == 0)
        lightcol = merge_color(lightcol, c_blue, 0.1);
    if (stretchedHeight > 0)
        draw_sprite_part_ext(sprite_index, 0, 0, 0, sprite_width, stretchedHeight, x, y, normalStretchScale, wallStretchScale, lightcol, image_alpha * 0.45);
    draw_sprite_part_ext(sprite_index, 0, 0, stretchedHeight, sprite_width, sprite_height - stretchedHeight, x, y + (stretchedHeight * wallStretchScale), normalStretchScale, normalStretchScale, lightcol, image_alpha * 0.6);
}
if (drawlamp)
{
    var modder = sin(timer / 10);
    if (type == 1)
        modder = 0;
    var xloc = x;
    if (type == 1)
        xloc = drawx + 60;
    var wirecolor = 659218;
    draw_sprite_ext(spr_pxwhite, 0, (xloc + (modder * 2)) - 2, (ystart + ((y - ystart) / 4)) - lightpos, 2, 40, -180, wirecolor, 1);
    draw_sprite_ext(spr_pxwhite, 0, xloc + (modder * 2) + 4, (ystart + ((y - ystart) / 4)) - lightpos, 2, 40, -180, wirecolor, 1);
    draw_sprite_ext(spr_pxwhite, 0, (xloc + (modder * 1.5)) - 2, (ystart + ((y - ystart) / 4)) - lightpos - 40, 2, 120, -180, wirecolor, 1);
    draw_sprite_ext(spr_pxwhite, 0, xloc + (modder * 1.5) + 4, (ystart + ((y - ystart) / 4)) - lightpos - 40, 2, 120, -180, wirecolor, 1);
    draw_sprite_ext(spr_b3bs_decor_spotlight, 0, xloc + (modder * 2), (ystart + ((y - ystart) / 4)) - lightpos, 2, 2, 0, c_white, 1);
}
premove = 1;
