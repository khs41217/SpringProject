document.addEventListener('DOMContentLoaded', () => {
    
        document.querySelectorAll('.a1116').forEach((button) => {

        button.addEventListener('mouseover', () => {
            button.style.color = 'rgba(117, 2, 143, 1)'
        })
        button.addEventListener('mouseout', () => {
            button.style.color = 'rgba(162, 0, 199, 1)'
        })

        button.addEventListener('mousedown', function (e) {
            
            const ripple = document.createElement("div")
            const rect = button.getBoundingClientRect()
            
            ripple.className = "animate",
            ripple.style.left = `${e.x - rect.left}px`,
            ripple.style.top = `${e.y - rect.top}px`,
            
            ripple.style.background = `#${button.dataset.color !== undefined ? button.dataset.color : "d6b4de"}`,
            ripple.style.setProperty("--material-scale", button.offsetWidth),
            button.append(ripple),
            setTimeout(function () {
                ripple.parentNode.removeChild(ripple)
            }, 500)
        })
    })

    document.querySelectorAll('.a1119').forEach((button) => {

        button.addEventListener('mouseover', () => {
            button.style.backgroundColor = 'rgba(117, 2, 143, 1)'
        })
        button.addEventListener('mouseout', () => {
            button.style.backgroundColor = 'rgba(162, 0, 199, 1)'
        })

        button.addEventListener('mousedown', function (e) {
            
            const ripple = document.createElement("div")
            const rect = button.getBoundingClientRect()
            
            ripple.className = "animate",
            ripple.style.left = `${e.x - rect.left}px`,
            ripple.style.top = `${e.y - rect.top}px`,
            
            ripple.style.background = `#${button.dataset.color !== undefined ? button.dataset.color : "9c49af"}`,
            ripple.style.setProperty("--material-scale", button.offsetWidth),
            button.append(ripple),
            setTimeout(function () {
                ripple.parentNode.removeChild(ripple)
            }, 500)
        })
    })
})