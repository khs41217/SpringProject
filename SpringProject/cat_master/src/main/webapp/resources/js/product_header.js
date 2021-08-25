  
        $(document).ready(function() {
            $('#p_category').hover(function() {
                $(this).css("background-color", "rgba(162, 0, 199, 1)");
                $('#p_category1').css("fill", "#FFF");
                $('#p_category2').css("fill", "#FFF");
                $('#p_category_list').css("display", "block");
            }, function() {
                $(this).css("background-color", "#FFF");
                $('#p_category1').css("fill", "#000");
                $('#p_category2').css("fill", "#000");
                $('#p_category_list').css("display", "none");
            });

            $('#p_category_list').hover(function() {
                $('#p_category').css("background-color", "rgba(162, 0, 199, 1)");
                $('#p_category1').css("fill", "#FFF");
                $('#p_category2').css("fill", "#FFF");
                $('#p_category_list').css("display", "block");
                $(".p_a2032").css("top", "80px");
                n=1;
            }, function() {
                $('#p_category').css("background-color", "#FFF");
                $('#p_category1').css("fill", "#000");
                $('#p_category2').css("fill", "#000");
                $('#p_category_list').css("display", "none");
                n=0;
            });
        });
    

    