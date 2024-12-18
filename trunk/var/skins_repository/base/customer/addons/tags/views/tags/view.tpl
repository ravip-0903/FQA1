{* $Id: view.tpl 9353 2010-05-04 06:10:09Z klerik $ *}

{if $addons.tags.tags_for_products == "Y" && $products}

	{include file="common_templates/subheader.tpl" title=$lang.products}
	
	{assign var="layouts" value=""|fn_get_products_views:false:0}
	
	{if $layouts.$selected_layout.template}
		{include file="`$layouts.$selected_layout.template`" columns=$settings.Appearance.columns_in_products_list}
	{/if}
{/if}

{if $addons.tags.tags_for_pages == "Y" && $pages}
	{include file="common_templates/subheader.tpl" title=$lang.pages}

	<ul>
		{foreach from=$pages item="page"}
		<li><a href="{"pages.view?page_id=`$page.page_id`"|fn_url}">{$page.page}</a></li>
		{/foreach}
	</ul>
{/if}

{hook name="tags:view"}{/hook}

{if !$tag_objects_exist}
<p class="no-items">{$lang.no_data}</p>
{/if}

{capture name="mainbox_title"}{$page_title}{/capture}
