if (chainreaction == false)
    exit;
if (other.con == 1)
    exit;
if (chainreactiontimer > 3)
{
    other.con = 1;
    instance_destroy();
}
