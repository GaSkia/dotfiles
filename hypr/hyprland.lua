
require('animations');
require('bind');
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
        rounding = 5,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = true,
            size = 1,
            passes = 1,
            new_optimizations = true,
            vibrancy = 0.0117,
            contrast = 2,
            brightness = 1,
        },

        glow = {
            enabled = true,
            range= 5,
            color_inactive = "#000000",
            color = "0xee33ccff",
        },

        motion_blur = {
            enabled = false,
        },

    },

    animations = {
        enabled = false,
    },
})


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
