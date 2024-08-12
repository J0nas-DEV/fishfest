class_name Bullet
extends Area2D
var velocity: Vector2 = Vector2.ZERO
func _ready() -> void:
	add_to_group("bullet")

func _process(delta: float) -> void:
	global_position = transform.origin + velocity.normalized()
	transform.origin += velocity * delta

func _on_timer_timeout() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if !body.name.contains("mc"):
		pass

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		area.hitted = true
