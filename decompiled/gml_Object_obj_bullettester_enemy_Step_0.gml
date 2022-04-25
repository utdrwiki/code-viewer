if (global.monster[myself] == true)
{
    image_speed = 0.15
    image_alpha = 1
    timer += 1
    if (timer == 15 && attacked == false)
    {
        global.turntimer = 180
        if ((!i_ex(myspawner)) && instance_exists(obj_heart))
        {
            global.monsterattackname[myself] = ("ThisAttack" + string(spawntype))
            myspawner = scr_bulletspawner(x, y, obj_dbulletcontroller)
            myspawner.type = spawntype
            myspawner.damage = 10
            myspawner.difficulty = global.tempflag[27]
        }
        attacked = true
    }
}
else
{
    image_alpha = 0.5
    image_speed = 0
}
if (!scr_isphase("bullets"))
{
    timer = 0
    attacked = false
}
