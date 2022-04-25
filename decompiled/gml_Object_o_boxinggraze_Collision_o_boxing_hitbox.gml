if (o_boxingcontroller.dead == true)
    return;
if (o_boxingcontroller.invincible == 0 && confirm == false && o_boxingcontroller.wireframe_boxing == 0)
{
    if (other.grazed == false)
    {
        other.grazed = true
        confirm = true
        tpgain = other.tpgain
        alarm[0] = 2
        with (o_boxingcontroller)
            boxingtimer -= 4
    }
}
