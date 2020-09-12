data:extend({
	{
		type = "recipe",
		name = "rail-car",
		--enabled = false,
		energy_required = 2,
		ingredients = {
			{"engine-unit", 8},
			{"iron-plate", 20},
			{"steel-plate", 5}
		},
		result = "rail-car"
	},

	{
		type = "recipe",
		name = "armoured-draisine-turret",
		--enabled = false,
		energy_required = 2,
		ingredients = {
			{"engine-unit", 32},
			{"steel-plate", 50},
			{"iron-gear-wheel", 15},
			{"advanced-circuit", 10}
		},
		result = "armoured-draisine-turret"
	}
})