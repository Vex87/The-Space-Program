return function(animator: instance, animation: instance): instance
    if animation then
        return animator:LoadAnimation(animation)
    end
end