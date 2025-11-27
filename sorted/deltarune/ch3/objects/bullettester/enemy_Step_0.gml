if (global.monster[myself] == 1)
{
    image_speed = 0.15;
    image_alpha = 1;
    active = 1;
    timer++;
    if (timer == 2 && attacked == 0)
    {
        scr_turntimer(180);
        if (!instance_exists(myspawner) && instance_exists(obj_heart))
        {
            global.monsterattackname[myself] = "ThisAttack" + string(spawntype);
            myspawner = scr_bulletspawner(x, y, obj_dbulletcontroller);
            myspawner.type = spawntype;
            myspawner.damage = 10;
            myspawner.difficulty = global.tempflag[27];
        }
        attacked = 1;
    }
}
else
{
    image_alpha = 0.25;
    image_speed = 0;
    active = 0;
}
if (!scr_isphase("bullets"))
{
    timer = 0;
    attacked = 0;
}
