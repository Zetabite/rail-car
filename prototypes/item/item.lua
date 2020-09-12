data:extend({
	{
		name = "rail-car",
		type = "item",
		icon = "__base__/graphics/icons/car.png",
		icon_size = 64,
		stack_size = 1,
		subgroup = "train-transport",
		place_result = "rail-car",
	},

	{
		type = "item-with-entity-data",
		name = "armoured-draisine-engine",
        flags = {"hidden"},
		icon = "__base__/graphics/icons/tank.png",
		icon_size = 64,
		stack_size = 1,
		subgroup = "train-transport",
		place_result = "armoured-draisine-engine",
	},
})