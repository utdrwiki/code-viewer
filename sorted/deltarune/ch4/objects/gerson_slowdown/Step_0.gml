if (con == 0)
{
    timer++;
    if (obj_hammer_of_justice_enemy.rudebusterhitcountmax == 1)
    {
        if (timer >= 5)
            speed = 20;
        if (timer >= 8 && timer <= 10)
        {
            obj_gerson_rudebuster.speed = lerp(20, 0.5, (timer - 8) / 2);
            obj_gerson_rudebuster.gravity = 0;
            obj_gerson_rudebuster.friction = 0;
        }
    }
    if (obj_hammer_of_justice_enemy.rudebusterhitcountmax == 2)
    {
        if (obj_hammer_of_justice_enemy.rudebusterhitcount == 1)
            obj_gerson_rudebuster.speed = 20;
        if (obj_hammer_of_justice_enemy.rudebusterhitcount == 2)
            obj_gerson_rudebuster.speed = 35;
    }
    if (obj_hammer_of_justice_enemy.rudebusterhitcountmax == 3)
    {
        if (obj_hammer_of_justice_enemy.rudebusterhitcount == 1)
            obj_gerson_rudebuster.speed = 20;
        if (obj_hammer_of_justice_enemy.rudebusterhitcount == 2)
            obj_gerson_rudebuster.speed = 35;
        if (obj_hammer_of_justice_enemy.rudebusterhitcount == 3)
            obj_gerson_rudebuster.speed = 50;
    }
    darkalpha = lerp(darkalpha, 1, timer / 60);
}
if (con == 1)
{
    timer++;
    darkalpha = lerp(darkalpha, 0.5, 0.2);
    if (timer == 10)
        instance_destroy();
}
