attackcount = 0;
attackcountmax = 0;
attacktimer = 0;
swingdown_ex = 0;
if (trueturn >= 20)
    attackpattern = 19;
if (attackpattern == 100)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    var beat = 16;
    var speardistance = 80;
    var special = 14;
    var heartframestotal = 100;
    beat = 16;
    heartframestotal = 100;
    scr_spearpattern("u", 40, heartframestotal, special, 40, 80);
    heartframestotal += beat;
    scr_spearpattern("u", 20, heartframestotal, special, 10, 120);
    heartframestotal += beat;
    scr_spearpattern("u", 20, heartframestotal, special, 10, 120);
    heartframestotal += beat;
    scr_spearpattern("l", 40, heartframestotal, special, 0, 80);
    heartframestotal += beat;
    scr_spearpattern("r", 20, heartframestotal, special, 0, 150);
    heartframestotal += beat;
    scr_spearpattern("r", 30, heartframestotal, special, 40, 400);
    heartframestotal += beat;
    heartframestotal = 130;
    scr_spearpattern("u", 65, heartframestotal, special, 0, 40);
    heartframestotal += beat;
    scr_spearpattern("d", 30, heartframestotal, special, 0, 80);
    heartframestotal += beat;
    scr_spearpattern("l", 40, heartframestotal, special, 0, 160);
    heartframestotal += beat;
    scr_spearpattern("r", 55, heartframestotal, special, 50, 300);
    heartframestotal += beat;
    heartframestotal = 130;
    scr_spearpattern("l", 30, heartframestotal, special, 0, 160);
    heartframestotal += beat;
    scr_spearpattern("u", 37, heartframestotal, special, 0, 300);
    heartframestotal += (beat * 2);
    scr_spearpattern("u", 45, heartframestotal, special, 0, 300);
    heartframestotal += beat;
    scr_spearpattern("r", 55, heartframestotal, special, 0, 80);
    heartframestotal += beat;
    scr_spearpattern("r", 65, heartframestotal, special, 50, 300);
    heartframestotal += beat;
    heartframestotal = 130;
    scr_spearpattern("l", 65, heartframestotal, special, 0, 40);
    heartframestotal += beat;
    scr_spearpattern("r", 30, heartframestotal, special, 0, 80);
    heartframestotal += beat;
    scr_spearpattern("u", 40, heartframestotal, special, 0, 160);
    heartframestotal += beat;
    scr_spearpattern("d", 55, heartframestotal, special, 50, 300);
    heartframestotal += beat;
}
if (attackpattern == 101)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    var beat = 10;
    var speardistance = 80;
    var special = 14;
    var heartframestotal = 100;
    scr_spearpattern("d", 200, heartframestotal + 70, special, 20, 260);
    scr_spearpattern("u", 165, heartframestotal + 50, special, 0, 140);
    heartframestotal += beat;
    scr_spearpattern("l", 60, heartframestotal, special, 0, 80);
    heartframestotal += beat;
    scr_spearpattern("r", 70, heartframestotal, special, 0, 340);
    heartframestotal += beat;
    scr_spearpattern("u", 80, heartframestotal, special, 0, 200);
    heartframestotal += (beat + 16);
    scr_spearpattern("d", 100, heartframestotal, special, 0, 340);
    heartframestotal += beat;
    heartframestotal += beat;
    scr_spearpattern("l", 120, heartframestotal, special, 0, 250);
    heartframestotal += beat;
    scr_spearpattern("r", 130, heartframestotal, special, 180, 340);
    heartframestotal += beat;
}
if (attackpattern == 110)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    var beat = 9;
    var special = 19;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, special, 90);
    scr_spearpattern("u", spearspeed, heartframes, special, beat);
    scr_spearpattern("l", spearspeed, heartframes, special, beat);
    scr_spearpattern("r", spearspeed, heartframes, special, beat);
    scr_spearpattern("d", spearspeed, heartframes, special, 50);
    scr_spearpattern("ul", spearspeed * 1.2, heartframes, special, beat);
    scr_spearpattern("u", spearspeed, heartframes, special, beat);
    scr_spearpattern("ur", spearspeed, heartframes, special, 50);
    scr_spearpattern("dl", spearspeed * 1.2, heartframes, special, beat);
    scr_spearpattern("d", spearspeed, heartframes, special, beat);
    scr_spearpattern("dr", spearspeed, heartframes, special, beat);
}
if (attackpattern == 111)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    var beat = 9;
    var special = 20;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, special, 90);
    scr_spearpattern("u", spearspeed, heartframes, special, beat);
    scr_spearpattern("l", spearspeed, heartframes, special, beat);
    scr_spearpattern("r", spearspeed, heartframes, special, beat);
    scr_spearpattern("d", spearspeed, heartframes, special, 120);
}
if (attackpattern == 112)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    var beat = 9;
    var special = 21;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, special, 50);
    spearspeed = 12;
    heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, 0, 35);
    scr_spearpattern("u", spearspeed, heartframes, 0, 8);
    scr_spearpattern("u", spearspeed, heartframes, 0, 25);
    scr_spearpattern("l", spearspeed, heartframes, 0, 38);
    scr_spearpattern("d", spearspeed, heartframes, 0, 25);
    scr_spearpattern("r", spearspeed, heartframes, 0, 4);
    scr_spearpattern("r", spearspeed, heartframes, 0, 4);
    scr_spearpattern("r", spearspeed, heartframes, 0, 4);
    scr_spearpattern("r", spearspeed, heartframes, 0, 4);
    scr_spearpattern("r", spearspeed, heartframes, 0, 20);
    scr_spearpattern("l", spearspeed, heartframes, 0, 6);
    scr_spearpattern("l", spearspeed, heartframes, 0, 6);
    scr_spearpattern("l", spearspeed, heartframes, 0, 18);
    scr_spearpattern("l", spearspeed, heartframes, 0, 6);
    scr_spearpattern("l", spearspeed, heartframes, 0, 6);
}
if (attackpattern == 120)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern("u", 10, 50, 25, 60, 100);
    scr_spearpattern("r", 10, 50, 25, 22, 30);
    scr_spearpattern("l", 10, 50, 25, 10, 15);
    scr_spearpattern("d", 10, 50, 25, 40, 30);
}
if (attackpattern == 140)
{
    var beat = 40;
    var special = 32;
    scr_spearpattern("up1", 0, 0, special, beat);
    scr_spearpattern("up2", 0, 0, special, beat);
    scr_spearpattern("left1", 0, 0, special, beat);
    scr_spearpattern("left2", 0, 0, special, beat);
    scr_spearpattern("down1", 0, 0, special, beat);
    scr_spearpattern("down2", 0, 0, special, beat);
    scr_spearpattern("right1", 0, 0, special, beat);
    scr_spearpattern("right2", 0, 0, special, beat);
    scr_spearpattern("diag1", 0, 0, special, beat);
    scr_spearpattern("diag2", 0, 0, special, beat);
    scr_spearpattern("diag3", 0, 0, special, beat);
    scr_spearpattern("diag4", 0, 0, special, beat);
    scr_spearpattern(0, -70, 0, special, beat);
    scr_spearpattern(70, 0, 270, special, beat);
    scr_spearpattern(90, -90, 315, special, beat);
    scr_spearpattern(-90, -90, 45, special, beat);
    scr_spearpattern(-90, 90, 135, special, beat);
    scr_spearpattern(90, 90, 225, special, beat);
    scr_spearpattern(0, 0, 0, 10, 1);
}
if (attackpattern == 150)
{
    scr_spearpattern(0, 10, 60, 26, 9999);
    scr_spearpattern(0, 10, 60, 0, 9999);
}
if (attackpattern == 160)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 10);
    var beat = 9;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("l", spearspeed, heartframes, 19, 20);
    scr_spearpattern("u", spearspeed, heartframes, 0, 6);
    scr_spearpattern("u", spearspeed, heartframes, 0, 6);
    scr_spearpattern("u", spearspeed, heartframes, 0, 6);
    scr_spearpattern("r", spearspeed, heartframes, 19, 26);
    scr_spearpattern("u", spearspeed, heartframes, 0, 6);
    scr_spearpattern("u", spearspeed, heartframes, 0, 18);
    scr_spearpattern("r", spearspeed, heartframes, 19, 11);
    scr_spearpattern("u", spearspeed, heartframes, 0, 6);
    scr_spearpattern("u", spearspeed, heartframes, 0, 6);
    scr_spearpattern("u", spearspeed, heartframes, 0, 20);
    scr_spearpattern("l", spearspeed, heartframes, 19, 26);
    scr_spearpattern("u", spearspeed, heartframes, 0, 6);
    scr_spearpattern("u", spearspeed, heartframes, 0, 20);
}
if (attackpattern == 170)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 1);
    var beat = 9;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, 40, 40);
    scr_spearpattern("l", spearspeed, heartframes, 0, 8);
    scr_spearpattern("dl", spearspeed, heartframes, 0, 8);
    scr_spearpattern("d", spearspeed, heartframes, 0, 8);
    scr_spearpattern("dr", spearspeed, heartframes, 0, 8);
    scr_spearpattern("r", spearspeed, heartframes, 0, 35);
    scr_spearpattern("d", spearspeed, heartframes, 40, 26);
    scr_spearpattern("l", spearspeed, heartframes, 0, 8);
    scr_spearpattern("ul", spearspeed, heartframes, 0, 8);
    scr_spearpattern("u", spearspeed, heartframes, 0, 8);
    scr_spearpattern("ur", spearspeed, heartframes, 0, 8);
    scr_spearpattern("r", spearspeed, heartframes, 0, 8);
}
if (attackpattern == 180)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 20);
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("l", spearspeed, heartframes, 40, 15);
    scr_spearpattern("u", spearspeed, heartframes, 41, 10);
    scr_spearpattern("d", spearspeed, heartframes, 42, 12);
    scr_spearpattern("r", spearspeed, heartframes, 41, 8);
    scr_spearpattern("ul", spearspeed, heartframes, 40, 35);
    scr_spearpattern("dl", spearspeed, heartframes, 41, 10);
    scr_spearpattern("dr", spearspeed, heartframes, 42, 51);
    scr_spearpattern("ur", spearspeed, heartframes, 19, 12);
}
if (attackpattern == 200)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 1);
    var beat = 9;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, 20, 45);
    scr_spearpattern("d", spearspeed, heartframes, 0, 30);
    scr_spearpattern("r", spearspeed, heartframes, 0, 28);
    scr_spearpattern("l", spearspeed, heartframes, 20, 20);
    scr_spearpattern("r", spearspeed, heartframes, 0, 30);
    scr_spearpattern("u", spearspeed, heartframes, 0, 28);
    scr_spearpattern("d", spearspeed, heartframes, 20, 20);
    scr_spearpattern("u", spearspeed, heartframes, 0, 30);
    scr_spearpattern("l", spearspeed, heartframes, 0, 28);
}
if (attackpattern == 210)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 10);
    var beat = 9;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, 20, 24);
    scr_spearpattern("l", spearspeed, heartframes, 20, 10);
    scr_spearpattern("d", spearspeed, heartframes, 0, 6);
    scr_spearpattern("r", spearspeed, heartframes, 0, 25);
    scr_spearpattern("u", spearspeed, heartframes, 0, 6);
    scr_spearpattern("l", spearspeed, heartframes, 0, 25);
}
if (attackpattern == 211)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 10);
    var beat = 9;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, 20, 25);
    scr_spearpattern("l", spearspeed, heartframes, 20, 14);
    scr_spearpattern("d", spearspeed, heartframes, 0, 30);
    scr_spearpattern("l", spearspeed, heartframes, 0, 40);
    scr_spearpattern("d", spearspeed, heartframes, 20, 12);
    scr_spearpattern("r", spearspeed, heartframes, 20, 14);
    scr_spearpattern("u", spearspeed, heartframes, 0, 30);
    scr_spearpattern("l", spearspeed, heartframes, 0, 25);
}
if (attackpattern == 212)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 10);
    var beat = 9;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, 20, 20);
    scr_spearpattern("u", spearspeed, heartframes, 20, 14);
    scr_spearpattern("d", spearspeed, heartframes, 0, 5);
    scr_spearpattern("d", spearspeed, heartframes, 0, 28);
    scr_spearpattern("r", spearspeed, heartframes, 0, 5);
    scr_spearpattern("r", spearspeed, heartframes, 0, 20);
    scr_spearpattern("r", spearspeed, heartframes, 20, 9);
    scr_spearpattern("r", spearspeed, heartframes, 20, 14);
    scr_spearpattern("l", spearspeed, heartframes, 0, 5);
    scr_spearpattern("l", spearspeed, heartframes, 0, 28);
    scr_spearpattern("d", spearspeed, heartframes, 0, 5);
    scr_spearpattern("d", spearspeed, heartframes, 0, 40);
}
if (attackpattern == 213)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 20);
    var beat = 9;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, 20, 9);
    scr_spearpattern("u", spearspeed, heartframes, 20, 9);
    scr_spearpattern("u", spearspeed, heartframes, 20, 9);
    scr_spearpattern("d", spearspeed, heartframes, 0, 31);
    scr_spearpattern("r", spearspeed, heartframes, 0, 33);
    scr_spearpattern("l", spearspeed, heartframes, 20, 9);
    scr_spearpattern("l", spearspeed, heartframes, 20, 9);
    scr_spearpattern("l", spearspeed, heartframes, 20, 9);
    scr_spearpattern("r", spearspeed, heartframes, 0, 31);
    scr_spearpattern("u", spearspeed, heartframes, 0, 28);
}
if (attackpattern == 220)
{
    scr_spearpattern(0, 0, 0, 1, 10);
    scr_spearpattern(0, 0, 0, 3, 10);
    var beat = 9;
    var special = 20;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("r", 18, 30, 0, 0);
    scr_spearpattern("dr", 18, 37, 0, 0);
    scr_spearpattern("d", 18, 44, 0, 0);
    scr_spearpattern("u", 18, 20, 20, 9);
    scr_spearpattern("ur", 18, 50, 0, 9);
    scr_spearpattern("r", 18, 50, 0, 6);
    scr_spearpattern("ur", 18, 50, 0, 21);
    scr_spearpattern("ul", 18, 50, 0, 0);
    scr_spearpattern("ur", 18, 63, 0, 0);
    scr_spearpattern("l", 20, 50, 20, 9);
    scr_spearpattern("r", 18, 50, 0, 9);
    scr_spearpattern("u", 18, 50, 0, 7);
    scr_spearpattern("ur", 18, 50, 0, 16);
    scr_spearpattern("u", 18, 50, 0, 9);
    scr_spearpattern("l", 18, 50, 0, 12);
    beat = 9;
    spearspeed = 12;
    heartframes = 50;
    scr_spearpattern("dl", 18, 45, 0, 12);
    scr_spearpattern("u", 16, heartframes, 20, 7);
    scr_spearpattern("l", 16, heartframes, 20, 7);
    scr_spearpattern("r", 16, heartframes, 20, 7);
    scr_spearpattern("ul", 18, 57, 0, 0);
    scr_spearpattern("d", 16, heartframes, 20, 72);
    scr_spearpattern("ur", 16, heartframes, 20, 11);
    scr_spearpattern("ul", 16, heartframes, 20, 11);
    scr_spearpattern("dr", 12, heartframes, 20, 7);
    scr_spearpattern("u", 16, 50, 0, 31);
    scr_spearpattern("r", 16, 50, 0, 0);
}
if (attackpattern == 230)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    var beat = 52;
    var special = 35;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, special, beat);
    scr_spearpattern(0, 0, 0, 1, beat);
    scr_spearpattern("l", spearspeed, heartframes, special, beat);
    scr_spearpattern(0, 0, 0, 1, beat);
    scr_spearpattern("r", spearspeed, heartframes, special, beat);
    scr_spearpattern(0, 0, 0, 1, beat);
    scr_spearpattern("d", spearspeed, heartframes, special, beat);
}
if (attackpattern == 240)
{
    scr_spearpattern(0, 0, 0, 1, 60);
    scr_spearpattern(choose("u", "r", "d", "l"), 8, 30, 16, 50);
    var beat = 10;
    var special = 16;
    var spearspeed = 8;
    var heartframes = 29;
    var totalheartframes = heartframes;
    repeat (1)
    {
        var rand = choose(1, 2, 3);
        if (rand == 1)
        {
            scr_spearpattern("ur", spearspeed * 1.2, heartframes, special, beat);
            scr_spearpattern("ul", spearspeed * 1.2, heartframes, special, beat);
            scr_spearpattern("dl", spearspeed * 1.2, heartframes, special, beat - 4);
        }
        if (rand == 2)
        {
            scr_spearpattern("dr", spearspeed * 1.2, heartframes, special, beat);
            scr_spearpattern("ul", spearspeed * 1.2, heartframes, special, beat);
            scr_spearpattern("ur", spearspeed * 1.2, heartframes, special, beat - 4);
        }
        if (rand == 3)
        {
            scr_spearpattern("ul", spearspeed * 1.2, heartframes, special, beat);
            scr_spearpattern("ur", spearspeed * 1.2, heartframes, special, beat);
            scr_spearpattern("dr", spearspeed * 1.2, heartframes, special, beat - 4);
        }
        rand = choose(1, 2, 3);
        if (rand == 1)
        {
            scr_spearpattern("l", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("r", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("l", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("l", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("r", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("l", spearspeed * 1, heartframes, special, beat + 8);
        }
        if (rand == 2)
        {
            scr_spearpattern("u", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("d", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("u", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("d", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("u", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("d", spearspeed * 1, heartframes, special, beat + 8);
        }
        if (rand == 3)
        {
            scr_spearpattern("ul", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("dr", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("ul", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("dr", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("ul", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("dr", spearspeed * 1, heartframes, special, beat + 8);
        }
        rand = choose(1, 2, 3);
        if (rand == 1)
        {
            scr_spearpattern("u", spearspeed * 0.8, heartframes, special, beat * 0.5);
            scr_spearpattern("u", spearspeed * 0.8, heartframes, special, beat);
            scr_spearpattern("ul", spearspeed, heartframes, special, beat);
            scr_spearpattern("ul", spearspeed, heartframes, special, beat);
            scr_spearpattern("ur", spearspeed, heartframes, special, beat);
            scr_spearpattern("ur", spearspeed, heartframes, special, beat);
        }
        if (rand == 2)
        {
            scr_spearpattern("ur", spearspeed * 0.8, heartframes, special, beat * 0.5);
            scr_spearpattern("ur", spearspeed * 0.8, heartframes, special, beat);
            scr_spearpattern("r", spearspeed, heartframes, special, beat);
            scr_spearpattern("r", spearspeed, heartframes, special, beat);
            scr_spearpattern("dr", spearspeed, heartframes, special, beat);
            scr_spearpattern("dr", spearspeed, heartframes, special, beat);
        }
        if (rand == 3)
        {
            scr_spearpattern("dl", spearspeed * 0.8, heartframes, special, beat * 0.5);
            scr_spearpattern("dl", spearspeed * 0.8, heartframes, special, beat);
            scr_spearpattern("d", spearspeed, heartframes, special, beat);
            scr_spearpattern("d", spearspeed, heartframes, special, beat);
            scr_spearpattern("dr", spearspeed, heartframes, special, beat);
            scr_spearpattern("dr", spearspeed, heartframes, special, beat);
        }
    }
    scr_spearpattern(choose("u", "r", "d", "l"), spearspeed * 0.8, heartframes, special, beat);
}
if (attackpattern == 0)
{
    scr_spearpattern(0, 0, 0, 1, 30);
    scr_spearpattern(0, 0, 0, 34, 20);
    var beat = 14;
    var spearspeed = 8;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed * 0.8, heartframes, 0, beat);
    scr_spearpattern("u", spearspeed * 0.8, heartframes, 0, beat);
    scr_spearpattern("u", spearspeed * 0.8, heartframes, 0, beat * 2);
    scr_spearpattern("l", spearspeed, heartframes, 0, beat * 2);
    scr_spearpattern("d", spearspeed * 0.8, heartframes, 0, beat * 2);
    scr_spearpattern("r", spearspeed, heartframes, 0, beat * 2);
}
if (attackpattern == 1)
{
    scr_spearpattern(0, 0, 0, 36, 15);
    var beat = 16;
    var spearspeed = 6;
    var heartframes = 50;
    var heartframestotal = heartframes;
    scr_spearpattern("u", spearspeed * 0.8, heartframestotal, 0, 0);
    heartframestotal += beat;
    scr_spearpattern("u", spearspeed * 0.8, heartframestotal, 0, 0);
    heartframestotal += beat;
    scr_spearpattern("u", spearspeed * 0.8, heartframestotal, 0, 0);
    heartframestotal += beat;
    scr_spearpattern("l", spearspeed * 0.8, heartframestotal, 0, 0);
    heartframestotal += (beat * 2);
    scr_spearpattern("d", spearspeed * 0.6, heartframestotal, 0, 0);
    heartframestotal += (beat * 0.5);
    spearspeed = 18;
    beat = 8;
    scr_spearpattern("r", spearspeed, heartframestotal, 0, 0);
    heartframestotal += beat;
    scr_spearpattern("r", spearspeed, heartframestotal, 0, 0);
    heartframestotal += beat;
    scr_spearpattern("l", spearspeed, heartframestotal, 0, 0);
    heartframestotal += beat;
    scr_spearpattern("l", spearspeed, heartframestotal, 0, 0);
    heartframestotal += beat;
    scr_spearpattern("r", spearspeed, heartframestotal, 0, 0);
    heartframestotal += beat;
    scr_spearpattern("l", spearspeed, heartframestotal, 0, 0);
    heartframestotal += (beat * 1.2);
    scr_spearpattern("u", spearspeed * 0.7, heartframestotal, 0, 0);
    heartframestotal += (beat * 0.35);
    scr_spearpattern("u", spearspeed * 0.7, heartframestotal, 0, 0);
    heartframestotal += (beat * 0.35);
    scr_spearpattern("u", spearspeed * 0.7, heartframestotal, 0, 0);
}
if (attackpattern == 2)
{
    scr_spearpattern(0, 0, 0, 36, 0);
    var beat = 9;
    var spearspeed = 14;
    var heartframes = 50;
    var heartframestotal = heartframes;
    scr_spearpattern("l", 6, 110, 0, 0);
    scr_spearpattern("r", 14, 40, 0, 0);
    scr_spearpattern("u", 10, 50, 0, 0);
    scr_spearpattern("d", 10, 60, 0, 0);
    scr_spearpattern("r", 14, 70, 0, 0);
    scr_spearpattern("d", 10, 80, 0, 0);
    scr_spearpattern("u", 10, 90, 0, 0);
    scr_spearpattern("r", 18, 115, 0, 0);
    scr_spearpattern("u", 10, 130, 0, 0);
    scr_spearpattern("d", 10, 140, 0, 0);
    scr_spearpattern("l", 14, 150, 0, 0);
    scr_spearpattern("d", 10, 160, 0, 0);
    scr_spearpattern("u", 10, 170, 0, 0);
    scr_spearpattern("l", 14, 180, 0, 0);
    scr_spearpattern("l", 18, 190, 0, 0);
    scr_spearpattern("r", 6, 205, 0, 0);
}
if (attackpattern == 3)
{
    scr_spearpattern(0, 0, 0, 36, 0);
    var beat = 10;
    var spearspeed = 14;
    var heartframes = 40;
    scr_spearpattern("u", spearspeed - 4, heartframes, 0, beat);
    scr_spearpattern("r", spearspeed, heartframes, 0, beat);
    scr_spearpattern("u", spearspeed - 6, heartframes, 0, beat);
    scr_spearpattern("l", spearspeed, heartframes, 0, beat * 2);
    scr_spearpattern("u", spearspeed - 4, heartframes, 0, beat);
    scr_spearpattern("r", spearspeed, heartframes, 0, beat);
    scr_spearpattern("u", spearspeed - 4, heartframes, 0, beat);
    scr_spearpattern("ul", spearspeed * 0.3, heartframes * 3, 0, 0);
    scr_spearpattern("l", spearspeed + 6, heartframes, 0, beat * 2);
    scr_spearpattern("u", spearspeed - 4, heartframes, 0, beat);
    scr_spearpattern("r", spearspeed + 6, heartframes, 0, beat);
    scr_spearpattern("u", spearspeed - 4, heartframes, 0, beat);
    scr_spearpattern("l", spearspeed, heartframes, 0, beat);
    scr_spearpattern(0, 0, 0, 3, beat * 2);
    scr_spearpattern("ul", spearspeed * 1.2, heartframes, 0, beat * 0.5);
    scr_spearpattern("ul", spearspeed * 1.2, heartframes, 0, beat * 0.5);
    scr_spearpattern("ul", spearspeed * 1.2, heartframes, 0, beat * 2);
    scr_spearpattern("ur", spearspeed + 4, heartframes, 0, beat);
}
if (attackpattern == 4)
{
    var beat = 10;
    var spearspeed = 14;
    var heartframes = 40;
    scr_spearpattern(0, 0, 0, 36, 8);
    scr_spearpattern("u", 1, 280, 355, 16);
    scr_spearpattern(0, 0, 0, 9, 65);
    scr_spearpattern("d", spearspeed - 4, heartframes, 0, beat);
    scr_spearpattern("ul", spearspeed, heartframes, 0, beat);
    scr_spearpattern("d", spearspeed - 4, heartframes, 0, beat);
    scr_spearpattern("ur", spearspeed, heartframes, 0, beat * 2);
    scr_spearpattern(0, 0, 0, 400, 1);
    scr_spearpattern("d", spearspeed - 4, heartframes, 0, beat);
    scr_spearpattern("r", spearspeed, heartframes, 0, beat);
    scr_spearpattern("d", spearspeed - 4, heartframes, 0, beat);
    scr_spearpattern("l", spearspeed, heartframes, 0, 65);
    scr_spearpattern(0, -70, 0, 32, 45);
    scr_spearpattern(0, 0, 0, 10, 1);
}
if (attackpattern == 5)
    scr_spearpattern(x, y, 60, 50, 9999);
if (attackpattern == 5.5)
{
    var beat = 25;
    scr_spearpattern(0, -70, 0, 32, 8);
    repeat (6)
    {
        var a;
        if (prev == 0)
            a = choose(1, 2);
        if (prev == 1)
            a = choose(0, 2);
        if (prev == 2)
            a = choose(0, 1);
        var prev = a;
        if (a == 0)
            scr_spearpattern("up1", 0, 0, 32, beat);
        if (a == 1)
            scr_spearpattern(0, -70, 0, 32, beat);
        if (a == 2)
            scr_spearpattern("up2", 0, 0, 32, beat);
    }
    scr_spearpattern(300, 125, -5, 4, 0);
    scr_spearpattern(378, 125, -5, 4, 25);
    scr_spearpattern(0, 0, -1, 32, 41);
    scr_spearpattern(0, 0, 0, 10, 1);
}
if (attackpattern == 6)
{
    scr_spearpattern(0, 0, 0, 36, 0);
    var beat = 10;
    var spearspeed = 12;
    var heartframes = 40;
    scr_spearpattern("ul", spearspeed - 2, heartframes, 0, beat);
    scr_spearpattern("ul", spearspeed - 2, heartframes, 0, beat);
    scr_spearpattern("u", spearspeed - 2, heartframes, 0, beat);
    scr_spearpattern("u", spearspeed - 2, heartframes, 0, beat);
    scr_spearpattern("ur", spearspeed, heartframes, 0, beat * 1.5);
    scr_spearpattern("ur", spearspeed, heartframes, 0, beat * 3);
    scr_spearpattern("ul", spearspeed + 2, heartframes, 0, beat);
    scr_spearpattern("u", spearspeed + 2, heartframes, 0, beat);
    scr_spearpattern("ur", spearspeed + 2, heartframes, 0, beat);
    scr_spearpattern("u", spearspeed + 2, heartframes, 0, beat * 0.5);
    scr_spearpattern("u", spearspeed + 2, heartframes, 0, beat * 0.5);
    scr_spearpattern("ul", spearspeed + 2, heartframes, 0, beat);
    scr_spearpattern("u", spearspeed + 4, heartframes, 0, beat);
    scr_spearpattern("ur", spearspeed + 8, heartframes, 0, beat * 3);
    beat = 8;
    scr_spearpattern("d", spearspeed + 4, heartframes, 0, beat * 1.5);
    scr_spearpattern("dl", spearspeed + 8, heartframes, 0, beat * 1.5);
    scr_spearpattern("d", spearspeed + 4, heartframes, 0, beat);
    scr_spearpattern("dr", spearspeed + 8, heartframes, 0, beat);
}
if (attackpattern == 7)
{
    scr_spearpattern(0, 0, 0, 36, 0);
    var beat = 10;
    var spearspeed = 12;
    var heartframes = 40;
    scr_spearpattern("l", spearspeed * 1.2, heartframes, 0, beat);
    scr_spearpattern("l", spearspeed * 1.1, heartframes, 0, beat * 0.5);
    scr_spearpattern("l", spearspeed * 1, heartframes, 0, beat * 0.5);
    scr_spearpattern("r", spearspeed * 1.2, heartframes, 0, beat);
    scr_spearpattern("r", spearspeed * 1.1, heartframes, 0, beat * 0.5);
    scr_spearpattern("r", spearspeed * 1, heartframes, 0, beat * 0.5);
    scr_spearpattern("u", spearspeed * 0.6, heartframes, 0, beat);
    scr_spearpattern("ul", spearspeed * 0.8, heartframes, 0, beat * 1.2);
    scr_spearpattern("d", spearspeed * 0.6, heartframes, 0, beat);
    scr_spearpattern("dr", spearspeed * 0.8, heartframes, 0, beat);
    scr_spearpattern("r", spearspeed * 1.2, heartframes, 0, beat);
    scr_spearpattern("r", spearspeed * 1.1, heartframes, 0, beat * 0.5);
    scr_spearpattern("r", spearspeed * 1, heartframes, 0, beat * 0.5);
    scr_spearpattern("l", spearspeed * 1.2, heartframes, 0, beat * 0.5);
    scr_spearpattern("l", spearspeed * 1.1, heartframes, 0, beat * 0.5);
    scr_spearpattern("l", spearspeed * 1, heartframes, 0, beat);
    scr_spearpattern("d", spearspeed * 0.6, heartframes, 0, beat);
    scr_spearpattern("dr", spearspeed * 0.8, heartframes, 0, beat);
    scr_spearpattern("u", spearspeed * 0.6, heartframes, 0, beat + 20);
    scr_spearpattern("u", spearspeed, heartframes, 19, 70);
    scr_spearpattern("l", spearspeed, heartframes, 19, 15);
    scr_spearpattern("r", spearspeed, heartframes, 19, 15);
}
if (attackpattern == 8)
    scr_spearpattern(x, y, 60, 51, 9999);
if (attackpattern == 9)
{
    scr_spearpattern(0, 0, 0, 36, 0);
    scr_spearpattern(0, 0, 0, 3, 0);
    var beat = 16;
    var speardistance = 80;
    var special = 14;
    var heartframestotal = 100;
    var prev = 1;
    scr_spearpattern("u", 12, 40, 19, 14);
    scr_spearpattern("l", 12, 40, 19, 14);
    scr_spearpattern("d", 12, 40, 19, 50);
    scr_spearpattern("r", 12, 50, 35, 44);
    beat = 16;
    scr_spearpattern(0, -70, 0, 32, beat);
    repeat (6)
    {
        var a;
        if (prev == 0)
            a = choose(1, 2);
        if (prev == 1)
            a = choose(0, 2);
        if (prev == 2)
            a = choose(0, 1);
        prev = a;
        if (a == 0)
            scr_spearpattern("up1", 0, 0, 32, beat);
        if (a == 1)
            scr_spearpattern(0, -70, 0, 32, beat);
        if (a == 2)
            scr_spearpattern("up2", 0, 0, 32, beat);
    }
    scr_spearpattern(300, 125, -5, 4, 0);
    scr_spearpattern(378, 125, -5, 4, 25);
    scr_spearpattern(0, 0, -1, 32, 41);
    scr_spearpattern(0, 0, 0, 10, 1);
}
if (attackpattern == 10)
{
    scr_spearpattern(0, -70, 0, 32, swingdownbeatspeed);
    var prev = 1;
    repeat (7)
    {
        var a;
        if (prev == 0)
            a = choose(1, 2);
        if (prev == 1)
            a = choose(0, 2);
        if (prev == 2)
            a = choose(0, 1);
        prev = a;
        if (irandom(100) < 25)
        {
            scr_spearpattern(0, 0, choose(-1, -2), 32, swingdownbeatspeed);
        }
        else
        {
            if (a == 0)
                scr_spearpattern("up1", 0, 0, 32, swingdownbeatspeed);
            if (a == 1)
                scr_spearpattern(0, -70, 0, 32, swingdownbeatspeed);
            if (a == 2)
                scr_spearpattern("up2", 0, 0, 32, swingdownbeatspeed);
        }
    }
    scr_spearpattern(0, 0, choose(-1, -2), 32, swingdownbeatspeed + 10);
    swingdownbeatspeed--;
    if (swingdownbeatspeed < 19)
        swingdownbeatspeed = 19;
    var beat = 44;
    scr_spearpattern(0, 0, 0, 11, beat);
    scr_spearpattern(0, 0, 0, 12, beat);
    scr_spearpattern(0, 0, 0, 11, beat);
    scr_spearpattern(0, 0, 0, 12, beat);
    scr_spearpattern(0, 0, 0, 10, 1);
}
if (attackpattern == 11)
    scr_spearpattern(x, y, 60, 50, 9999);
if (attackpattern == 12)
{
    var beat = 9;
    var special = 19;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern(0, 0, 0, 36, 0);
    scr_spearpattern(0, 0, 0, 3, 0);
    scr_spearpattern("u", spearspeed, 40, special, beat);
    scr_spearpattern("l", spearspeed, 40, special, beat);
    scr_spearpattern("r", spearspeed, 40, special, beat);
    scr_spearpattern("d", spearspeed, 40, special, 42);
    spearspeed = 12;
    heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, 40.4, 23);
    scr_spearpattern("l", spearspeed, heartframes, 0, 7);
    scr_spearpattern("dl", spearspeed, heartframes, 0, 7);
    scr_spearpattern("d", spearspeed, heartframes, 0, 7);
    scr_spearpattern("dr", spearspeed, heartframes, 0, 7);
    scr_spearpattern("r", spearspeed, heartframes, 0, 28);
    scr_spearpattern("d", spearspeed, heartframes, 40.4, 23);
    scr_spearpattern("l", spearspeed, heartframes, 0, 7);
    scr_spearpattern("ul", spearspeed, heartframes, 0, 7);
    scr_spearpattern("u", spearspeed, heartframes, 0, 7);
    scr_spearpattern("ur", spearspeed, heartframes, 0, 7);
    scr_spearpattern("r", spearspeed, heartframes, 0, 35);
    spearspeed = 4;
    heartframes = 90;
    scr_spearpattern("u", 3, 129, 0, 0);
    scr_spearpattern("dr", 4, 106, 0, 0);
    scr_spearpattern("dr", 4, 114, 0, 8);
    scr_spearpattern("l", 12, 30, 0, 8);
    scr_spearpattern("r", 12, 38, 0, 8);
    scr_spearpattern("d", 12, 38, 0, 8);
    scr_spearpattern("ul", spearspeed + 8, heartframes - 40, 0, 0);
    scr_spearpattern("dl", spearspeed + 9, heartframes - 30, 0, 0);
}
if (attackpattern == 13)
{
    scr_spearpattern(0, 0, 0, 36, 0);
    scr_spearpattern(0, 0, 0, 3, 0);
    var beat = 8;
    var spearspeed = 12;
    var heartframes = 40;
    scr_spearpattern("u", spearspeed, heartframes, 20, 94);
    scr_spearpattern("ur", spearspeed, heartframes, 20, 82);
    heartframes = 155;
    spearspeed = 5;
    scr_spearpattern("r", spearspeed, heartframes, 0, 0);
    scr_spearpattern("dr", spearspeed, heartframes + 8, 0, 0);
    scr_spearpattern("r", spearspeed, heartframes + 16, 0, 0);
    scr_spearpattern("ul", spearspeed, heartframes + 24, 0, 0);
    scr_spearpattern("l", spearspeed, heartframes + 32, 0, 0);
    scr_spearpattern("ur", spearspeed * 2, heartframes + 40, 0, 0);
    scr_spearpattern("dl", spearspeed * 3, heartframes + 48, 0, 0);
    scr_spearpattern("u", spearspeed * 4, heartframes + 56, 0, 0);
    heartframes = 40;
    spearspeed = 12;
    scr_spearpattern("l", spearspeed, heartframes, 20, 10);
    scr_spearpattern("ur", spearspeed, heartframes, 20, 10);
    scr_spearpattern("u", spearspeed, heartframes, 0, 36);
    scr_spearpattern("d", spearspeed, heartframes, 0, 33);
    scr_spearpattern("l", spearspeed, heartframes, 0, 33);
}
if (attackpattern == 14)
{
    scr_spearpattern(0, 0, 0, 36, 0);
    scr_spearpattern(0, 0, 0, 3, 0);
    var beat = 9;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("l", spearspeed, heartframes, 19, 16);
    scr_spearpattern("d", spearspeed, heartframes, 0, 6);
    scr_spearpattern("dr", spearspeed, heartframes, 0, 6);
    scr_spearpattern("r", spearspeed, heartframes, 19, 20);
    scr_spearpattern("u", spearspeed, heartframes, 0, 6);
    scr_spearpattern("d", spearspeed, heartframes, 0, 18);
    scr_spearpattern("d", spearspeed, heartframes, 0, 6);
    scr_spearpattern("u", spearspeed, heartframes, 0, 20);
    heartframes = 40;
    scr_spearpattern("ul", 6, 146, 0, 0);
    scr_spearpattern("r", 12, heartframes, 20, 12);
    scr_spearpattern("ur", 12, heartframes, 20, 12);
    scr_spearpattern("u", 12, heartframes, 20, 102);
    scr_spearpattern("dr", 12, heartframes, 20, 12);
    scr_spearpattern("r", 12, heartframes, 20, 12);
    scr_spearpattern("ur", 12, heartframes, 20, 77);
    scr_spearpattern("u", 15, 40, 0, 5);
    scr_spearpattern("u", 15, 40, 0, 5);
    scr_spearpattern("u", 15, 40, 0, 5);
    scr_spearpattern("u", 15, 40, 0, 18);
    scr_spearpattern("u", 25, 30, 35, 36);
}
if (attackpattern == 15)
{
    scr_spearpattern(0, 0, 0, 36, 0);
    scr_spearpattern(0, 0, 0, 3, 0);
    var beat = 9;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, 20, 17);
    scr_spearpattern("d", spearspeed, heartframes, 0, 30);
    scr_spearpattern("r", spearspeed, heartframes, 0, 28);
    scr_spearpattern("l", spearspeed, heartframes, 20, 20);
    scr_spearpattern("r", spearspeed, heartframes, 0, 30);
    scr_spearpattern("u", spearspeed, heartframes, 0, 28);
    scr_spearpattern("d", spearspeed, heartframes, 20, 12);
    scr_spearpattern("r", spearspeed, heartframes, 20, 14);
    scr_spearpattern("u", spearspeed, heartframes, 0, 30);
    scr_spearpattern("l", spearspeed, heartframes, 0, 35);
    beat = 9;
    spearspeed = 12;
    heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, 20, 9);
    scr_spearpattern("u", spearspeed, heartframes, 20, 14);
    scr_spearpattern("d", spearspeed, heartframes, 0, 5);
    scr_spearpattern("d", spearspeed, heartframes, 0, 28);
    scr_spearpattern("r", spearspeed, heartframes, 0, 5);
    scr_spearpattern("r", spearspeed, heartframes, 0, 20);
}
if (attackpattern == 16)
    scr_spearpattern(x, y, 60, 52, 9999);
if (attackpattern == 17)
{
    scr_spearpattern(0, 0, 0, 36, 0);
    scr_spearpattern(0, 0, 0, 3, 0);
    var beat = 9;
    var special = 20;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, special, beat);
    scr_spearpattern("l", spearspeed, heartframes, special, beat);
    scr_spearpattern("r", spearspeed, heartframes, special, beat);
    scr_spearpattern("d", spearspeed, heartframes, special, 91);
    beat = 9;
    special = 21;
    spearspeed = 12;
    heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, special, 16);
    spearspeed = 12;
    heartframes = 50;
    scr_spearpattern("r", spearspeed, heartframes, 0, 4);
    scr_spearpattern("r", spearspeed, heartframes, 0, 4);
    scr_spearpattern("r", spearspeed, heartframes, 0, 24);
    scr_spearpattern("u", spearspeed, heartframes, 0, 4);
    scr_spearpattern("u", spearspeed, heartframes, 0, 4);
    scr_spearpattern("u", spearspeed, heartframes, 0, 20);
    scr_spearpattern("ul", spearspeed, heartframes, 0, 4);
    scr_spearpattern("ul", spearspeed, heartframes, 0, 4);
    scr_spearpattern("ul", spearspeed, heartframes, 0, 30);
    scr_spearpattern("d", spearspeed, heartframes, 0, 10);
    scr_spearpattern("r", 10, 50, 0, 20);
    scr_spearpattern("l", spearspeed, heartframes, 0, 8);
    scr_spearpattern("u", spearspeed, heartframes, 0, 8);
    scr_spearpattern("r", spearspeed, heartframes, 0, 20);
    scr_spearpattern("ul", spearspeed, heartframes, 0, 8);
    scr_spearpattern("ur", spearspeed, heartframes, 0, 20);
    scr_spearpattern("dl", spearspeed, heartframes, 0, 8);
    scr_spearpattern("dr", spearspeed, heartframes, 0, 8);
    scr_spearpattern("dr", spearspeed, heartframes, 0, 20);
    scr_spearpattern("ul", spearspeed, heartframes, 0, 5);
    scr_spearpattern("ul", spearspeed, heartframes, 0, 8);
    scr_spearpattern("u", spearspeed, heartframes, 0, 5);
    scr_spearpattern("u", spearspeed, heartframes, 0, 5);
}
if (attackpattern == 18)
{
    scr_spearpattern(0, 0, 0, 36, 40);
    scr_spearpattern(0, 0, 0, 3, 0);
    scr_spearpattern("l", 12, 50, 35, 40);
    scr_spearpattern(0, 0, 0, 29, 20);
    scr_spearpattern(0, 0, 0, 27, 20);
    var beat = 18;
    var special = 32;
    scr_spearpattern(70, 0, 270, special, beat);
    scr_spearpattern("diag1", 0, 0, special, beat);
    scr_spearpattern(0, -70, 0, special, beat);
    scr_spearpattern("diag2", 0, 0, special, beat);
    scr_spearpattern(-70, 0, 90, special, beat);
    scr_spearpattern("diag3", 0, 0, special, beat);
    scr_spearpattern(0, 70, 180, special, beat);
    scr_spearpattern("diag4", 0, 0, special, 60);
    scr_spearpattern(0, 0, 0, 31, 5);
    var c = 0;
    var beat2 = 8;
    beat = 30;
    repeat (2)
    {
        if (c == 1)
            scr_spearpattern(0, 0, 0, 1, 1);
        c = 1;
        scr_spearpattern("l", 16, 20, 30, beat2);
        scr_spearpattern("up1", 0, 0, 32, beat);
        scr_spearpattern(0, 0, 0, 1, 1);
        scr_spearpattern("r", 16, 20, 30, beat2);
        scr_spearpattern("up2", 0, 0, 32, beat);
        beat2--;
    }
    scr_spearpattern(0, 0, 0, 1, 8);
    scr_spearpattern("u", 16, 20, 30, beat2);
    scr_spearpattern(choose("right1", "left1"), 0, 0, 32, beat);
    beat2--;
    var b = 0;
    repeat (8)
    {
        b = choose(0, 1, 2, 3);
        if (b == 0)
        {
            scr_spearpattern(0, 0, 0, 1, 1);
            scr_spearpattern("l", 16, 20, 30, beat2);
            scr_spearpattern(choose("up1", "down1"), 0, 0, 32, beat);
        }
        if (b == 1)
        {
            scr_spearpattern(0, 0, 0, 1, 1);
            scr_spearpattern("r", 16, 20, 30, beat2);
            scr_spearpattern(choose("up2", "down2"), 0, 0, 32, beat);
        }
        if (b == 3)
        {
            scr_spearpattern(0, 0, 0, 1, 1);
            scr_spearpattern("u", 16, 20, 30, beat2);
            scr_spearpattern(choose("right1", "left1"), 0, 0, 32, beat);
        }
        if (b == 4)
        {
            scr_spearpattern(0, 0, 0, 1, 1);
            scr_spearpattern("d", 16, 20, 30, beat2);
            scr_spearpattern(choose("right2", "left2"), 0, 0, 32, beat);
        }
        beat2--;
        if (beat2 < 0)
            beat2 = 0;
    }
    scr_spearpattern(3, 0, 0, 28, 0);
    scr_spearpattern(0, 0, 0, 33, 0);
    scr_spearpattern(0, 0, -3, 4, 3);
    scr_spearpattern(0, 0, -3, 4, 3);
    scr_spearpattern(0, 0, -3, 4, 3);
    scr_spearpattern(0, 0, -3, 4, 3);
    scr_spearpattern(0, 0, -3, 4, 3);
    scr_spearpattern(0, 0, -3, 4, 3);
    scr_spearpattern(0, 0, -3, 4, 3);
    scr_spearpattern(0, 0, -3, 4, 27);
    scr_spearpattern(0, 0, 0, 9, 60);
    scr_spearpattern(0, 0, 0, 10, 1);
}
if (attackpattern == 19)
{
    scr_spearpattern(0, 0, 0, 36, 1);
    scr_spearpattern(0, 0, 0, 3, 0);
    scr_spearpattern("u", 8, 47, 41.1, 10);
    scr_spearpattern("l", 6, 55, 42.1, 20);
    scr_spearpattern("ur", 10, 47, 40.6, 8);
    scr_spearpattern("r", 12, 47, 21.66, 116);
    scr_spearpattern("u", 10, 47, 20.1, 55);
    scr_spearpattern("l", 18, 50, 35, 55);
    scr_spearpattern("diag1", 0, 0, 32, 16);
    scr_spearpattern(0, -70, 0, 32, 15);
    scr_spearpattern("diag2", 0, 0, 32, 14);
    scr_spearpattern(-70, 0, 90, 32, 13);
    scr_spearpattern("diag3", 0, 0, 32, 12);
    scr_spearpattern(0, 70, 180, 32, 11);
    scr_spearpattern("diag4", 0, 0, 32, 10);
    scr_spearpattern(70, 0, 270, 32, 9);
    scr_spearpattern("diag1", 0, 0, 32, 8);
    scr_spearpattern(0, -70, 0, 32, 8);
    scr_spearpattern("diag2", 0, 0, 32, 7);
    scr_spearpattern(-70, 0, 90, 32, 7);
    scr_spearpattern("diag3", 0, 0, 32, 7);
    scr_spearpattern(0, 70, 180, 32, 7);
    scr_spearpattern("diag4", 0, 0, 32, 7);
    scr_spearpattern(70, 0, 270, 32, 6);
    scr_spearpattern("diag1", 0, 0, 32, 6);
    scr_spearpattern(0, -70, 0, 32, 21);
    scr_spearpattern(0, 0, 0, 27, 10);
    scr_spearpattern(3, 0, 0, 28, 0);
    scr_spearpattern(0, 0, -3, 4, 2);
    scr_spearpattern(0, 0, -3, 4, 2);
    scr_spearpattern(0, 0, -3, 4, 2);
    scr_spearpattern(0, 0, -3, 4, 2);
    scr_spearpattern(0, 0, -3, 4, 2);
    scr_spearpattern(0, 0, -3, 4, 2);
    scr_spearpattern(0, 0, -3, 4, 2);
    scr_spearpattern(0, 0, -3, 4, 38);
    scr_spearpattern(0, 0, 0, 10.5, 8);
    scr_spearpattern(0, 0, 0, 9, 60);
}
if (attackpattern == 20)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 0);
    var beat = 16;
    var speardistance = 80;
    var special = 14;
    var heartframestotal = 100;
    beat = 16;
    heartframestotal = 100;
    scr_spearpattern("u", 40, heartframestotal, special, 40, 80);
    heartframestotal += beat;
    scr_spearpattern("u", 20, heartframestotal, special, 10, 120);
    heartframestotal += beat;
    scr_spearpattern("u", 20, heartframestotal, special, 10, 120);
    heartframestotal += beat;
    scr_spearpattern("l", 40, heartframestotal, special, 0, 80);
    heartframestotal += beat;
    scr_spearpattern("r", 20, heartframestotal, special, 0, 150);
    heartframestotal += beat;
    scr_spearpattern("r", 30, heartframestotal, special, 40, 400);
    heartframestotal += beat;
    heartframestotal = 130;
    scr_spearpattern("u", 65, heartframestotal, special, 0, 40);
    heartframestotal += beat;
    scr_spearpattern("d", 30, heartframestotal, special, 0, 80);
    heartframestotal += beat;
    scr_spearpattern("l", 40, heartframestotal, special, 0, 160);
    heartframestotal += beat;
    scr_spearpattern("r", 55, heartframestotal, special, 50, 300);
    heartframestotal += beat;
    heartframestotal = 130;
    scr_spearpattern("l", 30, heartframestotal, special, 0, 160);
    heartframestotal += beat;
    scr_spearpattern("u", 37, heartframestotal, special, 0, 300);
    heartframestotal += (beat * 2);
    scr_spearpattern("u", 45, heartframestotal, special, 0, 300);
    heartframestotal += beat;
    scr_spearpattern("r", 55, heartframestotal, special, 0, 80);
    heartframestotal += beat;
    scr_spearpattern("r", 65, heartframestotal, special, 50, 300);
    heartframestotal += beat;
    heartframestotal = 130;
    scr_spearpattern("l", 65, heartframestotal, special, 0, 40);
    heartframestotal += beat;
    scr_spearpattern("r", 30, heartframestotal, special, 0, 80);
    heartframestotal += beat;
    scr_spearpattern("u", 40, heartframestotal, special, 0, 160);
    heartframestotal += beat;
    scr_spearpattern("d", 55, heartframestotal, special, 50, 300);
    heartframestotal += beat;
}
if (attackpattern == 21)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 0);
    var beat = 10;
    var speardistance = 80;
    var special = 14;
    var heartframestotal = 100;
    scr_spearpattern("d", 200, heartframestotal + 70, special, 20, 260);
    scr_spearpattern("u", 165, heartframestotal + 50, special, 0, 140);
    heartframestotal += beat;
    scr_spearpattern("l", 60, heartframestotal, special, 0, 80);
    heartframestotal += beat;
    scr_spearpattern("r", 70, heartframestotal, special, 0, 340);
    heartframestotal += beat;
    scr_spearpattern("u", 80, heartframestotal, special, 0, 200);
    heartframestotal += (beat + 16);
    scr_spearpattern("d", 100, heartframestotal, special, 0, 340);
    heartframestotal += beat;
    heartframestotal += beat;
    scr_spearpattern("l", 120, heartframestotal, special, 0, 250);
    heartframestotal += beat;
    scr_spearpattern("r", 130, heartframestotal, special, 180, 340);
    heartframestotal += beat;
}
if (attackpattern == 22)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 0);
    var beat = 9;
    var special = 19;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, special, 90);
    scr_spearpattern("u", spearspeed, heartframes, special, beat);
    scr_spearpattern("l", spearspeed, heartframes, special, beat);
    scr_spearpattern("r", spearspeed, heartframes, special, beat);
    scr_spearpattern("d", spearspeed, heartframes, special, 50);
    scr_spearpattern("ul", spearspeed * 1.2, heartframes, special, beat);
    scr_spearpattern("u", spearspeed, heartframes, special, beat);
    scr_spearpattern("ur", spearspeed, heartframes, special, 50);
    scr_spearpattern("dl", spearspeed * 1.2, heartframes, special, beat);
    scr_spearpattern("d", spearspeed, heartframes, special, beat);
    scr_spearpattern("dr", spearspeed, heartframes, special, beat);
}
if (attackpattern == 23)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 0);
    var beat = 9;
    var special = 20;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, special, 90);
    scr_spearpattern("u", spearspeed, heartframes, special, beat);
    scr_spearpattern("l", spearspeed, heartframes, special, beat);
    scr_spearpattern("r", spearspeed, heartframes, special, beat);
    scr_spearpattern("d", spearspeed, heartframes, special, 120);
}
if (attackpattern == 24)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 0);
    var beat = 9;
    var special = 21;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, special, 50);
    spearspeed = 12;
    heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, 0, 35);
    scr_spearpattern("u", spearspeed, heartframes, 0, 8);
    scr_spearpattern("u", spearspeed, heartframes, 0, 25);
    scr_spearpattern("l", spearspeed, heartframes, 0, 38);
    scr_spearpattern("d", spearspeed, heartframes, 0, 25);
    scr_spearpattern("r", spearspeed, heartframes, 0, 4);
    scr_spearpattern("r", spearspeed, heartframes, 0, 4);
    scr_spearpattern("r", spearspeed, heartframes, 0, 4);
    scr_spearpattern("r", spearspeed, heartframes, 0, 4);
    scr_spearpattern("r", spearspeed, heartframes, 0, 20);
    scr_spearpattern("l", spearspeed, heartframes, 0, 6);
    scr_spearpattern("l", spearspeed, heartframes, 0, 6);
    scr_spearpattern("l", spearspeed, heartframes, 0, 18);
    scr_spearpattern("l", spearspeed, heartframes, 0, 6);
    scr_spearpattern("l", spearspeed, heartframes, 0, 6);
}
if (attackpattern == 25)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 0);
    scr_spearpattern("u", 10, 50, 25, 60, 100);
    scr_spearpattern("r", 10, 50, 25, 22, 30);
    scr_spearpattern("l", 10, 50, 25, 10, 15);
    scr_spearpattern("d", 10, 50, 25, 40, 30);
}
if (attackpattern == 26)
{
    var beat = 40;
    var special = 32;
    scr_spearpattern("up1", 0, 0, special, beat);
    scr_spearpattern("up2", 0, 0, special, beat);
    scr_spearpattern("left1", 0, 0, special, beat);
    scr_spearpattern("left2", 0, 0, special, beat);
    scr_spearpattern("down1", 0, 0, special, beat);
    scr_spearpattern("down2", 0, 0, special, beat);
    scr_spearpattern("right1", 0, 0, special, beat);
    scr_spearpattern("right2", 0, 0, special, beat);
    scr_spearpattern("diag1", 0, 0, special, beat);
    scr_spearpattern("diag2", 0, 0, special, beat);
    scr_spearpattern("diag3", 0, 0, special, beat);
    scr_spearpattern("diag4", 0, 0, special, beat);
    scr_spearpattern(0, -70, 0, special, beat);
    scr_spearpattern(70, 0, 270, special, beat);
    scr_spearpattern(90, -90, 315, special, beat);
    scr_spearpattern(-90, -90, 45, special, beat);
    scr_spearpattern(-90, 90, 135, special, beat);
    scr_spearpattern(90, 90, 225, special, beat);
    scr_spearpattern(0, 0, 0, 10, 1);
}
if (attackpattern == 27)
{
    scr_spearpattern(0, 10, 60, 26, 9999);
    scr_spearpattern(0, 10, 60, 0, 9999);
}
if (attackpattern == 28)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 10);
    var beat = 9;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("l", spearspeed, heartframes, 19, 20);
    scr_spearpattern("u", spearspeed, heartframes, 0, 6);
    scr_spearpattern("u", spearspeed, heartframes, 0, 6);
    scr_spearpattern("u", spearspeed, heartframes, 0, 6);
    scr_spearpattern("r", spearspeed, heartframes, 19, 26);
    scr_spearpattern("u", spearspeed, heartframes, 0, 6);
    scr_spearpattern("u", spearspeed, heartframes, 0, 18);
    scr_spearpattern("r", spearspeed, heartframes, 19, 11);
    scr_spearpattern("u", spearspeed, heartframes, 0, 6);
    scr_spearpattern("u", spearspeed, heartframes, 0, 6);
    scr_spearpattern("u", spearspeed, heartframes, 0, 20);
    scr_spearpattern("l", spearspeed, heartframes, 19, 26);
    scr_spearpattern("u", spearspeed, heartframes, 0, 6);
    scr_spearpattern("u", spearspeed, heartframes, 0, 20);
}
if (attackpattern == 29)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 1);
    var beat = 9;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, 40, 40);
    scr_spearpattern("l", spearspeed, heartframes, 0, 8);
    scr_spearpattern("dl", spearspeed, heartframes, 0, 8);
    scr_spearpattern("d", spearspeed, heartframes, 0, 8);
    scr_spearpattern("dr", spearspeed, heartframes, 0, 8);
    scr_spearpattern("r", spearspeed, heartframes, 0, 35);
    scr_spearpattern("d", spearspeed, heartframes, 40, 26);
    scr_spearpattern("l", spearspeed, heartframes, 0, 8);
    scr_spearpattern("ul", spearspeed, heartframes, 0, 8);
    scr_spearpattern("u", spearspeed, heartframes, 0, 8);
    scr_spearpattern("ur", spearspeed, heartframes, 0, 8);
    scr_spearpattern("r", spearspeed, heartframes, 0, 8);
}
if (attackpattern == 30)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 20);
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("l", spearspeed, heartframes, 40, 15);
    scr_spearpattern("u", spearspeed, heartframes, 41, 10);
    scr_spearpattern("d", spearspeed, heartframes, 42, 12);
    scr_spearpattern("r", spearspeed, heartframes, 41, 8);
    scr_spearpattern("ul", spearspeed, heartframes, 40, 35);
    scr_spearpattern("dl", spearspeed, heartframes, 41, 10);
    scr_spearpattern("dr", spearspeed, heartframes, 42, 51);
    scr_spearpattern("ur", spearspeed, heartframes, 19, 12);
}
if (attackpattern == 31)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 1);
    var beat = 9;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, 20, 45);
    scr_spearpattern("d", spearspeed, heartframes, 0, 30);
    scr_spearpattern("r", spearspeed, heartframes, 0, 28);
    scr_spearpattern("l", spearspeed, heartframes, 20, 20);
    scr_spearpattern("r", spearspeed, heartframes, 0, 30);
    scr_spearpattern("u", spearspeed, heartframes, 0, 28);
    scr_spearpattern("d", spearspeed, heartframes, 20, 20);
    scr_spearpattern("u", spearspeed, heartframes, 0, 30);
    scr_spearpattern("l", spearspeed, heartframes, 0, 28);
}
if (attackpattern == 32)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 10);
    var beat = 9;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, 20, 24);
    scr_spearpattern("l", spearspeed, heartframes, 20, 10);
    scr_spearpattern("d", spearspeed, heartframes, 0, 6);
    scr_spearpattern("r", spearspeed, heartframes, 0, 25);
    scr_spearpattern("u", spearspeed, heartframes, 0, 6);
    scr_spearpattern("l", spearspeed, heartframes, 0, 25);
}
if (attackpattern == 33)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 10);
    var beat = 9;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, 20, 25);
    scr_spearpattern("l", spearspeed, heartframes, 20, 14);
    scr_spearpattern("d", spearspeed, heartframes, 0, 30);
    scr_spearpattern("l", spearspeed, heartframes, 0, 40);
    scr_spearpattern("d", spearspeed, heartframes, 20, 12);
    scr_spearpattern("r", spearspeed, heartframes, 20, 14);
    scr_spearpattern("u", spearspeed, heartframes, 0, 30);
    scr_spearpattern("l", spearspeed, heartframes, 0, 25);
}
if (attackpattern == 34)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 10);
    var beat = 9;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, 20, 20);
    scr_spearpattern("u", spearspeed, heartframes, 20, 14);
    scr_spearpattern("d", spearspeed, heartframes, 0, 5);
    scr_spearpattern("d", spearspeed, heartframes, 0, 28);
    scr_spearpattern("r", spearspeed, heartframes, 0, 5);
    scr_spearpattern("r", spearspeed, heartframes, 0, 20);
    scr_spearpattern("r", spearspeed, heartframes, 20, 9);
    scr_spearpattern("r", spearspeed, heartframes, 20, 14);
    scr_spearpattern("l", spearspeed, heartframes, 0, 5);
    scr_spearpattern("l", spearspeed, heartframes, 0, 28);
    scr_spearpattern("d", spearspeed, heartframes, 0, 5);
    scr_spearpattern("d", spearspeed, heartframes, 0, 40);
}
if (attackpattern == 35)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 20);
    var beat = 9;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, 20, 9);
    scr_spearpattern("u", spearspeed, heartframes, 20, 9);
    scr_spearpattern("u", spearspeed, heartframes, 20, 9);
    scr_spearpattern("d", spearspeed, heartframes, 0, 31);
    scr_spearpattern("r", spearspeed, heartframes, 0, 33);
    scr_spearpattern("l", spearspeed, heartframes, 20, 9);
    scr_spearpattern("l", spearspeed, heartframes, 20, 9);
    scr_spearpattern("l", spearspeed, heartframes, 20, 9);
    scr_spearpattern("r", spearspeed, heartframes, 0, 31);
    scr_spearpattern("u", spearspeed, heartframes, 0, 28);
}
if (attackpattern == 36)
{
    scr_spearpattern(0, 0, 0, 1, 10);
    scr_spearpattern(0, 0, 0, 3, 20);
    var beat = 9;
    var special = 20;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, special, beat);
    scr_spearpattern("l", spearspeed, heartframes, special, beat);
    scr_spearpattern("r", spearspeed, heartframes, special, beat);
    scr_spearpattern("d", spearspeed, heartframes, special, 100);
    scr_spearpattern("ur", spearspeed, heartframes, special, beat);
    scr_spearpattern("ul", spearspeed, heartframes, special, beat);
    scr_spearpattern("dl", spearspeed, heartframes, special, beat);
    scr_spearpattern("dr", spearspeed, heartframes, special, 120);
}
if (attackpattern == 37)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    var beat = 52;
    var special = 35;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, special, beat);
    scr_spearpattern(0, 0, 0, 1, beat);
    scr_spearpattern("l", spearspeed, heartframes, special, beat);
    scr_spearpattern(0, 0, 0, 1, beat);
    scr_spearpattern("r", spearspeed, heartframes, special, beat);
    scr_spearpattern(0, 0, 0, 1, beat);
    scr_spearpattern("d", spearspeed, heartframes, special, beat);
}
if (attackpattern == 38)
{
    scr_spearpattern(0, 0, 0, 1, 0);
    scr_spearpattern(0, 0, 0, 3, 60);
    scr_spearpattern(choose("u", "r", "d", "l"), 8, 30, 16, 50);
    var beat = 10;
    var special = 16;
    var spearspeed = 8;
    var heartframes = 29;
    var totalheartframes = heartframes;
    repeat (1)
    {
        var rand = choose(1, 2, 3);
        if (rand == 1)
        {
            scr_spearpattern("ur", spearspeed * 1.2, heartframes, special, beat);
            scr_spearpattern("ul", spearspeed * 1.2, heartframes, special, beat);
            scr_spearpattern("dl", spearspeed * 1.2, heartframes, special, beat - 4);
        }
        if (rand == 2)
        {
            scr_spearpattern("dr", spearspeed * 1.2, heartframes, special, beat);
            scr_spearpattern("ul", spearspeed * 1.2, heartframes, special, beat);
            scr_spearpattern("ur", spearspeed * 1.2, heartframes, special, beat - 4);
        }
        if (rand == 3)
        {
            scr_spearpattern("ul", spearspeed * 1.2, heartframes, special, beat);
            scr_spearpattern("ur", spearspeed * 1.2, heartframes, special, beat);
            scr_spearpattern("dr", spearspeed * 1.2, heartframes, special, beat - 4);
        }
        rand = choose(1, 2, 3);
        if (rand == 1)
        {
            scr_spearpattern("l", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("r", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("l", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("l", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("r", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("l", spearspeed * 1, heartframes, special, beat + 8);
        }
        if (rand == 2)
        {
            scr_spearpattern("u", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("d", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("u", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("d", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("u", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("d", spearspeed * 1, heartframes, special, beat + 8);
        }
        if (rand == 3)
        {
            scr_spearpattern("ul", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("dr", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("ul", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("dr", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("ul", spearspeed * 1, heartframes, special, beat);
            scr_spearpattern("dr", spearspeed * 1, heartframes, special, beat + 8);
        }
        rand = choose(1, 2, 3);
        if (rand == 1)
        {
            scr_spearpattern("u", spearspeed * 0.8, heartframes, special, beat * 0.5);
            scr_spearpattern("u", spearspeed * 0.8, heartframes, special, beat);
            scr_spearpattern("ul", spearspeed, heartframes, special, beat);
            scr_spearpattern("ul", spearspeed, heartframes, special, beat);
            scr_spearpattern("ur", spearspeed, heartframes, special, beat);
            scr_spearpattern("ur", spearspeed, heartframes, special, beat);
        }
        if (rand == 2)
        {
            scr_spearpattern("ur", spearspeed * 0.8, heartframes, special, beat * 0.5);
            scr_spearpattern("ur", spearspeed * 0.8, heartframes, special, beat);
            scr_spearpattern("r", spearspeed, heartframes, special, beat);
            scr_spearpattern("r", spearspeed, heartframes, special, beat);
            scr_spearpattern("dr", spearspeed, heartframes, special, beat);
            scr_spearpattern("dr", spearspeed, heartframes, special, beat);
        }
        if (rand == 3)
        {
            scr_spearpattern("dl", spearspeed * 0.8, heartframes, special, beat * 0.5);
            scr_spearpattern("dl", spearspeed * 0.8, heartframes, special, beat);
            scr_spearpattern("d", spearspeed, heartframes, special, beat);
            scr_spearpattern("d", spearspeed, heartframes, special, beat);
            scr_spearpattern("dr", spearspeed, heartframes, special, beat);
            scr_spearpattern("dr", spearspeed, heartframes, special, beat);
        }
    }
    scr_spearpattern(choose("u", "r", "d", "l"), spearspeed * 0.8, heartframes, special, beat);
}
if (attackpattern == 39)
{
    var beat = 44;
    scr_spearpattern(0, 0, 0, 11, beat);
    scr_spearpattern(0, 0, 0, 12, beat);
    scr_spearpattern(0, 0, 0, 12, beat);
    scr_spearpattern(0, 0, 0, 11, beat);
    scr_spearpattern(0, 0, 0, 27, 1);
    var prev = 1;
    beat = 26;
    repeat (14)
    {
        scr_spearpattern(choose("up1", "up2", "right1", "right2", "left1", "left2", "down1", "down2"), 0, 0, 32, beat);
        if (beat > 16)
            beat--;
    }
    scr_spearpattern(1, 0, 0, 28, 20);
    scr_spearpattern(364, 145, -1, 4, 0);
    scr_spearpattern(0, 0, 13, 4, 0);
    scr_spearpattern(0, 0, 15, 4, 0);
    scr_spearpattern(0, 0, 18, 4, 20);
    scr_spearpattern(2, 0, 0, 28, 0);
    scr_spearpattern(282, 145, -1, 4, 0);
    scr_spearpattern(0, 0, 17, 4, 0);
    scr_spearpattern(0, 0, 14, 4, 0);
    scr_spearpattern(0, 0, 16, 4, 35);
    scr_spearpattern(0, 0, 0, 10, 1);
}
if (attackpattern == 40)
{
    var beat = 9;
    var special = 19;
    var spearspeed = 12;
    var heartframes = 50;
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 0);
    scr_spearpattern("u", spearspeed, heartframes, special, 90);
    scr_spearpattern("u", spearspeed, heartframes, special, beat);
    scr_spearpattern("l", spearspeed, heartframes, special, beat);
    scr_spearpattern("r", spearspeed, heartframes, special, beat);
    scr_spearpattern("d", spearspeed, heartframes, special, 50);
    scr_spearpattern("ul", spearspeed * 1.2, heartframes, special, beat);
    scr_spearpattern("u", spearspeed, heartframes, special, beat);
    scr_spearpattern("ur", spearspeed, heartframes, special, 50);
    scr_spearpattern("dl", spearspeed * 1.2, heartframes, special, beat);
    scr_spearpattern("d", spearspeed, heartframes, special, beat);
    scr_spearpattern("dr", spearspeed, heartframes, special, 60);
    beat = 9;
    special = 20;
    spearspeed = 12;
    heartframes = 50;
    scr_spearpattern("u", spearspeed, heartframes, special, 80);
    scr_spearpattern("l", spearspeed, heartframes, special, 80);
    scr_spearpattern("r", spearspeed, heartframes, special, 120);
}
if (attackpattern == 41)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 11, 30, 2, 31);
    scr_spearpattern(0, 0, 0, 11, 38);
    scr_spearpattern(0, 0, 0, 12, 33);
    scr_spearpattern(0, 0, 0, 11, 33);
    scr_spearpattern(0, 0, 0, 12, 4);
    scr_spearpattern(268, 145, -1, 4, 20);
    scr_spearpattern(378, 145, -1, 4, 40);
    scr_spearpattern(378, 125, 0, 4, 1);
    scr_spearpattern(268, 135, -1, 4, 30);
    scr_spearpattern(378, 135, -1, 4, 1);
    scr_spearpattern(268, 135, 0, 4, 30);
    scr_spearpattern(0, 0, 0, 11, 33);
    scr_spearpattern(0, 0, 0, 12, 36);
    scr_spearpattern(0, 0, 0, 12, 5);
    scr_spearpattern(115, 135, -1, 4, 32);
    scr_spearpattern(0, 0, 0, 10, 1);
}
if (attackpattern == 42)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 0);
    var special = 22;
    var spearspeed = 6;
    var heartframes = 50;
    scr_spearpattern("u", 18, heartframes, special, 90);
    scr_spearpattern("l", 18, heartframes, special, 12);
    scr_spearpattern("u", spearspeed, heartframes, 0, 36);
    scr_spearpattern("l", spearspeed, heartframes, 0, 8);
    scr_spearpattern("d", spearspeed, heartframes, 0, 24);
    scr_spearpattern("r", 18, heartframes, special, 9);
    scr_spearpattern("u", spearspeed, heartframes, 0, 31);
    scr_spearpattern("d", spearspeed, heartframes, 0, 20);
}
if (attackpattern == 43)
{
    scr_spearpattern(100, 145, -1, 13, 35);
    scr_spearpattern(100, 145, -1, 4, 5);
    scr_spearpattern(150, 145, -1, 4, 5);
    scr_spearpattern(200, 145, -1, 4, 5);
    scr_spearpattern(250, 145, -1, 4, 5);
    scr_spearpattern(300, 145, -1, 4, 5);
    scr_spearpattern(350, 145, -1, 4, 5);
    scr_spearpattern(400, 145, -1, 4, 5);
    scr_spearpattern(450, 145, -1, 4, 40);
    scr_spearpattern(550, 145, -1, 4, 5);
    scr_spearpattern(500, 145, -1, 4, 5);
    scr_spearpattern(450, 145, -1, 4, 5);
    scr_spearpattern(400, 145, -1, 4, 5);
    scr_spearpattern(350, 145, -1, 4, 5);
    scr_spearpattern(300, 145, -1, 4, 5);
    scr_spearpattern(250, 145, -1, 4, 5);
    scr_spearpattern(200, 145, -1, 4, 35);
    scr_spearpattern(100, 145, -1, 4, 1);
    scr_spearpattern(150, 145, -1, 4, 1);
    scr_spearpattern(300, 145, -1, 4, 1);
    scr_spearpattern(350, 145, -1, 4, 1);
    scr_spearpattern(500, 145, -1, 4, 1);
    scr_spearpattern(550, 145, -1, 4, 17);
    scr_spearpattern(200, 145, -1, 4, 1);
    scr_spearpattern(250, 145, -1, 4, 1);
    scr_spearpattern(400, 145, -1, 4, 1);
    scr_spearpattern(450, 145, -1, 4, 20);
    scr_spearpattern(100, 145, -2, 4, 1);
    scr_spearpattern(150, 145, -2, 4, 1);
    scr_spearpattern(200, 145, -2, 4, 1);
    scr_spearpattern(250, 145, -2, 4, 1);
    scr_spearpattern(300, 145, -2, 4, 1);
    scr_spearpattern(350, 145, -2, 4, 1);
    scr_spearpattern(470, 145, -2, 4, 1);
    scr_spearpattern(520, 145, -2, 4, 35);
    scr_spearpattern(80, 145, -2, 4, 1);
    scr_spearpattern(130, 145, -2, 4, 1);
    scr_spearpattern(300, 145, -2, 4, 1);
    scr_spearpattern(350, 145, -2, 4, 1);
    scr_spearpattern(400, 145, -2, 4, 1);
    scr_spearpattern(450, 145, -2, 4, 1);
    scr_spearpattern(500, 145, -2, 4, 35);
    scr_spearpattern(200, 145, -1, 4, 1);
    scr_spearpattern(250, 145, -1, 4, 1);
    scr_spearpattern(400, 145, -1, 4, 1);
    scr_spearpattern(450, 145, -1, 4, 17);
    scr_spearpattern(100, 145, -1, 4, 1);
    scr_spearpattern(150, 145, -1, 4, 1);
    scr_spearpattern(300, 145, -1, 4, 1);
    scr_spearpattern(350, 145, -1, 4, 1);
    scr_spearpattern(500, 145, -1, 4, 1);
    scr_spearpattern(550, 145, -1, 4, 29);
    scr_spearpattern(0, 0, 0, 10, 5);
}
if (attackpattern == 44)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 0);
    var beat = 16;
    var spearspeed = 25;
    var heartframes = 100;
    var heartframestotal = heartframes;
    scr_spearpattern("u", spearspeed * 0.8, heartframestotal, 14, 10);
    heartframestotal += beat;
    scr_spearpattern("u", spearspeed * 0.8, heartframestotal, 14, 10);
    heartframestotal += beat;
    scr_spearpattern("u", spearspeed * 0.8, heartframestotal, 14, 10);
    heartframestotal += beat;
    scr_spearpattern(270, 8, 30, 16, 10);
    scr_spearpattern(270, 8, 30, 16, 10);
    scr_spearpattern(270, 8, 30, 16, 21);
    scr_spearpattern("l", spearspeed * 0.8, heartframestotal, 14, 10);
    heartframestotal += beat;
    scr_spearpattern("d", spearspeed * 0.6, heartframestotal, 14, 10);
    heartframestotal += (beat * 0.5);
    scr_spearpattern("r", spearspeed, heartframestotal, 14, 10);
    scr_spearpattern("r", spearspeed, heartframestotal, 14, 10);
    scr_spearpattern("l", spearspeed, heartframestotal, 14, 10);
    scr_spearpattern("l", spearspeed, heartframestotal, 14, 10);
    scr_spearpattern("r", spearspeed, heartframestotal, 14, 10);
    scr_spearpattern("l", spearspeed, heartframestotal, 14, 10);
    scr_spearpattern("u", spearspeed * 0.7, heartframestotal, 14, 10);
    scr_spearpattern("d", spearspeed * 0.7, heartframestotal, 14, 10);
    scr_spearpattern("u", spearspeed * 0.7, heartframestotal, 14, 10);
    scr_spearpattern(0, 8, 30, 16, 3);
    scr_spearpattern(0, 8, 30, 16, 3);
    scr_spearpattern(0, 8, 30, 16, 3);
    scr_spearpattern(0, 8, 30, 16, 3);
    scr_spearpattern(0, 8, 30, 16, 7);
    scr_spearpattern(180, 8, 30, 16, 3);
    scr_spearpattern(180, 8, 30, 16, 3);
    scr_spearpattern(180, 8, 30, 16, 3);
    scr_spearpattern(180, 8, 30, 16, 3);
    scr_spearpattern(180, 8, 30, 16, 14);
    scr_spearpattern(180, 8, 30, 360, 3);
    scr_spearpattern(180, 8, 30, 360, 3);
    scr_spearpattern(180, 8, 30, 360, 3);
    scr_spearpattern(180, 8, 30, 360, 3);
    scr_spearpattern(180, 8, 30, 360, 12);
    scr_spearpattern(90, 8, 30, 270, 3);
    scr_spearpattern(90, 8, 30, 270, 3);
    scr_spearpattern(90, 8, 30, 270, 3);
    scr_spearpattern(90, 8, 30, 270, 3);
    scr_spearpattern(90, 8, 30, 270, 20);
    var aa = 38;
    beat = 18;
    var len = 150;
    scr_spearpattern(0, aa + (beat * 7), len, 17, 0);
    scr_spearpattern(45, aa + (beat * 10), len, 17, 0);
    scr_spearpattern(90, aa + (beat * 14), len, 17, 0);
    scr_spearpattern(135, aa + (beat * 4), len, 17, 0);
    scr_spearpattern(180, aa + (beat * 11), len, 17, 0);
    scr_spearpattern(225, aa + (beat * 3), len, 17, 0);
    scr_spearpattern(270, aa + (beat * 1), len, 17, 0);
    scr_spearpattern(315, aa + (beat * 15), len, 17, 0);
    len = 200;
    scr_spearpattern(0, aa + (beat * 0), len, 17, 0);
    scr_spearpattern(45, aa + (beat * 5), len, 17, 0);
    scr_spearpattern(90, aa + (beat * 6), len, 17, 0);
    scr_spearpattern(135, aa + (beat * 13), len, 17, 0);
    scr_spearpattern(180, aa + (beat * 9), len, 17, 0);
    scr_spearpattern(225, aa + (beat * 8), len, 17, 0);
    scr_spearpattern(270, aa + (beat * 12), len, 17, 0);
    scr_spearpattern(315, aa + (beat * 2), len, 17, 320);
    len = 150;
    scr_spearpattern(0, aa + (beat * 7), len, 18, 0);
    scr_spearpattern(45, aa + (beat * 10), len, 18, 0);
    scr_spearpattern(90, aa + (beat * 14), len, 18, 0);
    scr_spearpattern(135, aa + (beat * 4), len, 18, 0);
    scr_spearpattern(180, aa + (beat * 11), len, 18, 0);
    scr_spearpattern(225, aa + (beat * 3), len, 18, 0);
    scr_spearpattern(270, aa + (beat * 1), len, 18, 0);
    scr_spearpattern(315, aa + (beat * 15), len, 18, 0);
    len = 200;
    scr_spearpattern(0, aa + (beat * 0), len, 18, 0);
    scr_spearpattern(45, aa + (beat * 5), len, 18, 0);
    scr_spearpattern(90, aa + (beat * 6), len, 18, 0);
    scr_spearpattern(135, aa + (beat * 13), len, 18, 0);
    scr_spearpattern(180, aa + (beat * 9), len, 18, 0);
    scr_spearpattern(225, aa + (beat * 8), len, 18, 0);
    scr_spearpattern(270, aa + (beat * 12), len, 18, 0);
    scr_spearpattern(315, aa + (beat * 2), len, 18, 150);
}
if (attackpattern == 45)
{
    scr_spearpattern(0, 0, -3, 4, 3);
    scr_spearpattern(0, 0, -3, 4, 3);
    scr_spearpattern(0, 0, -3, 4, 3);
    scr_spearpattern(0, 0, -3, 4, 3);
    scr_spearpattern(0, 0, -3, 4, 3);
    scr_spearpattern(0, 0, -3, 4, 3);
    scr_spearpattern(0, 0, -3, 4, 3);
    scr_spearpattern(0, 0, -3, 4, 27);
    scr_spearpattern(0, 0, 0, 9, 60);
    scr_spearpattern(0, 0, 0, 10, 5);
}
if (attackpattern == 46)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 0);
    scr_spearpattern(0, 0, 0, 8, 11);
    scr_spearpattern(270, 8, 30, 0, 3);
    scr_spearpattern(270, 8, 30, 0, 3);
    scr_spearpattern(270, 8, 30, 0, 3);
    scr_spearpattern(270, 8, 30, 0, 3);
    scr_spearpattern(180, 11, 30, 0, 3);
    scr_spearpattern(180, 11, 30, 0, 3);
    scr_spearpattern(180, 11, 30, 0, 3);
    scr_spearpattern(180, 11, 30, 0, 3);
    scr_spearpattern(0, 11, 30, 0, 3);
    scr_spearpattern(0, 11, 30, 0, 3);
    scr_spearpattern(0, 11, 30, 0, 3);
    scr_spearpattern(0, 11, 30, 0, 3);
    scr_spearpattern(90, 8, 30, 0, 3);
    scr_spearpattern(90, 8, 30, 0, 3);
    scr_spearpattern(90, 8, 30, 0, 3);
    scr_spearpattern(90, 8, 30, 0, 31);
    scr_spearpattern(270, 0, 0, 2, 41);
    scr_spearpattern(358, 115, 0, 4, 30);
    scr_spearpattern(0, 0, 0, 1, 11);
    scr_spearpattern(90, 0, 0, 2, 41);
    scr_spearpattern(278, 115, -1, 4, 30);
    scr_spearpattern(0, 0, 0, 1, 11);
    scr_spearpattern(0, 0, 0, 2, 41);
    scr_spearpattern(358, 115, 0, 4, 30);
    scr_spearpattern(0, 0, 0, 1, 11);
    scr_spearpattern(180, 0, 0, 2, 41);
    scr_spearpattern(278, 115, -1, 4, 20);
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 11, 30, 0, 10);
    scr_spearpattern(180, 11, 30, 0, 10);
    scr_spearpattern(0, 11, 30, 0, 21);
    scr_spearpattern(180, 11, 30, 0, 10);
    scr_spearpattern(0, 11, 30, 0, 10);
    scr_spearpattern(180, 11, 30, 0, 21);
    scr_spearpattern(270, 0, 0, 2, 51);
    scr_spearpattern(268, 115, 60, 4, 1);
    scr_spearpattern(316, 115, 60, 4, 1);
    scr_spearpattern(358, 115, 0, 4, 20);
    scr_spearpattern(0, 0, 0, 9, 61);
}
if (attackpattern == 47)
{
    scr_spearpattern(100, 145, -1, 13, 35);
    scr_spearpattern(100, 145, -1, 4, 5);
    scr_spearpattern(150, 145, -1, 4, 5);
    scr_spearpattern(200, 145, -1, 4, 5);
    scr_spearpattern(250, 145, -1, 4, 5);
    scr_spearpattern(300, 145, -1, 4, 5);
    scr_spearpattern(350, 145, -1, 4, 5);
    scr_spearpattern(400, 145, -1, 4, 5);
    scr_spearpattern(450, 145, -1, 4, 40);
    scr_spearpattern(550, 145, -1, 4, 8);
    scr_spearpattern(500, 145, -1, 4, 8);
    scr_spearpattern(450, 145, -1, 4, 8);
    scr_spearpattern(400, 145, -1, 4, 8);
    scr_spearpattern(350, 145, -1, 4, 8);
    scr_spearpattern(300, 145, -1, 4, 8);
    scr_spearpattern(250, 145, -1, 4, 8);
    scr_spearpattern(200, 145, -1, 4, 35);
    scr_spearpattern(100, 145, -1, 4, 1);
    scr_spearpattern(150, 145, -1, 4, 1);
    scr_spearpattern(300, 145, -1, 4, 1);
    scr_spearpattern(350, 145, -1, 4, 1);
    scr_spearpattern(500, 145, -1, 4, 1);
    scr_spearpattern(550, 145, -1, 4, 12);
    scr_spearpattern(100, 145, -1, 4, 1);
    scr_spearpattern(150, 145, -1, 4, 1);
    scr_spearpattern(200, 145, -1, 4, 1);
    scr_spearpattern(250, 145, -1, 4, 1);
    scr_spearpattern(400, 145, -1, 4, 1);
    scr_spearpattern(450, 145, -1, 4, 20);
    scr_spearpattern(100, 145, -2, 4, 1);
    scr_spearpattern(150, 145, -2, 4, 1);
    scr_spearpattern(200, 145, -2, 4, 1);
    scr_spearpattern(250, 145, -2, 4, 1);
    scr_spearpattern(300, 145, -2, 4, 1);
    scr_spearpattern(350, 145, -2, 4, 1);
    scr_spearpattern(470, 145, -2, 4, 1);
    scr_spearpattern(520, 145, -2, 4, 35);
    scr_spearpattern(80, 145, -2, 4, 1);
    scr_spearpattern(130, 145, -2, 4, 1);
    scr_spearpattern(300, 145, -2, 4, 1);
    scr_spearpattern(350, 145, -2, 4, 1);
    scr_spearpattern(400, 145, -2, 4, 1);
    scr_spearpattern(450, 145, -2, 4, 1);
    scr_spearpattern(500, 145, -2, 4, 35);
    scr_spearpattern(200, 145, -1, 4, 1);
    scr_spearpattern(250, 145, -1, 4, 1);
    scr_spearpattern(400, 145, -1, 4, 1);
    scr_spearpattern(450, 145, -1, 4, 12);
    scr_spearpattern(100, 145, -1, 4, 1);
    scr_spearpattern(150, 145, -1, 4, 1);
    scr_spearpattern(300, 145, -1, 4, 1);
    scr_spearpattern(350, 145, -1, 4, 1);
    scr_spearpattern(500, 145, -1, 4, 1);
    scr_spearpattern(550, 145, -1, 4, 40);
    scr_spearpattern(0, 0, 0, 10, 50);
}
if (attackpattern == 48)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(268, 115, 60, 4, 1);
    scr_spearpattern(316, 115, 60, 4, 1);
    scr_spearpattern(364, 115, 60, 4, 9999);
    scr_spearpattern(0, 5, 60, 0, 9999);
}
if (attackpattern == 49)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 0);
    scr_spearpattern(0, 11, 30, 2, 1);
    scr_spearpattern(0, 5, 60, 5, 240);
}
if (attackpattern == 50)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 0);
    scr_spearpattern(270, 8, 30, 0, 10);
    scr_spearpattern(225, 13, 30, 0, 10);
    scr_spearpattern(270, 8, 30, 0, 21);
    scr_spearpattern(270, 8, 30, 0, 10);
    scr_spearpattern(315, 13, 30, 0, 10);
    scr_spearpattern(270, 8, 30, 0, 21);
    scr_spearpattern(270, 8, 30, 0, 10);
    scr_spearpattern(225, 13, 30, 0, 10);
    scr_spearpattern(270, 8, 30, 0, 10);
    scr_spearpattern(315, 13, 30, 0, 10);
    scr_spearpattern(135, 13, 30, 0, 10);
    scr_spearpattern(45, 13, 30, 0, 10);
    scr_spearpattern(180, 11, 30, 0, 10);
}
if (attackpattern == 51)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 1);
    var _spd = 12;
    var _time_to_heart = 50;
    repeat (2)
    {
        scr_spearpattern(270, _spd, _time_to_heart, 0, 15);
        scr_spearpattern(315, _spd, _time_to_heart, 0, 15);
        scr_spearpattern(0, _spd, _time_to_heart, 0, 15);
        scr_spearpattern(45, _spd, _time_to_heart, 0, 15);
        scr_spearpattern(90, _spd, _time_to_heart, 0, 15);
        scr_spearpattern(135, _spd, _time_to_heart, 0, 15);
        scr_spearpattern(180, _spd, _time_to_heart, 0, 15);
        scr_spearpattern(225, _spd, _time_to_heart, 0, 15);
        _spd += 3;
    }
}
if (attackpattern == 52)
{
    scr_spearpattern(0, 0, 0, 1, 60);
    scr_spearpattern(90, 8, 40, 315, 45);
    scr_spearpattern(180, 8, 40, 225, 40);
    scr_spearpattern(270, 5, 60, 135, 45);
}
if (attackpattern == 53)
{
    scr_spearpattern(0, 0, 0, 1, 0);
    scr_spearpattern(0, 0, 0, 3, 0);
    var beat = 4;
    var spearspeed = 9;
    var heartframes = 40;
    for (var i = 0; i < 5; i++)
    {
        var _dir = 90 + (i * 45);
        scr_spearpattern(_dir, spearspeed, heartframes, 0, beat);
    }
    scr_spearpattern(0, 0, 0, 3, 8);
    for (var i = 0; i < 5; i++)
    {
        var _dir = 180 - (i * 45);
        scr_spearpattern(_dir, spearspeed, heartframes, 0, beat);
    }
    scr_spearpattern(0, 0, 0, 3, 8);
    for (var i = 0; i < 5; i++)
    {
        var _dir = 90 + (i * 45);
        scr_spearpattern(_dir, spearspeed, heartframes, 0, beat);
    }
    scr_spearpattern(0, 0, 0, 3, 8);
    for (var i = 0; i < 11; i++)
    {
        var _dir = 180 - (i * 45);
        scr_spearpattern(_dir, spearspeed, heartframes, 0, beat);
    }
    for (var i = 0; i < 30; i++)
    {
        var _dir = 90 + (i * 45);
        scr_spearpattern(_dir, spearspeed, heartframes, 0, beat);
        spearspeed += 0.5;
    }
    scr_spearpattern(0, 0, 0, 3, 8);
}
if (attackpattern == 54)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 1);
    var beat = 8;
    var spearspeed = 12;
    var heartframes = 40;
    scr_spearpattern("u", spearspeed * 0.8, heartframes, 0, beat * 0.5);
    scr_spearpattern("u", spearspeed * 0.8, heartframes, 0, beat);
    scr_spearpattern("ul", spearspeed, heartframes, 0, beat);
    scr_spearpattern("ul", spearspeed, heartframes, 0, beat);
    scr_spearpattern("ur", spearspeed, heartframes, 0, beat);
    scr_spearpattern("ur", spearspeed, heartframes, 0, beat);
    scr_spearpattern("l", spearspeed * 1, heartframes, 0, beat);
    scr_spearpattern("l", spearspeed * 1, heartframes, 0, beat);
    scr_spearpattern("u", spearspeed * 0.8, heartframes, 0, beat * 0.5);
    scr_spearpattern("u", spearspeed * 0.8, heartframes, 0, beat);
    scr_spearpattern("ur", spearspeed * 1, heartframes, 0, beat);
    scr_spearpattern("ur", spearspeed * 1, heartframes, 0, beat);
    scr_spearpattern("ul", spearspeed * 1, heartframes, 0, beat);
    scr_spearpattern("ul", spearspeed * 1, heartframes, 0, beat);
    scr_spearpattern("r", spearspeed * 1, heartframes, 0, beat);
    scr_spearpattern("r", spearspeed * 1, heartframes, 0, beat);
    scr_spearpattern("u", spearspeed * 0.8, heartframes, 0, beat * 0.5);
    scr_spearpattern("u", spearspeed * 0.8, heartframes, 0, beat);
    scr_spearpattern("ul", spearspeed * 1, heartframes, 0, beat);
    scr_spearpattern("ul", spearspeed * 1, heartframes, 0, beat);
    scr_spearpattern("ur", spearspeed * 1, heartframes, 0, beat);
    scr_spearpattern("ur", spearspeed * 1, heartframes, 0, beat);
    scr_spearpattern("u", spearspeed * 0.8, heartframes, 0, beat * 0.5);
    scr_spearpattern("u", spearspeed * 0.8, heartframes, 0, beat);
    scr_spearpattern("d", spearspeed * 0.8, heartframes, 0, beat);
    scr_spearpattern("l", spearspeed * 1, heartframes, 0, beat);
    scr_spearpattern("r", spearspeed * 1, heartframes, 0, beat);
    scr_spearpattern("u", spearspeed * 0.8, heartframes, 0, beat);
}
if (attackpattern == 55)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 40);
    var beat = 15;
    var spearspeed = 10;
    var heartframes = 40;
    var b = 0;
    for (var i = 0; i < 16; i++)
    {
        var _direction = 90 * choose(0, 1, 2, 3);
        scr_spearpattern(_direction, spearspeed, heartframes, 0, beat);
        scr_spearpattern(_direction + choose(-45, 45, 90, 180, 270), spearspeed, heartframes, 0, beat);
        if (spearspeed < 20)
            spearspeed += 2;
        if (i == 1 || i == 2 || i == 3 || i == 4 || i == 5 || i == 6 || i == 7)
            beat--;
    }
}
if (attackpattern == 56)
{
    scr_spearpattern(0, 0, 0, 1, 60);
    scr_spearpattern(0, 0, 0, 3, 1);
    var beat = 7;
    var spearspeed = 3;
    var heartframes = 120;
    for (var i = 0; i < 24; i++)
    {
        var _direction = choose(0, 90, 180, 270);
        scr_spearpattern(_direction, spearspeed, heartframes, 0, beat);
        scr_spearpattern(_direction + choose(-45, 45, 90, 180, 270), spearspeed, heartframes, 0, beat);
    }
}
if (attackpattern == 57 || attackpattern == 58)
{
    scr_spearpattern(0, 0, 0, 1, 20);
    scr_spearpattern(0, 0, 0, 3, 20);
    var beat = 10;
    var spearspeed = 12;
    var heartframes = 20;
    var totalheartframes = heartframes;
    if (attackpattern == 56)
    {
        spearspeed = 6;
        beat = 8;
    }
    if (attackpattern == 57)
    {
        spearspeed = 7;
        beat = 7;
    }
    if (attackpattern == 58)
    {
        spearspeed = 8;
        beat = 6;
    }
    for (var i = 0; i < 20; i++)
    {
        var _direction = 90 * choose(0, 1, 2, 3);
        scr_spearpattern(_direction, spearspeed, totalheartframes, 0, 0);
        totalheartframes += beat;
        scr_spearpattern(_direction + choose(-45, 45, 90, 180, 270), spearspeed, totalheartframes, 0, 0);
        totalheartframes += beat;
    }
}
if (attackpattern == 56.5)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 1);
    var beat = 20;
    var spearspeed = 20;
    var heartframes = 40;
    var currentdistance = 40;
    for (var i = 0; i < 51; i++)
    {
        scr_spearpattern(180 + (i * 45), clamp(spearspeed - (i * 0.5), 5, 20), currentdistance, 0, 1);
        currentdistance += clamp(beat - i, 3, 20);
    }
}
if (attackpattern == 57)
{
    scr_spearpattern(0, 0, 0, 1, 1);
    scr_spearpattern(0, 0, 0, 3, 0);
    scr_spearpattern(270, 8, 30, 0, 3);
    scr_spearpattern(270, 8, 30, 0, 3);
    scr_spearpattern(270, 8, 30, 0, 3);
    scr_spearpattern(270, 8, 30, 0, 3);
    scr_spearpattern(180, 11, 30, 0, 3);
    scr_spearpattern(180, 11, 30, 0, 3);
    scr_spearpattern(180, 11, 30, 0, 3);
    scr_spearpattern(180, 11, 30, 0, 3);
    scr_spearpattern(0, 11, 30, 0, 3);
    scr_spearpattern(0, 11, 30, 0, 3);
    scr_spearpattern(0, 11, 30, 0, 3);
    scr_spearpattern(0, 11, 30, 0, 3);
    scr_spearpattern(90, 8, 30, 0, 3);
    scr_spearpattern(90, 8, 30, 0, 3);
    scr_spearpattern(90, 8, 30, 0, 3);
    scr_spearpattern(90, 8, 30, 0, 5);
    scr_spearpattern(270, 8, 30, 0, 5);
    scr_spearpattern(270, 8, 30, 0, 5);
    scr_spearpattern(180, 11, 30, 0, 5);
    scr_spearpattern(180, 11, 30, 0, 5);
    scr_spearpattern(0, 11, 30, 0, 5);
    scr_spearpattern(270, 8, 30, 0, 5);
    scr_spearpattern(90, 8, 30, 0, 5);
    scr_spearpattern(180, 11, 30, 0, 5);
    scr_spearpattern(90, 8, 30, 0, 3);
    scr_spearpattern(90, 8, 30, 0, 3);
    scr_spearpattern(90, 8, 30, 0, 5);
    scr_spearpattern(90, 8, 30, 0, 5);
    scr_spearpattern(0, 11, 30, 0, 5);
    scr_spearpattern(0, 11, 30, 0, 5);
    scr_spearpattern(180, 11, 30, 0, 5);
    scr_spearpattern(180, 11, 30, 0, 5);
    scr_spearpattern(270, 8, 30, 0, 5);
    scr_spearpattern(270, 8, 30, 0, 5);
    scr_spearpattern(0, 11, 30, 0, 3);
    scr_spearpattern(0, 11, 30, 0, 5);
    scr_spearpattern(180, 11, 30, 0, 5);
    scr_spearpattern(270, 8, 30, 0, 5);
    scr_spearpattern(270, 8, 30, 0, 5);
    scr_spearpattern(180, 11, 30, 0, 3);
    scr_spearpattern(180, 11, 30, 0, 5);
    scr_spearpattern(0, 11, 30, 0, 5);
    scr_spearpattern(270, 8, 30, 0, 5);
    scr_spearpattern(270, 8, 30, 0, 5);
}
if (attackpattern == 70)
    scr_spearpattern(x, y, 60, 50, 9999);
if (attackpattern == 71)
    scr_spearpattern(x, y, 60, 51, 9999);
if (attackpattern == 72)
    scr_spearpattern(x, y, 60, 52, 9999);
if (attackpattern == 73)
    scr_spearpattern(x, y, 60, 53, 9999);
if (attackpattern > 69 && attackpattern < 72)
    boxoffset = true;
else
    boxoffset = false;
scr_debug_print("turn=" + string(trueturn));
scr_debug_print("balloonturn=" + string(turn));
scr_debug_print("attackpattern=" + string(attackpattern));
if (trueturn == 0)
{
    attackpattern = 1;
}
else if (trueturn == 1)
{
    attackpattern = 2;
}
else if (trueturn == 2)
{
    attackpattern = 3;
}
else if (trueturn == 3)
{
    attackpattern = 4;
}
else if (trueturn == 4)
{
    attackpattern = 72;
}
else if (trueturn == 5)
{
    attackpattern = 70;
}
else if (trueturn == 6)
{
    attackpattern = 6;
}
else if (trueturn == 7)
{
    attackpattern = 7;
}
else if (trueturn == 8)
{
    attackpattern = 12;
}
else if (trueturn == 9)
{
    attackpattern = 9;
}
else if (trueturn == 10)
{
    attackpattern = 47;
}
else if (trueturn == 11)
{
    attackpattern = 70;
}
else if (trueturn == 12)
{
    attackpattern = 13;
}
else if (trueturn == 13)
{
    attackpattern = 14;
}
else if (trueturn == 14)
{
    attackpattern = 53;
}
else if (trueturn == 15)
{
    attackpattern = 55;
}
else if (trueturn == 16)
{
    attackpattern = 56;
}
else if (trueturn == 17)
{
    attackpattern = 220;
}
else if (trueturn == 20)
{
    attackpattern = 19;
    trueturn = 14;
    reachedendphase = 1;
}
trueturn++;
turn++;
