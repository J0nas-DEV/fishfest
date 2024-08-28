extends Node2D
var count = 0
@onready var winner: Label = $CanvasLayer/winner
@onready var lose: Label = $CanvasLayer/lose
@onready var count_label: Label = $CanvasLayer/count
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer
@onready var time: TimeScene = $CanvasLayer/time
func _on_meat_area_entered(area: Area2D) -> void:
	if area is Enemy:
		count += 1
		count_label.text = str("count : "+str(count))
	if count == 5:
		#get_tree().paused = true
		count_label.label_settings.font_color = Color.RED
		lose.visible = true
		animation.play("lose")
		timer.start()

func _on_timer_timeout() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	get_tree().change_scene_to_file("res://main_menu.tscn")
