extends Node2D
class_name KeyObstacle

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var interacting: bool = false
var opened: bool = false

func _ready() -> void:
	$InteractArrow.visible = false

# If the player interacts with the key obstacle and they have
# at least one key to open the door with, unlock and remove the obstacle.
func _process(delta: float) -> void:
	if opened:
		return
	if (
		interacting
		and Input.is_action_just_pressed("interact")
		and GameManager.temp_keys > 0
		):
			interacting = false
			$InteractArrow.visible = false
			GameManager.temp_keys -= 1
			opened = true
			open()

func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$InteractArrow.visible = true
		interacting = true

func _on_detection_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		$InteractArrow.visible = false
		interacting = false

func open() -> void:
	animation_player.play("Open")
	AudioManager.play_key_open()
	await animation_player.animation_finished
	queue_free()
