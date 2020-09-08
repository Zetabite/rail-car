local hit_effects = require ("__base__/prototypes/entity/demo-hit-effects")
local sounds = require("__base__/prototypes/entity/demo-sounds")
local tank = data.raw["car"]["tank"]
local tank_shift_y = 6

data:extend({
	{
		type = "locomotive",
		name = "armoured-draisine",
		icon = "__base__/graphics/icons/tank.png",
    	icon_size = 64,
		flags = tank.flags,
		minable = {mining_time = 0.5, result = "armoured-draisine"},
		mined_sound = tank.mined_sound,
		max_health = tank.max_health,
		corpse = tank.corpse,
		dying_explosion = tank.dying_explosion,
		alert_icon_shift = tank.alert_icon_shift,
		energy_per_hit_point = tank.energy_per_hit_point,
		resistances = tank.resistances,
		collision_box = {{-0.9, -1.5}, {0.9, 1.5}},
		selection_box = {{-0.9, -1.5}, {0.9, 1.5}},
		damaged_trigger_effect = hit_effects.entity(),
		drawing_box = {{-1.8, -1.8}, {1.8, 1.5}},
		braking_force = 10,
		burner = tank.burner,
		friction_force = 0.50,
		front_light = tank.light,
		weight = tank.weight,
		max_speed = 1,
		max_power = "600kW",
		reversing_power_modifier = 0.6,
		vertical_selection_shift = -0.5,
		air_resistance = 0.0075, -- this is a percentage of current speed that will be subtracted
		connection_distance = 2,
		joint_distance = 1.5,
		color = {r = 0.92, g = 0.07, b = 0, a = 0.5},
		pictures = {
			layers = {
				{
					priority = "low",
					width = 136,
					height = 106,
					shift = util.by_pixel(0, -16 + tank_shift_y),
					direction_count = 64,
					filenames = {
						"__rail-car__/graphics/entity/armoured-draisine/armoured-draisine-base-1.png",
						"__rail-car__/graphics/entity/armoured-draisine/armoured-draisine-base-2.png",
						"__rail-car__/graphics/entity/armoured-draisine/armoured-draisine-base-3.png",
						"__rail-car__/graphics/entity/armoured-draisine/armoured-draisine-base-4.png",
					},
					line_length = 1,
					lines_per_file = 16,
					hr_version = {
						priority = "low",
						width = 270,
            			height = 212,
						direction_count = 64,
						filenames = {
							"__rail-car__/graphics/entity/armoured-draisine/hr-armoured-draisine-base-1.png",
							"__rail-car__/graphics/entity/armoured-draisine/hr-armoured-draisine-base-2.png",
							"__rail-car__/graphics/entity/armoured-draisine/hr-armoured-draisine-base-3.png",
							"__rail-car__/graphics/entity/armoured-draisine/hr-armoured-draisine-base-4.png",
						},
						line_length = 1,
						lines_per_file = 16,
						shift = util.by_pixel(0, -16 + tank_shift_y),
						scale = 0.5
					}
				},
				{
					priority = "low",
					flags = { "mask" },
					width = 104,
					height = 83,
					direction_count = 64,
					filenames = {
						"__base__/graphics/entity/tank/tank-base-mask-1.png",
						"__base__/graphics/entity/tank/tank-base-mask-2.png",
						"__base__/graphics/entity/tank/tank-base-mask-3.png",
          			},
					line_length = 1,
					lines_per_file = 22,
					shift = util.by_pixel(0, -27.5 + tank_shift_y),
					apply_runtime_tint = true,
					hr_version = {
						priority = "low",
						flags = { "mask" },
						width = 208,
						height = 166,
						direction_count = 64,
						filenames = {
							"__base__/graphics/entity/tank/hr-tank-base-mask-1.png",
							"__base__/graphics/entity/tank/hr-tank-base-mask-2.png",
							"__base__/graphics/entity/tank/hr-tank-base-mask-3.png",
						},
						line_length = 1,
						lines_per_file = 22,
						shift = util.by_pixel(0, -27.5 + tank_shift_y),
						apply_runtime_tint = true,
						scale = 0.5
					}
				},
				{
					priority = "low",
					flags = { "shadow" },
					width = 151,
					height = 98,
					direction_count = 64,
					draw_as_shadow = true,
					filenames = {
						"__base__/graphics/entity/tank/tank-base-shadow-1.png",
						"__base__/graphics/entity/tank/tank-base-shadow-2.png",
						"__base__/graphics/entity/tank/tank-base-shadow-3.png",
						"__base__/graphics/entity/tank/tank-base-shadow-4.png",
					},
					line_length = 1,
					lines_per_file = 16,
					shift = util.by_pixel(22.5, 1 + tank_shift_y),
					hr_version = {
						priority = "low",
						flags = { "shadow" },
						width = 302,
						height = 194,
						direction_count = 64,
						filenames = {
							"__base__/graphics/entity/tank/hr-tank-base-shadow-1.png",
							"__base__/graphics/entity/tank/hr-tank-base-shadow-2.png",
							"__base__/graphics/entity/tank/hr-tank-base-shadow-3.png",
							"__base__/graphics/entity/tank/hr-tank-base-shadow-4.png",
						},
						line_length = 1,
						lines_per_file = 16,
						shift = util.by_pixel(22.5, 1 + tank_shift_y),
						apply_runtime_tint = true,
						scale = 0.5
					}
				}
			}
		},
		minimap_representation = {
			filename = "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-minimap-representation.png",
			flags = {"icon"},
			size = {20, 40},
			scale = 0.5
		},
		selected_minimap_representation = {
			filename = "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-selected-minimap-representation.png",
			flags = {"icon"},
			size = {20, 40},
			scale = 0.5
		},
		stop_trigger = {
			-- left side
			{
				type = "create-trivial-smoke",
				repeat_count = 125,
				smoke_name = "smoke-train-stop",
				initial_height = 0,
				-- smoke goes to the left
				speed = {-0.03, 0},
				speed_multiplier = 0.75,
				speed_multiplier_deviation = 1.1,
				offset_deviation = {{-0.75, -1.5}, {-0.3, 1.5}}
			},
			-- right side
			{
				type = "create-trivial-smoke",
				repeat_count = 125,
				smoke_name = "smoke-train-stop",
				initial_height = 0,
				-- smoke goes to the right
				speed = {0.03, 0},
				speed_multiplier = 0.75,
				speed_multiplier_deviation = 1.1,
				offset_deviation = {{0.3, -1.5}, {0.75, 1.5}}
			},
			{
				type = "play-sound",
				sound = sounds.train_brakes,
			},
			{
				type = "play-sound",
				sound = sounds.train_brake_screech,
			},
		},
		drive_over_tie_trigger = drive_over_tie(),
		vehicle_impact_sound = sounds.generic_impact,
		working_sound = tank.working_sound,
		open_sound = tank.open_sound,
		close_sound = tank.close_sound,
		sound_minimum_speed = 0.5,
		sound_scaling_ratio = 0.35,
		water_reflection = tank.water_reflection
	}
})