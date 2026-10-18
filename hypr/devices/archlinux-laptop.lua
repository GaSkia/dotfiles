
hl.monitor({ output = "eDP-1",
  scale = 1.2,
  mode = "1920x1200@60",
  position = "1920x0"
})

hl.monitor ({
  output = "HDMI-A-1",
  mode = "1920x1080@60",

})
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("hyprctl notify 1  10000 \"rgb(79a0f7)\" \"Lid on\""), {locked = true})
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprctl notify 1  10000 \"rgb(79a0f7)\" \"Lid off\""), {locked = true})

hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("hyprctl eval 'hl.monitor({output = \"eDP-1\", scale=1.2, mode=\"1920x1200@60\", disabled=false})'"))
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprctl eval 'hl.monitor({output = \"eDP-1\", scale=1.2, mode=\"1920x1200@60\", disabled=true})'"))
