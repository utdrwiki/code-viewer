__view_set((0 << 0), 0, (__view_get((0 << 0), 0) + panx))
__view_set((1 << 0), 0, (__view_get((1 << 0), 0) + pany))
pantimer += 1
if (pantimer >= panmax)
    instance_destroy()
