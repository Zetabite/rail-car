local hit_effects = require ("__base__/prototypes/entity/demo-hit-effects")
local sounds = require("__base__/prototypes/entity/demo-sounds")
local car = data.raw["car"]["car"]

data:extend({
	{
		type = "locomotive",
		name = "rail-car",
		icon = "__base__/graphics/icons/car.png",
    	icon_size = 64,
		flags = car.flags,
		minable = {mining_time = 0.5, result = "rail-car"},
		mined_sound = car.mined_sound,
		max_health = car.max_health,
		corpse = car.corpse,
		dying_explosion = car.dying_explosion,
		alert_icon_shift = car.alert_icon_shift,
		energy_per_hit_point = car.energy_per_hit_point,
		resistances = car.resistances,
		collision_box = {{-0.6, -1.5}, {0.6, 1.5}},
    	selection_box = {{-1, -1.5}, {1, 1.5}},
		damaged_trigger_effect = hit_effects.entity(),
		braking_force = 10,
		burner = car.burner,
		friction_force = 0.50,
		front_light = car.light,
		weight = car.weight + 200,
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
					width = 100,
					height = 86,
					--shift = {0, -0.1875},
					direction_count = 64,
					filenames = {
						"__rail-car__/graphics/entity/rail-car/rail-car-1.png",
						"__rail-car__/graphics/entity/rail-car/rail-car-2.png"
					},
					line_length = 1,
					lines_per_file = 32,
					hr_version = {
						priority = "low",
						width = 201,
            			height = 172,
						direction_count = 64,
						filenames = {
							"__rail-car__/graphics/entity/rail-car/hr-rail-car-1.png",
							"__rail-car__/graphics/entity/rail-car/hr-rail-car-2.png",
							"__rail-car__/graphics/entity/rail-car/hr-rail-car-3.png",
							"__rail-car__/graphics/entity/rail-car/hr-rail-car-4.png",
							"__rail-car__/graphics/entity/rail-car/hr-rail-car-5.png",
							"__rail-car__/graphics/entity/rail-car/hr-rail-car-6.png",
							"__rail-car__/graphics/entity/rail-car/hr-rail-car-7.png",
							"__rail-car__/graphics/entity/rail-car/hr-rail-car-8.png"
						},
						line_length = 1,
						lines_per_file = 8,
						--shift = util.by_pixel(0+2, -11.5+8.5),
						scale = 0.5
					}
				},
				{
					priority = "low",
					flags = { "mask" },
					width = 99,
					height = 73,
					direction_count = 64,
					filenames = {
						"__rail-car__/graphics/entity/rail-car/rail-car-mask-1.png",
						"__rail-car__/graphics/entity/rail-car/rail-car-mask-2.png"
					},
					line_length = 1,
					lines_per_file = 32,
					--shift = {0, -0.171875},
					apply_runtime_tint = true,
					hr_version = {
						priority = "low",
						flags = { "mask" },
						width = 199,
            			height = 147,
						direction_count = 64,
						filenames = {
							"__rail-car__/graphics/entity/rail-car/hr-rail-car-mask-1.png",
							"__rail-car__/graphics/entity/rail-car/hr-rail-car-mask-2.png",
							"__rail-car__/graphics/entity/rail-car/hr-rail-car-mask-3.png",
							"__rail-car__/graphics/entity/rail-car/hr-rail-car-mask-4.png"
						},
						line_length = 1,
						lines_per_file = 16,
						--shift = util.by_pixel(0+2, -11+8.5),
						apply_runtime_tint = true,
						scale = 0.5
					}
				},
				{
					priority = "low",
					flags = { "shadow" },
					width = 114,
          			height = 76,
					direction_count = 64,
					draw_as_shadow = true,
					filenames = {
						"__rail-car__/graphics/entity/rail-car/rail-car-shadow-1.png",
						"__rail-car__/graphics/entity/rail-car/rail-car-shadow-2.png",
						"__rail-car__/graphics/entity/rail-car/rail-car-shadow-3.png",
						"__rail-car__/graphics/entity/rail-car/rail-car-shadow-4.png"
					},
					line_length = 1,
					lines_per_file = 16,
					shift = {0.28125, 0.25},
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
		working_sound = car.working_sound,
		open_sound = car.open_sound,
		close_sound = car.close_sound,
		sound_minimum_speed = 0.5,
		sound_scaling_ratio = 0.35,
		water_reflection = car.water_reflection
	}
})