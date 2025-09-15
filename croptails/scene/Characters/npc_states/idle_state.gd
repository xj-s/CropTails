
extends NodeState

@export var character: CharacterBody2D
@export var animated_sprite_2d : AnimatedSprite2D
@export var idle_state_time_interval : float = 2.0

@onready var idle_state_timer: Timer = Timer.new()

var  idle_state_timout : bool = false
func _ready() -> void:
	#设置等待时间
	idle_state_timer.wait_time = idle_state_time_interval
	idle_state_timer.timeout.connect(on_idle_state_timout)
	add_child(idle_state_timer)
func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	#一旦超时，转换状态
	if idle_state_timout:
		transition.emit("Walk")


func _on_enter() -> void:
	animated_sprite_2d.play("idle")
	
	#重置计时器并重启计时器
	idle_state_timout = false
	idle_state_timer.start()
func _on_exit() -> void:
	animated_sprite_2d.stop()
	#停止计时器
	idle_state_timer.stop()
	
func on_idle_state_timout() -> void:
	#超时后，修改idle_state_timout
	idle_state_timout = true
	
