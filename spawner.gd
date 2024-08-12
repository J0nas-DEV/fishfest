extends Area2D
var enemy = preload("res://enemy.tscn")
@onready var timer: Timer = $Timer
func _process(_delta: float) -> void:
	if timer.is_stopped():
		timer.start()

func _on_timer_timeout() -> void:
	var new_enemy: Enemy = enemy.instantiate()
	new_enemy.global_position.x = global_position.x * randi_range(1,3)
	new_enemy.global_position.y = global_position.y * randi_range(0,3)
	new_enemy.scale.x = -1
	get_tree().current_scene.add_child(new_enemy)
