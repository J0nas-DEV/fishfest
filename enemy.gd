class_name Enemy
extends Area2D
@onready var timer: Timer = $Timer
@onready var elliminated: Sprite2D = $elliminated
@onready var normal: Sprite2D = $normal
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer
@export var hitted: bool = false
func _ready() -> void:
	add_to_group("enemy")

func _process(_delta: float) -> void:
	global_position.x -= 5

func _on_timer_timeout() -> void:
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		audio.play()
		if not hitted:
			area.queue_free()
		normal.visible = false
		elliminated.visible = true
		timer.start(0.5)
