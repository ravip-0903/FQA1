{* $Id: products_small_items.tpl 8327 2009-11-27 09:11:44Z angel $ *}
{** block-description:small_items **}

{if $block.properties.hide_add_to_cart_button == "Y"}
	{assign var="_show_add_to_cart" value=false}
{else}
	{assign var="_show_add_to_cart" value=true}
{/if}

{if $block.properties.positions == "left" || $block.properties.positions == "right"}
	{assign var="_show_trunc_name" value="true"}
{else}
	{assign var="_show_name" value="true"}
{/if}
{include file="blocks/list_templates/small_items.tpl" 
products=$items 
obj_prefix="`$block.block_id`000" 
item_number=$block.properties.item_number 
show_name=$_show_name 
show_trunc_name=$_show_trunc_name 
show_price=true 
show_old_price=true
show_add_to_cart=$_show_add_to_cart 
show_list_buttons=false 
but_role="act"}
