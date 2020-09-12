local hit_effects = require ("__base__/prototypes/entity/demo-hit-effects")
local sounds = require("__base__/prototypes/entity/demo-sounds")
local draisine_wheels = {
	priority = "very-low",
	width = 114,
	height = 113,
	direction_count = 64,
	filenames = {
		"__rail-car__/graphics/entity/armoured-draisine/armoured-draisine-wheels-1.png",
		"__rail-car__/graphics/entity/armoured-draisine/armoured-draisine-wheels-2.png",
		"__rail-car__/graphics/entity/armoured-draisine/armoured-draisine-wheels-3.png",
		"__rail-car__/graphics/entity/armoured-draisine/armoured-draisine-wheels-4.png",
	},
	line_length = 1,
	lines_per_file = 16,
	hr_version =  {
		priority = "very-low",
		width = 229,
		height = 227,
		direction_count = 64,
		filenames = {
			"__rail-car__/graphics/entity/armoured-draisine/hr-armoured-draisine-wheels-1.png",
			"__rail-car__/graphics/entity/armoured-draisine/hr-armoured-draisine-wheels-2.png",
			"__rail-car__/graphics/entity/armoured-draisine/hr-armoured-draisine-wheels-3.png",
			"__rail-car__/graphics/entity/armoured-draisine/hr-armoured-draisine-wheels-4.png",
		},
		line_length = 1,
		lines_per_file = 16,
		--shift = {0.015625, -0.453125}, original shifting from spritesheeter (likely needs doubling or halving)
		scale = 0.5
	}
}
local tank = table.deepcopy(data.raw["car"]["tank"])
local locomotive = table.deepcopy(data.raw["locomotive"]["locomotive"])

local engine = {
	type = "locomotive",
	name = "armoured-draisine-engine",
	icon = tank.icon,
	icon_size = tank.icon_size,
	flags = tank.flags,
	minable = {mining_time = 0.5, result = "armoured-draisine-engine"},
	mined_sound = tank.mined_sound,
	alert_icon_shift = tank.alert_icon_shift,
	energy_per_hit_point = tank.energy_per_hit_point,
	resistances = tank.resistances,
	corpse = tank.corpse,
	dying_explosion = tank.dying_explosion,
	tie_distance = 10,
	crash_trigger = crash_trigger(),
	collision_box = {{-0.9, -1.3}, {0.9, 1.3}},
    selection_box = {{-0.9, -1.3}, {0.9, 1.3}},
	damaged_trigger_effect = hit_effects.entity(),
	braking_power = tank.braking_power,
	burner = tank.burner,
	friction = tank.friction,
	front_light = tank.light,
	weight = tank.weight,
	max_health = tank.max_health,
	max_speed = 1,
	max_power = tank.consumption,
	reversing_power_modifier = 0.6,
	vertical_selection_shift = -0.5,
	air_resistance = 0.0075, -- this is a percentage of current speed that will be subtracted
	connection_distance = 1,
	joint_distance = 1,
	color = {r = 0.92, g = 0.07, b = 0, a = 0.5},
	pictures = {
		layers = {
			--[[
			--wheels
			{
				priority = "low",
				width = 114,
				height = 113,
				shift = util.by_pixel(0, -8),
				direction_count = 64,
				filenames = {
					"__rail-car__/graphics/entity/armoured-draisine/armoured-draisine-wheels-1.png",
					"__rail-car__/graphics/entity/armoured-draisine/armoured-draisine-wheels-2.png",
					"__rail-car__/graphics/entity/armoured-draisine/armoured-draisine-wheels-3.png",
					"__rail-car__/graphics/entity/armoured-draisine/armoured-draisine-wheels-4.png",
				},
				line_length = 1,
				lines_per_file = 16,
				hr_version = {
					priority = "low",
					width = 229,
					height = 227,
					direction_count = 64,
					filenames = {
						"__rail-car__/graphics/entity/armoured-draisine/hr-armoured-draisine-wheels-1.png",
						"__rail-car__/graphics/entity/armoured-draisine/hr-armoured-draisine-wheels-2.png",
						"__rail-car__/graphics/entity/armoured-draisine/hr-armoured-draisine-wheels-3.png",
						"__rail-car__/graphics/entity/armoured-draisine/hr-armoured-draisine-wheels-4.png",
					},
					line_length = 1,
					lines_per_file = 16,
					shift = util.by_pixel(0, -8),
					scale = 0.5
				}
			},
			--]]
			--base
			{
				priority = "low",
				width = 135,
				height = 106,
				shift = util.by_pixel(0, -16),
				direction_count = 64,
				filenames = {
					"__rail-car__/graphics/entity/armoured-draisine/armoured-draisine-base-1-alt.png",
					"__rail-car__/graphics/entity/armoured-draisine/armoured-draisine-base-2-alt.png",
					"__rail-car__/graphics/entity/armoured-draisine/armoured-draisine-base-3-alt.png",
					"__rail-car__/graphics/entity/armoured-draisine/armoured-draisine-base-4-alt.png",
				},
				line_length = 1,
				lines_per_file = 16,
				hr_version = {
					priority = "low",
					width = 270,
					height = 212,
					direction_count = 64,
					filenames = {
						"__rail-car__/graphics/entity/armoured-draisine/hr-armoured-draisine-base-1-alt.png",
						"__rail-car__/graphics/entity/armoured-draisine/hr-armoured-draisine-base-2-alt.png",
						"__rail-car__/graphics/entity/armoured-draisine/hr-armoured-draisine-base-3-alt.png",
						"__rail-car__/graphics/entity/armoured-draisine/hr-armoured-draisine-base-4-alt.png",
					},
					line_length = 1,
					lines_per_file = 16,
					shift = util.by_pixel(0, -16),
					scale = 0.5
				}
			},
			--base mask
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
				shift = util.by_pixel(0, -27.5),
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
					shift = util.by_pixel(0, -27.5),
					apply_runtime_tint = true,
					scale = 0.5
				}
			},
			--turret
			{
				priority = "low",
				width = 90,
				height = 67,
				shift = util.by_pixel(2-2, -40.5),
				direction_count = 64,
				filenames = {
					"__base__/graphics/entity/tank/tank-turret.png",
				},
				line_length = 8,
				lines_per_file = 8,
				hr_version = {
					priority = "low",
					width = 179,
					height = 132,
					direction_count = 64,
					filenames = {
						"__base__/graphics/entity/tank/hr-tank-turret.png",
					},
					line_length = 8,
					lines_per_file = 8,
					shift = util.by_pixel(2.25-2, -40.5),
					scale = 0.5
				}
			},
			--turret mask
			{
				priority = "low",
				flags = { "mask" },
				width = 36,
				height = 33,
				direction_count = 64,
				filenames = {
					"__base__/graphics/entity/tank/tank-turret-mask.png",
				},
				line_length = 8,
				lines_per_file = 8,
				shift = util.by_pixel(2-2, -41.5),
				apply_runtime_tint = true,
				hr_version = {
					priority = "low",
					flags = { "mask" },
					width = 72,
					height = 66,
					direction_count = 64,
					filenames = {
						"__base__/graphics/entity/tank/hr-tank-turret-mask.png",
					},
					line_length = 8,
					lines_per_file = 8,
					shift = util.by_pixel(2-2, -41.5),
					apply_runtime_tint = true,
					scale = 0.5
				}
			},
			--base shadow
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
				shift = util.by_pixel(22.5, 1),
				hr_version = {
					priority = "low",
					flags = { "shadow" },
					width = 302,
					height = 194,
					direction_count = 64,
					draw_as_shadow = true,
					filenames = {
						"__base__/graphics/entity/tank/hr-tank-base-shadow-1.png",
						"__base__/graphics/entity/tank/hr-tank-base-shadow-2.png",
						"__base__/graphics/entity/tank/hr-tank-base-shadow-3.png",
						"__base__/graphics/entity/tank/hr-tank-base-shadow-4.png",
					},
					line_length = 1,
					lines_per_file = 16,
					shift = util.by_pixel(22.5, 1),
					scale = 0.5
				}
			},
			--turret shadow
			{
				priority = "low",
				flags = { "shadow" },
				width = 97,
				height = 67,
				direction_count = 64,
				draw_as_shadow = true,
				filenames = {
					"__base__/graphics/entity/tank/tank-turret-shadow.png",
				},
				line_length = 8,
				lines_per_file = 8,
				shift = util.by_pixel(58.5-2, 0.5),
				hr_version = {
					priority = "low",
					flags = { "shadow" },
					width = 193,
					height = 134,
					direction_count = 64,
					draw_as_shadow = true,
					filenames = {
						"__base__/graphics/entity/tank/hr-tank-turret-shadow.png",
					},
					line_length = 8,
					lines_per_file = 8,
					shift = util.by_pixel(58.25-2, 0.5),
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
	wheels = draisine_wheels,
	drive_over_tie_trigger = locomotive.drive_over_tie_trigger,
	vehicle_impact_sound = sounds.generic_impact,
	working_sound = tank.working_sound,
	open_sound = tank.open_sound,
	close_sound = tank.close_sound,
	sound_minimum_speed = tank.sound_minimum_speed,
	sound_scaling_ratio = tank.sound_scaling_ratio,
	water_reflection = tank.water_reflection,
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
}

data:extend({
	engine
})