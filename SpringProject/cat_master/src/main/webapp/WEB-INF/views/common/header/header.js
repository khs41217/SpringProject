

    
    
        $(document).ready(function() {
            $('#category').hover(function() {
                $(this).css("background-color", "rgba(162, 0, 199, 1)");
                $('#category1').css("fill", "#FFF");
                $('#category2').css("fill", "#FFF");
                $('#category_list').css("display", "block");
            }, function() {
                $(this).css("background-color", "#FFF");
                $('#category1').css("fill", "#000");
                $('#category2').css("fill", "#000");
                $('#category_list').css("display", "none");
            });

            $('#category_list').hover(function() {
                $('#category').css("background-color", "rgba(162, 0, 199, 1)");
                $('#category1').css("fill", "#FFF");
                $('#category2').css("fill", "#FFF");
                $('#category_list').css("display", "block");
                $(".a2032").css("top", "80px");
                n=1;
            }, function() {
                $('#category').css("background-color", "#FFF");
                $('#category1').css("fill", "#000");
                $('#category2').css("fill", "#000");
                $('#category_list').css("display", "none");
                n=0;
            });
        });
    
        $(document).ready(function() {
            $('#header1').hover(function() {
              $(".a2032").css("top", "80px");
            }, function() {
                if(scrollValue > 0){
              $(".a2032").css("top", "-10px");
              $(".a2032").css("z-index", "10");
            }
            });
        });
        $(document).ready(function() {
            $('#header2').hover(function() {
              $(".a2032").css("top", "80px");
            }, function() {
                if(scrollValue > 0){
              $(".a2032").css("top", "-10px");
              $(".a2032").css("z-index", "10");
                }
            });
        });
    

        var n=0;
        var scrollValue;
        
        var lastScrollTop = 0,
        delta = 15;
        
        function setHeaderEvent() {
        	$(window).scroll(function () {
                scrollValue = $(document).scrollTop(); 
                });
            $(window).scroll(function() {
                var scrollTop = $(this).scrollTop() 
                if (Math.abs(lastScrollTop - scrollTop) <= delta) 
                    return; 

                if ((scrollTop > lastScrollTop) && (lastScrollTop > 0)) {
                    if(n==0){
                    $(".a2032").css("top", "-10px");
                    $(".a2032").css("z-index", "10");

                    }else{
                    
                    }
                } else {
                    $(".a2032").css("top", "80px");

                }
                lastScrollTop = scrollTop;
            });
        }
    