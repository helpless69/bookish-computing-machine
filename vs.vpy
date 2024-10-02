from vapoursynth import core
clip = core.lsmas.LWLibavSource(r'video.mkv')
clip=core.resize.Spline36(clip=clip, width=1280 , height=720)
clip.set_output()
