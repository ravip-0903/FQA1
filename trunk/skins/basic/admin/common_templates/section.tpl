{* $Id: section.tpl 11890 2011-02-22 10:25:13Z zeke $ *}

{math equation="rand()" assign="rnd"}
<div class="clear" id="ds_{$rnd}">
	<div class="section-border">
		{$section_content}
		{if $section_state}
			<p align="right">
				<a href="{"`$index_script`?`$smarty.server.QUERY_STRING`&amp;close_section=`$key`"|fn_url}" class="underlined">{$lang.close}</a>
			</p>
		{/if}
	</div>
</div>
