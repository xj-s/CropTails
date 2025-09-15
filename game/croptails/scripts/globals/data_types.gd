class_name DataTypes

enum Tools{
	None,         # 无工具：代表玩家手上没有选择任何工具的状态
	AxeWood,      # 木斧：用于砍树等
	TillGround,   # 锄头：用于耕地
	WaterCrops,   # 水壶：用于给作物浇水
	PlantCorn,    # 玉米种子：代表种植玉米这个动作或物品
	PlantTomato   # 番茄种子：代表种植番茄这个动作或物品 
}

# 定义了所有农作物的生长阶段
enum GrowthStates{
	Seed,         # 种子阶段：刚刚播种的状态
	Germination,  # 发芽阶段：种子开始发芽
	Vegetative,   # 营养生长阶段：植株长出茎和叶
	Reproduction, # 繁殖阶段：植株开花或开始结果
	Maturity,     # 成熟阶段：果实或作物已经成熟，可以收获
	Harvesting    # 收获阶段：作物等待被玩家收获的状态
}
