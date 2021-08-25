$(document).ready(function() {

    document.querySelectorAll('.jss1002').forEach(a => {
        a.addEventListener('mousedown', function (e) {
            
            const ripple = document.createElement("div")
            const rect = a.getBoundingClientRect()
            
            ripple.className = "animate",
            ripple.style.left = `${e.x - rect.left}px`,
            ripple.style.top = `${e.y - rect.top}px`,
            
            ripple.style.background = `#${a.dataset.color !== undefined ? a.dataset.color : "bdc3c7"}`,
            ripple.style.setProperty("--material-scale", a.offsetWidth),
            a.append(ripple),
            setTimeout(function () {
                ripple.parentNode.removeChild(ripple)
            }, 500)
        })
    })

    document.querySelectorAll('.jss1007').forEach((button) => {
       button.addEventListener('mouseover', () => {
        let buttonChild = button.children
        
        buttonChild[0].style.color = 'rgba(162, 0, 199, 0.7)'
       })

       button.addEventListener('mouseout', () => {
        let buttonChild = button.children
        
        buttonChild[0].style.color = 'rgba(60, 60, 67, 0.6)'
       })
    })

})

function setBtnEvent() {
	document.querySelectorAll('.buttonG').forEach(button => {
        button.addEventListener('mouseover', () => {
            button.style.backgroundColor = 'rgba(224, 224, 224, 1)'
        })
        button.addEventListener('mouseout', () => {
            button.style.backgroundColor = 'rgba(244, 244, 245, 1)'
        })

        button.addEventListener('mousedown', function (e) {
            
            const ripple = document.createElement("div")
            const rect = button.getBoundingClientRect()
            
            ripple.className = "animate",
            ripple.style.left = `${e.x - rect.left}px`,
            ripple.style.top = `${e.y - rect.top}px`,
            
            ripple.style.background = `#${button.dataset.color !== undefined ? button.dataset.color : "c6c6c7"}`,
            ripple.style.setProperty("--material-scale", button.offsetWidth),
            button.append(ripple),
            setTimeout(function () {
                ripple.parentNode.removeChild(ripple)
            }, 500)
        })
    })

    document.querySelectorAll('.buttonP').forEach(button => {
        button.addEventListener('mouseover', () => {
            button.style.backgroundColor = 'rgba(241, 215, 247, 1)'
        })
        button.addEventListener('mouseout', () => {
            button.style.backgroundColor = 'rgba(248, 235, 251, 1)'
        })

        button.addEventListener('mousedown', function (e) {
            
            const ripple = document.createElement("div")
            const rect = button.getBoundingClientRect()
            
            ripple.className = "animate",
            ripple.style.left = `${e.x - rect.left}px`,
            ripple.style.top = `${e.y - rect.top}px`,
            
            ripple.style.background = `#${button.dataset.color !== undefined ? button.dataset.color : "d997e8"}`,
            ripple.style.setProperty("--material-scale", button.offsetWidth),
            button.append(ripple),
            setTimeout(function () {
                ripple.parentNode.removeChild(ripple)
            }, 500)
        })
    })
}