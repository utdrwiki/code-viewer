if (surface_exists(surf))
    surface_free(surf);
if (surface_exists(starsurf))
    surface_free(starsurf);
if (!obj_knight_enemy.visible)
{
    obj_knight_enemy.visible = true;
    obj_knight_enemy.aetimer = aetimer;
}
