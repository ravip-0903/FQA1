{** block-description:new_arrivals_categoryname_block **}

<div class="ml_pageheaderCateogry ml_pageheaderCateogry_new">
    <h1 class="ml_pageheaderCateogry_heading" style="width:810px;">
        <a id="desc">{$lang.new_arrivals_tm}</a>
            
            
    </h1>

  </div>  
<div class="bs_cntnr" id="bs_cntnr_new">
    <div class="bs_tm_left_arrow" id="bs_left_new"></div>
        <div class="bs_cntnr_ovr_blk" id="new_hr">
    </div>
     <div class="bs_tm_right_arrow" id="bs_right_new"></div>
</div>
{assign var="category_name_new_arrival" value=$smarty.request.category_id|fn_get_category_name}
{assign var="category_name_new_arrival" value=$category_name_new_arrival|replace:'"':''}
{assign var="category_name_new_arrival" value=$category_name_new_arrival|urlencode}
{literal}
<script>
    function addCarousel_new(){
        var sliderWidth = $("#new_hr .bs_cntnr_item").outerWidth();
        var slider = $('#bs_cntnr_new');
        var container = $('#new_hr');
        container.wrap( "<div class='carousel-wrap-small'></div>" );
        var sliderCount = $('.bs_cntnr_prd_name', slider).length;
        var delta = sliderCount * sliderWidth - slider.width();
        container.width((sliderCount * sliderWidth + 10));
        delta = (-1)*delta;
        var initialValue = container.position().left;

        $('#bs_left_new').click(function () {
            if(container.position().left< initialValue)
                container.animate({left: '+='+sliderWidth}, 100);
        });

        $('#bs_right_new').click(function () {
            if(container.position().left> delta+initialValue)
                container.animate({left: '-='+sliderWidth}, 100);
        });
    }
    $(document).ready(function(){

                {/literal}{if $product.product_id}{literal}var prod_id ={/literal} {$product.product_id};{else}{literal}var prod_id =" ";{/literal}{/if}{literal}
        var limit = {/literal}{$config.TM_limit}{literal};
        var cat_id = {/literal}{$smarty.request.category_id}{literal};
        var url = "http://api.targetingmantra.com/TMWidgets?w=na&mid=130915&pid="+prod_id+"&limit="+limit +"&json=true&catid={/literal}{$category_name_new_arrival}{literal}&callback=?";
        jQuery.getJSON(url,function(data){

                if(data.na && data.na.newArrivalItems && data.na.newArrivalItems.length != 0){
			
                var count=data.na.newArrivalItems.length;
			}

            if(!data.na || !data.na.newArrivalItems || data.na.newArrivalItems.length == 0 || count < limit){
                $(".ml_pageheaderCateogry_new").hide();
                $("#bs_cntnr_new").hide();
                $("#bs_left_new").hide();
                $("#bs_right_new").hide();
                
            }
            else{
                var widgetTitle = data.na.widgetTitle;
                $(".ml_pageheaderCateogry_new").show();
                $("#bs_cntnr_new").show();



                data.na.newArrivalItems.forEach(function(obj, index){
                    var prod_num=index+1;
                    var mrp = (function(){
                        if(parseFloat(obj.itemMRP) > parseFloat(obj.itemPrice)){
                            return parseFloat(obj.itemMRP).formatMoney(0,'.',',');
                        }
                        else{
                            return parseFloat(obj.itemPrice).formatMoney(0,'.',',');
                        }
                    })();
                    var img = document.createElement("img");
                    img.src = obj.itemImage;
                    img.setAttribute("width","160");
                    img = img.outerHTML;
                    var title = function(){if(obj.itemTitle.length >50){return obj.itemTitle.substr(0,46) + "...";}else{return obj.itemTitle;}};
                    var item = "<div class='bs_cntnr_item'><a onclick=\"_gaq.push(['_trackEvent', 'Category_new_arrivals', 'Click', 'Product_"+prod_num+"']);\" class='bs_cntnr_prd_name' href='"+ obj.itemURL +"'><div class='bs_cntnr_img'>"+img+"</div>" + "<span class='bs_prd_title_blk'>"+title()+"</span></a>"
                            +"<div id='new_hr_stars_"+index+"'></div><div class='bs_prc_out_blk'><span class='tm_mrp' id='new_hr_price_"+index+"' >MRP: Rs."+mrp+"</span><div class='bs_cntnr_prc_blk'><div class='bs_main_price'>Rs. " + parseFloat(obj.itemPrice).formatMoney(0,'.',',') +"</div></div></div></div>";

                    $("#new_hr").append(item);
                    if(parseInt(obj.itemRating) > 0){
                        $("#new_hr_stars_" + index).append("<span class='stars' id='new_hr_"+index+"'>"+obj.itemRating+"</span>");
                    }
                    $("#new_hr_" + index).makeStars();
                    if(parseFloat(obj.itemMRP) == parseFloat(obj.itemPrice)){
                        $("#new_hr_price_"+index).hide();
                    }
                });
                addCarousel_new();
            }

        });
    });
</script>
{/literal}
