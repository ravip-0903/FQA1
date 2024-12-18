{* $Id: grid_list.tpl 11191 2010-11-11 11:56:01Z klerik $ *}
{** block-description:clues_home_page_4x1 **}
<div class="box_manualdeals grid_4x1" style="width:100%;">
<!--Product slider -->

{assign var="flag" value=0}
<div class="slider_manualdeals">
    <ul class="jcarousel-skin-tango">

		{foreach from=$items key="key" item="product" name="productlisting"}
                    {if (isset($key))}
                      {assign var="flag" value=$flag+1}
                      {if $flag < '5'}



			<li class="slider_block {if $flag % 4=='0'}last_prd_img{/if}" style="{if $block.properties.number_of_products_to_show == "3"} margin-right:47px; {/if}  style="{if $block.properties.number_of_products_to_show == "3"} margin-right:47px; {/if}
            {if $smarty.foreach.productlisting.iteration == $smarty.foreach.productlisting.last} border-right:none; {/if}">
            	<div class="box_GridProduct" style="margin-left:0px; margin-top:15px;">
                    {if $config.quick_view_show}
                        <div id="prod{$product.product_id}" rev="index.php?dispatch=product_quick_view.view&product_id={$product.product_id}" onclick="quick_view_click({$product.product_id});" class="ql_icon_blk"></div>
                    {/if}
				{assign var="is_new" value=$product|check_product_for_new}
			   {if $is_new == 'new'}
				<div class="box_GridProduct_newlabel">{$lang.ngo_popup_hover}</div>
			   {/if}
				{assign var="is_ngo" value="$product.company_id|fn_check_merchant_for_ngo"}
			   {if $is_ngo == 'Y'}
				<div class="box_GridProduct_ngolabel">{$lang.ngo_popup_hover}</div>
			   {/if}

            {assign var="after_apply_promotion" value=0}
            {if $product.promotion_id !=0}
                 {assign var="after_apply_promotion" value=$product|fn_get_3rd_price}
            {/if}
             <!--Modified by clues dev-->
            {if $product.discount || $product.list_discount_prc || ($after_apply_promotion!=0)}
                {if $product.discount}
                  {assign var="disc_perc" value=$product.discount_prc}
                {else}
                  {assign var="disc_perc" value=$product.list_discount_prc}
                {/if}


                {if $product.promotion_id !=0}

                    {if $after_apply_promotion !=0}
                        {assign var="disc_perc" value=$product|calculate_3rd_price_percentage:$after_apply_promotion}
                    {/if}
                {/if}



		{if $after_apply_promotion !=0}
			{if $product.deal_inside_badge ==1}
				<a href="{"products.view?product_id=`$product.product_id`"|fn_url}"><img src="{$config.deal_inside_badge_url}" /></a>
			{/if}
		{/if}

		{if $after_apply_promotion !=0}
			{if $product.special_offer_badge ==1}
				<a href="{"products.view?product_id=`$product.product_id`"|fn_url}"><img src="{$config.special_offer_badge_url}" /></a>
			{/if}
		{/if}




                {if $disc_perc>=50}
                  {assign var="styles" value="label_discount_grid_first"}
                {elseif $disc_perc>=0 and $disc_perc<=49}
                  {assign var="styles" value="label_discount_grid_second"}
                {/if}



                <div id="line_prc_discount_value_{$obj_prefix}{$product.product_id}" class="box_GridProduct_discountlabel {if $after_apply_promotion !=0} third_price_discount {/if} {if !$config.fb_user_engagement && $product.product_amount_available == 0}sold_out_category{/if}">
                <span id="prc_discount_value_label_{$obj_prefix}{$product.product_id}" style="float:left; margin-top:5px; margin-left:3px; width:90%; text-align:center;">{$disc_perc}%</span>
                <span style="float:left; font:bold 11px arial; margin-top:-4px; margin-left:10px;">Off</span>
                </div>

               {/if}




		{assign var="image_cat_id" value=$product.category_ids|fn_get_category_image}
		{assign var="image_cat" value="-"|explode:$image_cat_id}
			{if $image_cat.1}
				{if $image_cat.0 > 0}
				<div class="cate_icon" id="cate_icon">
				<img src="{$image_cat.1}">
			  	<div class="label_cate_image" style="display:none;">{$lang.cate_image_hover}</div> </div>
				{/if}
			{/if}

      {if $config.fb_user_engagement}
      {* code for New style for sold out, wishlist and google and facebook share *}
      <div class="box_GridProduct_wishList">
        {if $product.product_amount_available =='0'}
        <div class="top">{$lang.sold_out_feature}</div>
        {/if}
        <div class="middle">
          {* code for facebook share, google share and wishlist *}

          {include file="common_templates/product_data.tpl" obj_prefix='' hide_enctype=true}
          {assign var="form_open" value="form_open_`$product.product_id`"}
          {$smarty.capture.$form_open}
          <span class="nl_add_wish_list" id="cart_buttons_block_{$product.product_id}">
            {include file="addons/wishlist/views/wishlist/components/add_to_wishlist.tpl" but_id="button_wishlist_`$product.product_id`" but_name="dispatch[wishlist.add..`$product.product_id`]" but_role="text"}
          </span>
          {assign var="form_close" value="form_close_`$product.product_id`"}
          {$smarty.capture.$form_close}
          <a  class="googleShare" onclick="googleShare({$product.product_id})"></a>
          <a  class="facebookShare" onclick="fbShare({$product.product_id})"></a>

          {* code for facebook share, google share and wishlist ends here*}
        </div>
        <div class="bottom"></div>
      </div>
      {* code for New style for sold out, wishlist and google and facebook share ends here *}
      {else}
      {if $product.product_amount_available =='0'}<div class="sold_out_text_pic home_page_sold_out">{$lang.sold_out_feature}</div>{/if}
      {/if}
       		<a href="{"products.view?product_id=`$product.product_id`"|fn_url}" id ="{$product.product_id}" class="box_GridProduct_product {if !$config.fb_user_engagement && $product.product_amount_available == 0}sold_out_category{/if}"  onClick="_gaq.push(['_trackEvent', 'Homepage', 'Click', '{$block.description|replace:" ":"_"}_{$smarty.foreach.productlisting.iteration}']);">
				 {assign var="pro_images" value=$product.product_id|fn_get_image_pairs:'product':'M'}
		{include file="common_templates/image.tpl" image_width="160" image_height="160" obj_id=$obj_id_prefix images=$pro_images object_type="product" show_thumbnail="Y"}
				</a>
				<a href="{"products.view?product_id=`$product.product_id`"|fn_url}" class="box_GridProduct_link" alt="{$product.product}" title="{$product.product}"   onClick="_gaq.push(['_trackEvent', 'Homepage', 'Click', '{$block.description|replace:" ":"_"}_{$smarty.foreach.productlisting.iteration}']);">{$product.product|truncate:50:"...."}</a>



                <div class="box_GridProduct_starrating">
                {assign var="average_rating" value=$product.product_id|fn_get_average_rating:'P'}

                    {if $average_rating}
                        {include file="addons/discussion/views/discussion/components/top_banner_stars.tpl" stars=$average_rating|fn_get_discussion_rating}
                    {/if}
                </div>

				<div class="box_GridProduct_pricing">
				{if $product.list_price > $product.price}
				<span class="box_GridProduct_price">{$product.list_price|format_price:$currencies.$secondary_currency:""}</span>
				{/if}

		{assign var="after_apply_promotion" value=0}
		{assign var="price_see_inside" value=0}
		{if $product.promotion_id !=0}
			{assign var="after_apply_promotion" value=$product|fn_get_3rd_price}
		{/if}

			{if $after_apply_promotion !=0}

                <span class="box_GridProduct_price">{$product.price|format_price:$currencies.$secondary_currency:""}</span>

				{if $product.price_see_inside ==0}
					<span class="box_GridProduct_priceoffer">{$after_apply_promotion|format_price:$currencies.$secondary_currency:""}</span>

				{else}
					<span class="home_blue_deal_nl"><a style="color:#fff!important;" href="{"products.view?product_id=`$product.product_id`"|fn_url}"  onClick="_gaq.push(['_trackEvent', 'Homepage', 'Click', '{$block.description|replace:" ":"_"}_{$smarty.foreach.productlisting.iteration}']);">{$lang.click_to_see_inside}</a></span>
				{/if}

			{else}

				<span class="box_GridProduct_priceoffer">{$product.price|format_price:$currencies.$secondary_currency:""}</span>
                 {if $product.price_see_inside =="1" && (isset($product.special_offer_text) && !empty($product.special_offer_text)) }
    <span class="home_blue_deal_nl"><a style="color:#fff!important;" href="{"products.view?product_id=`$product.product_id`"|fn_url}"  onClick="_gaq.push(['_trackEvent', 'Homepage', 'Click', '{$block.description|replace:" ":"_"}_{$smarty.foreach.productlisting.iteration}']);">{$lang.click_to_see_inside}</a></span>
    			{/if}
			{/if}

                            {if $product.freebee_inside =="1"}
                             <a class="home_free_gft_nl" href="{"products.view?product_id=`$product.product_id`"|fn_url}" onClick="_gaq.push(['_trackEvent', 'Homepage', 'Click', '{$block.description|replace:" ":"_"}_{$smarty.foreach.topproductlisting.iteration}']);"><img src="{$config.freebee_inside_image_url}" /></a>
                            {/if}

                            {if $product.deal_inside_badge =="1"}
                              <a class="home_deal_inside_nl" href="{"products.view?product_id=`$product.product_id`"|fn_url}" onClick="_gaq.push(['_trackEvent', 'Homepage', 'Click', '{$block.description|replace:" ":"_"}_{$smarty.foreach.topproductlisting.iteration}']);"><img src="{$config.cashback_inside_image_url}" /></a>
                            {/if}

                            {if $product.special_offer_badge =="1" || (isset($product.special_offer_text) && !empty($product.special_offer_text) && $product.price_see_inside !="1") }
                             <span  class="nl_red_icon_spl_offer_tag home_deals_org_txt"><a class="nl_prc_red_icon_spl" href="{"products.view?product_id=`$product.product_id`"|fn_url}" onClick="_gaq.push(['_trackEvent', 'Homepage', 'Click', '{$block.description|replace:" ":"_"}_{$smarty.foreach.topproductlisting.iteration}']);">{$lang.see_special_offer_inside}</a></span>

                             {elseif $product.price_see_inside =="1" && $product.special_offer_badge =="1" }
    <span  class="nl_red_icon_spl_offer_tag home_deals_org_txt"><a class="nl_prc_red_icon_spl" href="{"products.view?product_id=`$product.product_id`"|fn_url}" onClick="_gaq.push(['_trackEvent', 'Homepage', 'Click', '{$block.description|replace:" ":"_"}_{$smarty.foreach.topproductlisting.iteration}']);">{$lang.see_special_offer_inside}</a></span>

                            {/if}

				</div>
			    </div>
			</li>
                        {/if}
                        {/if}
		{/foreach}
    </ul>
	<div class="clearboth height_ten"></div>
</div>

</div>
{literal}
<script>
     var prod="";
     function fn_update_quick_look(product_id)
     {
      var url="{/literal}{$config.current_url}{literal}";      
      $("div").removeClass( "product-notification" );
      document.getElementById('product_quick_redirect').value=url;
      $(".popupbox-closer").hide();
      var pinlength=ReadCookie("pincode").length;
      if(pinlength==6)
        check_pin(product_id,0);
      $('.clk_view_prd_blk').show();
     }
     function quick_view_click(product_id)
     {  
        $(".product-notification-container").remove();
        prod=product_id;
        var update_url = "index.php?dispatch=product_quick_view.view&product_id="+product_id;
        jQuery.ajaxRequest(update_url, {method: 'GET', cache: false, result_ids:'cart_status',
            callback:function(data)
            {
                fn_update_quick_look(product_id);
                $("#button_express_"+prod).die("click",unexp);
                $("#button_express_"+prod).live("click",unexp);
                $("#cart_form").die("submit",docmajax);
                $("#cart_form").live("submit",docmajax);
            }
        });
     }
     function quick_look_close(product_id)
     {
         $(".product-notification-container").remove();
     }
     function docmajax()
     {
         var update_url="index.php?dispatch=checkout.add.."+prod+"&"+$("#cart_form").serialize();
          jQuery.ajaxRequest(update_url, {method: 'POST', cache: false, result_ids:'cart_status',
            callback:function(data)
            {
            }
        });
        return false;
     }
         function unexp()
     {
         $("#cart_form").die("submit",docmajax);
         return true;
     }
     $("#button_express_"+prod).live("click",unexp);
 </script>

{/literal}

