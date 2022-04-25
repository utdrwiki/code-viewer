var _forcefield = instance_nearest((x - 160), (y + 160), obj_forcefield)
if (!i_ex(_forcefield))
    return;
with (_forcefield)
{
    stayVisible = false
    y -= 160
    if i_ex(solid1)
        solid1.y -= 160
}
