
local menu = "hyprlauncher"
local mainMod = "SUPER"
local hyper = "ALT + SHIFT + CTRL + SUPER"
local meh = "ALT + SHIFT + CTRL"
local fileManager = "thunar"
local browser = "librewolf"
hl.bind(mainMod .. " + F",                          hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + P",			                hl.dsp.window.pseudo())
hl.bind(mainMod .. " + C",			                hl.dsp.window.close())
hl.bind(mainMod .. " + SPACE",		                hl.dsp.window.float({ action = "toggle" }) )
hl.bind(mainMod .. " + l",			                hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + h",			                hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + k",			                hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j",			                hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + mouse:272",                  hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273",                  hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + S",                          hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S",                  hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " +  TAB",                       hl.dsp.window.cycle_next({""}))
hl.bind(meh .. " + S",  hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(meh .. " + C",	                hl.dsp.window.kill())
hl.bind(meh .. " + l",			                        hl.dsp.window.swap({ direction = "right" }))
hl.bind(meh .. " + h",			                        hl.dsp.window.swap({ direction = "left" }))
hl.bind(meh .. " + k",			                        hl.dsp.window.swap({ direction = "up" }))
hl.bind(meh .. " + j",			                        hl.dsp.window.swap({ direction = "down" }))
hl.bind("SUPER + X", function ()
    if hl.get_workspace("special:minimized") then
        hl.dispatch(hl.dsp.window.move({ workspace = hl.get_active_workspace(), window = "tag:minimized" }))
        hl.dispatch(hl.dsp.window.clear_tags({ window = "tag:minimized" }))
    else
        hl.dispatch(hl.dsp.window.tag({ tag = "minimized", window = hl.get_active_window() }))
        hl.dispatch(hl.dsp.window.move({ workspace = "special:minimized", follow = false }))
    end
end)

hl.bind(hyper .. " + T",                     hl.dsp.exec_cmd("~/bin/alacritty.sh"))
hl.bind(hyper .. " + E",			                hl.dsp.exec_cmd(fileManager))
hl.bind(hyper .. " + B",			                hl.dsp.exec_cmd(browser))
hl.bind(hyper .. " + M",			                hl.dsp.exec_cmd("spotify-launcher"))
hl.bind(hyper .. " + V",			                hl.dsp.exec_cmd("pavucontrol"))
hl.bind(hyper .. " + E",			        hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(hyper .. " + R",			                hl.dsp.exec_cmd(menu))

hl.bind("XF86AudioRaiseVolume",                     hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",                     hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",                            hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",                         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",                      hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",                    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",                            hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause",                           hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",                            hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",                            hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i}))
end
