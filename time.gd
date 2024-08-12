class_name TimeScene
extends Label
@export var time: int = 500
@onready var timer: Timer
func _ready() -> void:
	timer = Timer.new()
	timer.autostart = true
	timer.wait_time = time
	timer.one_shot = true
	timer.timeout.connect(stop_timer)
	add_child(timer)

func _process(_delta: float) -> void:
	text = str(int(timer.time_left))

func stop_timer() -> void:
	get_parent().get_parent().winner.visible = true
	get_parent().get_parent().animation.play("lose")
	await get_tree().create_timer(2).timeout
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	get_tree().change_scene_to_file("res://main_menu.tscn")
