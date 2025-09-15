
extends NodeState 
@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D
@export var speed:int = 50

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	#利用GameInputEvents脚本中得方法获取方向
	var direction: Vector2 = GameInputEvents.movement_input()
	
	#if-else逻辑判断方向来播放相应动画
	if direction == Vector2.UP:
		animated_sprite_2d.play("walk_back")
	elif direction == Vector2.DOWN:
		animated_sprite_2d.play("walk_front")
	elif direction == Vector2.LEFT:
		animated_sprite_2d.play("walk_left")
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play("walk_right")
	
	if direction != Vector2.ZERO:
		player.play_direction = direction
	
	player.velocity = direction * speed 
	player.move_and_slide()
	
func _on_next_transitions() -> void:
	#没有输出按键，转换状态为idle
	if !GameInputEvents.is_movement_input():
		transition.emit("idle")
func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
