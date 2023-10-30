extends HSlider


var click_count := 0
var timer: Timer

func _ready() -> void:
	timer = $DoubleClick
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))


# Buggy
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("lmb"):
		match click_count:
			0:
				print_debug(click_count)
				timer.start()
				click_count = 1
			1:
				print_debug(click_count)
				timer.stop()
				click_count = 0
				set_value(0.0)
			_:
				print_debug(click_count)
				click_count = 0


func _on_timer_timeout() -> void:
	click_count = 0
