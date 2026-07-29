---@diagnostic disable: undefined-global
hl.monitor({
    output = "DP-1",
    mode = "1920x1080@144",
    position = "0x0",
    scale = 1
})
hl.monitor({
    output = "DP-2",
    mode = "1440x900@60",
    position = "-1440x0",
    scale = 1
})

local terminal = 'alacritty'
local menu = "hyprlauncher"
local mainMod = "SUPER"
local hyper = "ALT + SHIFT + CTRL + SUPER"
local meh = "ALT + SHIFT + CTRL"
local fileManager = "thunar"
local browser = "librewolf"


hl.on("hyprland.start", function()
    hl.exec_cmd("waybar & hyprpaper & librewolf")
end
)

hl.config({
    input ={
        kb_layout = "us",
        follow_mouse = 1,
        sensitivity = 0,
    }
})

hl.config({
    xwayland = {
        enabled = true
    }
})
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

-------------------------
----- LOOK AND FEEL -----
-------------------------
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 20,
        border_size = 2,
        col = {
            active_border = { colors = {"rgba(7aa2f7ff)"}},
            inactive_border = { colors = {"rgba(3b4261ff)"}},
        },

        resize_on_border = false,
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding = 3,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = false,
            size = 3,
            passes = 1,

            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.curve("easeOutQuint", { type = "bezier", points = {{0.23, 1}, {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = {{0.65, 0.05}, {0.36, 1} }})
hl.curve("linear", {type = "bezier", points = {{0, 0}, {1,1} }})
hl.curve("almostLinear", {type = "bezier", points = {{0.5,  0.5},  {0.75, 1} }})
hl.curve("quick", {type = "bezier", points = {{0.15, 0}, {0.1, 1} }})
hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
-- TODO: fix animation
-- hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
-- hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

hl.window_rule({
    name = "move-to-workspace3",
    match = {
        class = "org.pulseaudio.pavucontrol|discord|Spotify",
    },
    workspace = 3,
})

hl.window_rule({
    name = "move-to-workspace2",
    match = {
        class = "librewolf",
    },
        workspace = 2,
})

hl.window_rule({
    name = "suppress-maximize-events",
    match = {
        class = ".*",
    },
    suppress_event = maximize
})

hl.window_rule( {
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.window_rule( {
    name = "move-hyprland-run",
    match = {
        class = "hyprland-run",
    },
    move = "20 monitor_h-120",
    float = true
})
hl.window_rule({
    name = "pseudo-emulator",
    match = {
        class = "Emulator",
    },
    pseudo = true,
    size = {320, 640}
})

hl.workspace_rule({
    default = true,
    workspace = 2,
})

hl.workspace_rule({
    workspace = 3,
})
