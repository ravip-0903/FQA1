<?php 

if ( !defined('AREA') ) { die('Access denied'); }

function fn_my_changes_get_product_data_more()
{
    $root_categories = fn_get_subcategories(0);
	foreach ($root_categories as $k => $v) {
		$root_categories[$k]['subcategories'] = fn_get_categories_tree($v['category_id']);
	}
	return $root_categories;
}

function fn_list_tabs($nav)
{	
	$GLOBALS['topLinks'][] = $nav;
	return $GLOBALS['topLinks'];
}
?>