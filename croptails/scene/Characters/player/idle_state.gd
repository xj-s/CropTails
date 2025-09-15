extends NodeState

@export var player :Player
@export var animated_sprite_2d: AnimatedSprite2D
var direction :Vector2

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	direction = GameInputEvents.movement_input()
	
	if player.play_direction == Vector2.UP:
		animated_sprite_2d.play("idle_back")
	elif player.play_direction == Vector2.DOWN:
		animated_sprite_2d.play("idle_front")
	elif player.play_direction == Vector2.RIGHT:
		animated_sprite_2d.play("idle_right")
	elif player.play_direction == Vector2.LEFT:
		animated_sprite_2d.play("idle_left")
	else :
		animated_sprite_2d.play("idle_front")

func _on_next_transitions() -> void:
	#首先读取按键输入
	GameInputEvents.movement_input()
	#获取到按键输入后转换状态到walk
	if GameInputEvents.movement_input():
		transition.emit("walk")
	if player.current_tool == DataTypes.Tools.AxeWood && GameInputEvents.use_tool():
		transition.emit("Chopping")
	if player.current_tool == DataTypes.Tools.TillGround && GameInputEvents.use_tool():
		transition.emit("Tilling")
	if player.current_tool == DataTypes.Tools.WaterCrops && GameInputEvents.use_tool():
		transition.emit("Watering")
func _on_enter() -> void:
	pass


func _on_exit() -> void:
	#退出状态后停止动画 
	animated_sprite_2d.stop()
