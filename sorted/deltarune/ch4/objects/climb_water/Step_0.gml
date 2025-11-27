movetimer++;
totaltimer++;
if (watertype == 2)
{
    if (totaltimer < 15)
        movetimer -= (1 - ((1/15) * totaltimer));
}
if (falldir == 0)
    drawy = (movetimer / moverate) * 40;
if (falldir == 1)
    drawx = (movetimer / moverate) * 40;
if (falldir == 2)
    drawy = -(movetimer / moverate) * 40;
if (falldir == 3)
    drawx = -(movetimer / moverate) * 40;
if (movetimer >= moverate)
{
    movetimer = 0;
    if (falldir == 0)
        y += 40;
    if (falldir == 1)
        x += 40;
    if (falldir == 2)
        y -= 40;
    if (falldir == 3)
        x -= 40;
    drawx = 0;
    drawy = 0;
    tilecount++;
    if (watertype == 0)
    {
        if (tilecount == (tilelimit - 1))
            image_alpha = 0.5;
        if (tilecount >= tilelimit)
            instance_destroy();
    }
    if (watertype == 1 || watertype == 2)
    {
        if (y > (endy + 10))
            instance_destroy();
    }
}
if (y >= (cameray() + 740))
    instance_destroy();
if (!triggered && i_ex(obj_climb_kris) && global.interact == 0)
{
    var topy = clamp(y + drawy, ystart, endy);
    var boty = clamp((y - 40) + (image_yscale * 40) + drawy, ystart, endy);
    var kris = 0;
    var width = 40;
    var yoff = 8;
    if (watertype == 2)
        width = 12;
    if (watertype == 2)
        yoff = 14 * image_yscale;
    var adjustment = 0;
    if (watertype == 1 && i_ex(obj_rotating_tower_controller_new))
        adjustment = 40;
    if (watertype == 2)
        adjustment = 20;
    if ((boty - (topy + yoff)) > 8)
        kris = collision_rectangle(x + adjustment + 8, topy + yoff, (x + adjustment + width) - 8, boty - 8, obj_climb_kris, 0, 0);
    if (i_ex(kris))
    {
        with (kris)
        {
            if (fallingcon == 0 && (neutralcon == 1 || jumpchargecon >= 1))
            {
                if (variable_instance_exists(other, "falldir"))
                    falldir = other.falldir;
                fallingcon = 1;
                fallingtimer = other.fallingtimer;
                cancelcon = 1;
                if (other.bad)
                {
                    damage = other.damage;
                    damagecon = 1;
                }
                other.triggered = 1;
                if (other.sndplayed == 0)
                {
                    other.sndplayed = 1;
                    snd_play(motor_upper_2, 1, 1);
                    snd_play_delay(motor_upper_2, 1, 0.6, 0.75);
                }
            }
        }
    }
}
