local TimerManager = {}

function TimerManager.new()
  local timer = {}
  timer.current = 0
  timer.delay = 60
  timer.speed = 60
  
  function timer.update(dt)
    timer.current =  timer.current + (timer.speed * dt)
    if timer.current >= timer.delay then
      timer.current = 0
      return true
    end
    return false
  end
  
  return timer
end

return TimerManager