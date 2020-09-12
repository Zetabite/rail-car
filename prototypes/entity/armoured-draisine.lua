local hit_effects = require ("__base__/prototypes/entity/demo-hit-effects")
local sounds = require("__base__/prototypes/entity/demo-sounds")
local tank = table.deepcopy(data.raw["car"]["tank"])
local burner = tank.burner
burner.smoke = {
	{
		name = "tank-smoke",
		deviation = {0.25, 0.25},
		frequency = 50,
		position = {-1, 2.5},
		starting_frame = 0,
		starting_frame_deviation = 60
	}
}

local engine = {
	type = "locomotive",
	name = "armoured-draisine-engine",
	icon = "__base__/graphics/icons/tank.png",
	icon_size = 64,
	flags = {"not-blueprintable", "placeable-neutral", "player-creation"},
	minable = nil,
	allow_copy_paste = false,
	alert_icon_shift = tank.alert_icon_shift,
	energy_per_hit_point = tank.energy_per_hit_point,
	resistances = tank.resistances,
	collision_box = {{-0.9, -0.75}, {0.9, 0.75}},
	selection_box = {{-0.9, -0.75}, {0.9, 0.75}},
	damaged_trigger_effect = hit_effects.entity(),
	braking_power = tank.braking_power,
	burner = burner,
	friction = tank.friction,
	front_light = tank.light,
	weight = tank.weight,
	max_health = tank.max_health * 0.5,
	max_speed = 1,
	max_power = "600kW",
	reversing_power_modifier = 0.6,
	vertical_selection_shift = -0.5,
	air_resistance = 0.0075, -- this is a percentage of current speed that will be subtracted
	connection_distance = 1,
	joint_distance = 1,
	color = {r = 0.92, g = 0.07, b = 0, a = 0.5},
	pictures = {
		layers = {
			{
				slice = 4,
				priority = "very-low",
				width = 3,
				height = 3,
				direction_count = 256,
				allow_low_quality_rotation = true,
				filenames = {
				  "__rail-car__/graphics/entity/blank.png",
				},
				line_length = 16,
				lines_per_file = 16,
				scale = 3,
				shift = {0.0, -0.7}
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
	drive_over_tie_trigger = drive_over_tie(),
	vehicle_impact_sound = sounds.generic_impact,
	working_sound = tank.working_sound,
	open_sound = tank.open_sound,
	close_sound = tank.close_sound,
	sound_minimum_speed = tank.sound_minimum_speed,
	sound_scaling_ratio = tank.sound_scaling_ratio
}

local turret = {
	type = "artillery-wagon",
	name = "armoured-draisine-turret",
	icon = "__base__/graphics/icons/tank.png",
	icon_size = 64,
	flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-on-map"},
	inventory_size = 1,
	ammo_stack_limit = 100,
	minable = {mining_time = 0.5, result = "armoured-draisine-turret"},
	mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
	max_health = tank.max_health * 0.5,
	corpse = tank.corpse,
	dying_explosion = tank.dying_explosion,
	collision_box = {{-0.9, -0.75}, {0.9, 0.75}},
	selection_box = {{-0.9, -0.75}, {0.9, 0.75}},
	damaged_trigger_effect = hit_effects.entity(),
	vertical_selection_shift = -0.796875,
	weight = tank.weight,
	max_speed = 1,
	braking_power = tank.braking_power,
	friction = tank.friction,
	air_resistance = 0.015,
	connection_distance = 1,
	joint_distance = 1,
	energy_per_hit_point = tank.energy_per_hit_point,
	---disable_automatic_firing = true,

	--cannon/turret definition
	gun = "tank-cannon",
	turret_rotation_speed = tank.turret_rotation_speed,
	turn_after_shooting_cooldown = tank.turret_return_timeout,
	--cannon_parking_frame_count = 8,
	--cannon_parking_speed = 0.25,
	manual_range_modifier = 1,

	resistances = tank.resistances,
	color = {r = 0.43, g = 0.23, b = 0, a = 0.5},
	pictures = {
		layers = {
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
					shift = util.by_pixel(0, -8.5),
					scale = 0.5
				}
			},
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
			}
		}
	},
	--[[
	cannon_barrel_pictures = {
		layers = {
			{
				priority = "very-low",
				width = 266,
				height = 192,
				direction_count = 256,
				line_length = 4,
				lines_per_file = 4,
				shift = util.by_pixel(0, -56),
				filenames = {
					"__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-1.png",
				},
				hr_version = {
					priority = "very-low",
					width = 530,
					height = 384,
					direction_count = 256,
					line_length = 4,
					lines_per_file = 4,
					shift = util.by_pixel(0, -56),
					scale = 0.5,
					filenames = {
						"__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-1.png",
					}
				}
			},
			{
				priority = "very-low",
				width = 454,
				height = 314,
				direction_count = 256,
				line_length = 4,
				lines_per_file = 4,
				shift = util.by_pixel(-3+58, 8+46),
				draw_as_shadow = true,
				filenames = {
					"__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-barrel-shadow-1.png",
				},
				hr_version =	{
					priority = "very-low",
					width = 906,
					height = 626,
					direction_count = 256,
					line_length = 4,
					lines_per_file = 4,
					shift = util.by_pixel(-3.5+58, 7.5+46),
					scale = 0.5,
					draw_as_shadow = true,
					filenames = {
						"__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-1.png",
					}
				}
			}
		}
	},
	cannon_base_pictures = {
		layers = {
			{
				priority = "very-low",
				width = 180,
				height = 136,
				direction_count = 256,
				line_length = 4,
				lines_per_file = 4,
				shift = util.by_pixel(0, -40),
				filenames = {
					"__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-1.png",
				},
				hr_version = {
					priority = "very-low",
					width = 358,
					height = 270,
					direction_count = 256,
					line_length = 4,
					lines_per_file = 4,
					shift = util.by_pixel(0, -40.5),
					scale = 0.5,
					filenames = {
						"__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-1.png",
					}
				}
			},
			{
				priority = "very-low",
				width = 238,
				height = 170,
				direction_count = 256,
				line_length = 4,
				lines_per_file = 4,
				shift = util.by_pixel(54+58, -1+46),
				draw_as_shadow = true,
				filenames = {
					"__base__/graphics/entity/artillery-wagon/artillery-wagon-cannon-base-shadow-1.png",
				},
				hr_version = {
					priority = "very-low",
					width = 476,
					height = 340,
					direction_count = 256,
					line_length = 4,
					lines_per_file = 4,
					shift = util.by_pixel(54.5+58, -1+46),
					scale = 0.5,
					draw_as_shadow = true,
					filenames = {
						"__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-1.png",
					}
				}
			}
		}
	},
	--]]
	drive_over_tie_trigger = drive_over_tie(),
	tie_distance = 10,
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
	crash_trigger = crash_trigger(),
	vehicle_impact_sound = sounds.generic_impact,
	working_sound = tank.working_sound,
	open_sound = tank.open_sound,
	close_sound = tank.close_sound,
	sound_minimum_speed = tank.sound_minimum_speed,
	sound_scaling_ratio = tank.sound_scaling_ratio,
	rotating_sound = { sound = { filename = "__base__/sound/fight/artillery-rotation-loop.ogg", volume = 0.2 }},
	rotating_stopped_sound = { filename = "__base__/sound/fight/artillery-rotation-stop.ogg" },
	water_reflection = tank.water_reflection
}

data:extend({
	engine,
	turret
})