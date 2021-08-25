		
        $(document).ready(function() {
            var scrollValue;      
            var product_detail = 0;
            var h;           
            var productInfo_y;
            var qa_y;
            var productReview_y;                                  
            var info_y;
                                   
            $(window).scroll(function () {
            	
            	h = $(window).innerHeight();
            	scrollValue = $(document).scrollTop();
            	productInfo_y = $("#productInfo").position().top;
            	qa_y = $("#qa").position().top;
            	productReview_y = $("#productReview").position().top;
            	info_y = $("#info").position().top;
            	
                if(scrollValue >= productInfo_y && scrollValue < qa_y){
                    $('#productTab1').css("color", "rgba(162, 0, 199, 1)");
                    $('#productTab2').css("color", "#000");
                    $('#productTab3').css("color", "#000");
                    $('#productTab4').css("color", "#000");
                    $('#tabUnderbar').css("left", "10px");
                }
                if(scrollValue >= qa_y && scrollValue < productReview_y){
                    $('#productTab2').css("color", "rgba(162, 0, 199, 1)");
                    $('#productTab1').css("color", "#000");
                    $('#productTab3').css("color", "#000");
                    $('#productTab4').css("color", "#000");
                    $('#tabUnderbar').css("left", "320px");
                }
                
                if(scrollValue >= productReview_y && scrollValue < info_y){
                    $('#productTab3').css("color", "rgba(162, 0, 199, 1)");
                    $('#productTab2').css("color", "#000");
                    $('#productTab1').css("color", "#000");
                    $('#productTab4').css("color", "#000");
                    $('#tabUnderbar').css("left", "640px");
                }
                if($(window).scrollTop() + $(window).height() == $(document).height()) {
                    $('#productTab4').css("color", "rgba(162, 0, 199, 1)");
                    $('#productTab2').css("color", "#000");
                    $('#productTab1').css("color", "#000");
                    $('#productTab3').css("color", "#000");
                    $('#tabUnderbar').css("left", "945px");
                }
                });

           
            $('#productTab1').click(function(){
                $(this).css("color", "rgba(162, 0, 199, 1)");
                $('#productTab2').css("color", "#000");
                $('#productTab3').css("color", "#000");
                $('#productTab4').css("color", "#000");
                $('#tabUnderbar').css("left", "10px");
            });

            $('#productTab2').click(function(){
                $(this).css("color", "rgba(162, 0, 199, 1)");
                $('#productTab1').css("color", "#000");
                $('#productTab3').css("color", "#000");
                $('#productTab4').css("color", "#000");
                $('#tabUnderbar').css("left", "320px");
            });

            $('#productTab3').click(function(){
                $(this).css("color", "rgba(162, 0, 199, 1)");
                $('#productTab2').css("color", "#000");
                $('#productTab1').css("color", "#000");
                $('#productTab4').css("color", "#000");
                $('#tabUnderbar').css("left", "640px");
            });

            $('#productTab4').click(function(){
                $(this).css("color", "rgba(162, 0, 199, 1)");
                $('#productTab2').css("color", "#000");
                $('#productTab3').css("color", "#000");
                $('#productTab1').css("color", "#000");
                $('#tabUnderbar').css("left", "945px");
            });

            $('#product_detail_button').click(function(){
                if(product_detail == 0){
                $('.jss364').css("max-height" , "none");
                $('#product_svg1').css("display" , "none");
                $('#product_svg2').css("display" , "block");
                $('#product_detail').html("상품 상세 접기");
                    product_detail = 1;
                }else{
                    $('.jss364').css("max-height" , "640px");
                    $('#product_svg1').css("display" , "block");
                    $('#product_svg2').css("display" , "none");
                    $('#product_detail').html("상품 상세 더보기");
                    product_detail = 0
                }
                
            });

            $('#productImg1').hover(function() {
                $(this).css("border", "1px solid rgba(162, 0, 199, 1)");
                var Img_scr1 = jQuery('#productImg1').attr("src"); /*이미지 소스 추출*/
                jQuery('#productImg').attr("src",Img_scr1);
            }, function() {
                $(this).css("border", "1px solid gray");
            });

            $('#productImg2').hover(function() {
                $(this).css("border", "1px solid rgba(162, 0, 199, 1)");
                var Img_scr2 = jQuery('#productImg2').attr("src");   
                jQuery('#productImg').attr("src",Img_scr2); 
            }, function() {
                $(this).css("border", "1px solid gray");
            });

            $('#productImg3').hover(function() {
                $(this).css("border", "1px solid rgba(162, 0, 199, 1)");
                var Img_scr3 = jQuery('#productImg3').attr("src");  
                jQuery('#productImg').attr("src",Img_scr3);  
            }, function() {
                $(this).css("border", "1px solid gray");
            });

            $('#productImg4').hover(function() {
                $(this).css("border", "1px solid rgba(162, 0, 199, 1)");
                var Img_scr4 = jQuery('#productImg4').attr("src");
                jQuery('#productImg').attr("src",Img_scr4);    
            }, function() {
                $(this).css("border", "1px solid gray");
            });

            $('#productImg5').hover(function() {
                $(this).css("border", "1px solid rgba(162, 0, 199, 1)");
                var Img_scr5 = jQuery('#productImg5').attr("src"); 
                jQuery('#productImg').attr("src",Img_scr5);   
            }, function() {
                $(this).css("border", "1px solid gray");
            });

            var product_dropdown = 0;
            $('#product_list1').click(function(){
                if(product_dropdown == 0){
                $(this).css("background" , "rgba(244, 244, 245, 1)");
                $('#product_dropdown').css("border" , "2px solid rgba(162, 0, 199, 1)");
                $('#product_dropdown').css("min-height" , "323px");
                $("#product_list2").css("display" , "block");
                $("#product_list3").css("display" , "block");
                $("#product_list4").css("display" , "block");
                $("#direction_svg").css("transform" , "rotate(180deg)");
                $("#direction_svg").css("background" , "rgba(244, 244, 245, 1)");
                    product_dropdown = 1;
                }else{
                    $(this).css("background" , "#fff");
                    $('#product_dropdown').css("border" , "1px solid rgba(207, 204, 204, 1)");
                    $('#product_dropdown').css("min-height" , "80px");
                    $("#product_list2").css("display" , "none");
                    $("#product_list3").css("display" , "none");
                    $("#product_list4").css("display" , "none");
                    $("#direction_svg").css("transform" , "rotate(0deg)");
                    $("#direction_svg").css("background" , "#fff");
                    product_dropdown = 0
                }
            });

            $('#product_list1').hover(function() {
                $(this).css("background", "rgba(244, 244, 245, 1)");
                $("#direction_svg").css("background" , "rgba(244, 244, 245, 1)");
            }, function() {
                $(this).css("background", "#FFF");
                $("#direction_svg").css("background" , "#fff");
            });

            $('#product_list2').hover(function() {
                $(this).css("background", "rgba(244, 244, 245, 1)");
            }, function() {
                $(this).css("background", "#FFF");
            });

            $('#product_list3').hover(function() {
                $(this).css("background", "rgba(244, 244, 245, 1)");
            }, function() {
                $(this).css("background", "#FFF");
            });

            $('#product_list4').hover(function() {
                $(this).css("background", "rgba(244, 244, 245, 1)");
            }, function() {
                $(this).css("background", "#FFF");
            });

            
            
            function priceToString(price) {
                return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
            }
            
            var price = $('#hiddenPrice').text();
//            $('price').text(priceToString($('price').text()));
//            $('price1').text(priceToString($('price1').text()));
                                                                  
            
            $('#down_button').click(function(){
                var amount = $('#amount').attr("value");
                if(amount > 1){
                    amount--;
                    $('#amount').attr("value",amount);
                    $('#amount').val(amount);
                    $('#amount1').attr("value",amount);
                    $('#amount1').val(amount);
                    $('#hiddenPrice').text(amount*price);
                    $('#price').text(priceToString(amount*price));
                    $('#price1').text(priceToString(amount*price));
                }else{
                    return;
                }
                
            });

            $('#up_button').click(function(){
                var amount = $('#amount').attr("value");
                if(amount < 99){
                    amount++;
                    $('#amount').attr("value",amount);
                    $('#amount').val(amount);
                    $('#amount1').attr("value",amount);
                    $('#amount1').val(amount);
                    $('#hiddenPrice').text(amount*price);
                    $('#price').text(priceToString(amount*price));
                    $('#price1').text(priceToString(amount*price));
                }else{
                    max_amount();
                    return;
                } 
            });


            $('#down_button1').click(function(){
                var amount = $('#amount1').attr("value");
                if(amount > 1){
                    amount--;
                    $('#amount').attr("value",amount);
                    $('#amount').val(amount);
                    $('#amount1').attr("value",amount);
                    $('#amount1').val(amount);
                    $('#hiddenPrice').text(amount*price);
                    $('#price').text(priceToString(amount*price));
                    $('#price1').text(priceToString(amount*price));
                }else{
                    return;
                }
                
            });

            $('#up_button1').click(function(){
                var amount = $('#amount1').attr("value");
                if(amount < 99){
                    amount++;
                    $('#amount').attr("value",amount);
                    $('#amount').val(amount);
                    $('#amount1').attr("value",amount);
                    $('#amount1').val(amount);
                    $('#hiddenPrice').text(amount*price);
                    $('#price').text(priceToString(amount*price));
                    $('#price1').text(priceToString(amount*price));
                }else{
                    max_amount();
                    return;
                }  
            });

            $('#amount').keyup(function(e){
                var amount = $('#amount').val();
                if(amount > 99){
                    amount = 99;
                    max_amount();
                }else if(amount < 1){
                    amount = 1;
                    min_amount();
                }
                $('#amount').attr("value",amount);
                $('#amount').val(amount);
                $('#amount1').attr("value",amount);
                $('#amount1').val(amount);
                $('#hiddenPrice').text(amount*price);
                $('#price').text(priceToString(amount*price));
                $('#price1').text(priceToString(amount*price));
                
            });
//
            $('#amount1').keyup(function(e){
                var amount = $('#amount1').val();
                if(amount > 99){
                    amount = 99;
                    max_amount();
                }else if(amount < 1){
                    amount = 1;
                    min_amount();
                }
                $('#amount').attr("value",amount);
                $('#amount').val(amount);
                $('#amount1').attr("value",amount);
                $('#amount1').val(amount);
                $('#hiddenPrice').text(amount*price);
                $('#price').text(priceToString(amount*price));
                $('#price1').text(priceToString(amount*price));
            });

            function max_amount(){
                $('#max_amount').css("display" , "");
            }

            function min_amount(){
                $('#min_amount').css("display" , "");
            }
            
           


            $('#max_amount_confirm_button').click(function(){
                $('#max_amount').css("display" , "none");
            })

            $('#min_amount_confirm_button').click(function(){
                $('#min_amount').css("display" , "none");
            })

            function insertCartBtn(){
            	$('#cart_in_alert').css("display" , "");
            }

//            $('#cart_in_button2').click(function(){
//                $('#cart_in_alert').css("display" , "");
//            })
            
            $('#cart_in_confirm_button').click(function(){
                $('#cart_in_alert').css("display" , "none");
            })

            /*더보기*/
            $('#close1').click(function(){
                $('#moreViewWindow1').css("display" , "none");
            })

            $('#moreView1').click(function(){
                $('#moreViewWindow1').css("display" , "");
            })

            $('#close2').click(function(){
                $('#moreViewWindow2').css("display" , "none");
            })

            $('#moreView2').click(function(){
                $('#moreViewWindow2').css("display" , "");
            })


            /*상품 상세페이지 아래 쪽 Bar */
            $(window).scroll(function () {
            scrollValue = $(document).scrollTop();
            if(scrollValue > 1000){
                $('#bottom_fixed').css("display" , "");
            }else{
                $('#bottom_fixed').css("display" , "none");
            }
            });                                   

        });
        

    

      
    
