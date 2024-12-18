{* $Id: prices_block.post.tpl 12724 2011-06-21 12:48:57Z zeke $ *}

{if $product.recurring_plans && !($smarty.const.CONTROLLER == "products" && ($smarty.const.MODE == "view" || $smarty.const.MODE == "options"))}

{if $product.extra.recurring_plan_id}
	{assign var="_cur_plan_id" value=$product.extra.recurring_plan_id}
{else}
	{assign var="first_plan" value=$product.recurring_plans|reset}
	{assign var="_cur_plan_id" value=$first_plan.plan_id}
{/if}

<input type="hidden" id="rb_plan_{$obj_prefix}{$obj_id}" name="product_data[{$obj_id}][recurring_plan_id]" value="{$_cur_plan_id}" />

{/if}