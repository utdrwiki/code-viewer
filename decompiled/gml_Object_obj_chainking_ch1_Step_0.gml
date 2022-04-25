if (t == 0 && kingcon == 0)
{
    sprite_index = spr_chainking_toss_ch1
    image_index = 0
    image_speed = 0.5
    kingcon = 1
    soundplayed = false
    if (type == 2 && subtype == 1)
        snd_play_ch1(snd_dadlaugh_ch1)
    else
        snd_play_ch1(snd_dadblast_ch1)
}
if (kingcon == 1)
{
    if (image_index >= 3)
    {
        if (image_index >= 2 && soundplayed == false)
        {
            snd_play_ch1(snd_criticalswing_ch1)
            soundplayed = true
        }
        sprite_index = spr_chainking_toss_idle_ch1
        image_index = 0
        image_speed = 0.334
        kingcon = 2
        if (type == 0)
            chain = instance_create_ch1((x - 44), (y + 104), obj_chain_of_hell_ch1)
        if (type == 1)
            chain = instance_create_ch1((x - 24), (y + 104), obj_wavechain_ch1)
        if (type == 2)
            chain = instance_create_ch1((x - 24), (y + 104), obj_finalchain_ch1)
        scr_bullet_inherit_ch1(chain)
        chain.type = subtype
    }
}
if (type == 0)
{
    if (kingcon == 2)
    {
        if instance_exists(chain)
        {
            if (chain.chaincon == 3)
                image_speed = 0
            if (chain.chaincon >= 10)
            {
                sprite_index = spr_chainking_pullback_ch1
                image_speed = 0.25
                image_index = 0
                kingcon = 3
            }
        }
    }
    if (kingcon == 3)
    {
        if instance_exists(chain)
        {
            if (chain.chaincon >= 11)
            {
                sprite_index = spr_chainking_receive_ch1
                image_speed = 0.25
                image_index = 0
                kingcon = 4
            }
        }
    }
}
t += 1
