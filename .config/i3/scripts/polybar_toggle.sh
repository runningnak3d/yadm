polybar-msg -p $(ps -ef | grep polybar | grep bottom | grep -v xdo | awk '{print $2;}') cmd toggle
