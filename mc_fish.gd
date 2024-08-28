extends CharacterBody2D
const SPEED: float = 1500.0
var mouseposition: Vector2 = Vector2.ZERO
var flip: bool = false
@onready var sprite2d: Sprite2D = $Sprite2D
@onready var animation: AnimationPlayer = $AnimationPlayer
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			fire()
	elif event is InputEventMouseMotion:
		mouseposition = event.global_position
		global_position = mouseposition
		animation.play("swim")

func _physics_process(_delta: float) -> void:
	#global_position = global_position.move_toward(mouseposition, delta * SPEED)
	move_and_slide()

func fire() -> void:
	animation.play("fire")
	var bullet: Bullet = preload("res://bullet.tscn").instantiate()
	bullet.transform = global_transform
	if flip:
		bullet.global_position.x -= 125
		bullet.velocity = -bullet.transform.x * 700
	else:
		bullet.global_position.x += 125
		bullet.velocity = bullet.transform.x * 700
	get_tree().current_scene.add_child(bullet)
