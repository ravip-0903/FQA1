<?php
/***************************************************************************
*                                                                          *
*   (c) 2004 Vladimir V. Kalynyak, Alexey V. Vinokurov, Ilya M. Shalnev    *
*                                                                          *
* This  is  commercial  software,  only  users  who have purchased a valid *
* license  and  accept  to the terms of the  License Agreement can install *
* and use this program.                                                    *
*                                                                          *
****************************************************************************
* PLEASE READ THE FULL TEXT  OF THE SOFTWARE  LICENSE   AGREEMENT  IN  THE *
* "copyright.txt" FILE PROVIDED WITH THIS DISTRIBUTION PACKAGE.            *
****************************************************************************/


//
// $Id: products.php 12865 2011-07-05 06:57:22Z 2tl $
//

if ( !defined('AREA') ) { die('Access denied'); }

$schema = array (
	'table' => 'products',
	'object_name' => 'product',
	'key' => array('product_id'),
	'group_by' => 'products.product_id',
	'sortings' => array (
		'code' => 'products.product_code',
		'status' => 'products.status',
		'product' => 'product_descriptions.product',
		'position' => 'products_categories.position',
		'price' => 'prices.price',
		'list_price' => 'products.list_price',
		'weight' => 'products.weight',
		'amount' => 'products.amount',
		'timestamp' => 'products.timestamp',
		'popularity' => 'popularity.total',
	),
	'references' => array (
		'product_descriptions' => array (
			'join_type' => 'LEFT',
			'fields' => array (		
				'product_id' => array (
					'db_field' => 'product_id'
				),
				'lang_code' => array (
					'param' => 'lang_code'
				)
			)
		),
		'product_prices' => array (
			'join_type' => 'LEFT',
			'fields' => array (		
				'product_id' => array (
					'db_field' => 'product_id'
				)
			)
		),
		'products_categories' => array (
			'join_type' => 'LEFT',
			'fields' => array (		
				'product_id' => array (
					'db_field' => 'product_id'
				),
				'link_type' => array (
					'value' => 'M'
				)
			)
		),
		'category_descriptions' => array (
			'join_type' => 'LEFT',
			'fields' => array (		
				'category_id' => array (
					'table' => 'products_categories',
					'db_field' => 'category_id'
				)
			)
		),
		'images_links' => array (
			'join_type' => 'LEFT',
			'fields' => array (		
				'object_id' => array (
					'db_field' => 'product_id'
				),
				'object_type' => array (
					'value' => 'product'
				)
			)
		)
	),	
	'fields' => array (
		'product_id' => array (
			'db_field' => 'product_id'
		),
		'product_code' => array (
			'db_field' => 'product_code'
		),
		'status' => array (
			'db_field' => 'status'
		),
		'list_price' => array (
			'db_field' => 'list_price'
		),
		'amount' => array (
			'db_field' => 'amount'
		),
		'weight' => array (
			'db_field' => 'weight'
		),
		'length' => array (
			'db_field' => 'length'
		),
		'width' => array (
			'db_field' => 'width'
		),
		'height' => array (
			'db_field' => 'height'
		),
		'shipping_freight' => array (
			'db_field' => 'shipping_freight'
		),
		'timestamp' => array (
			'db_field' => 'timestamp'
		),
		'is_edp' => array (
			'db_field' => 'is_edp'
		),
		'edp_shipping' => array (
			'db_field' => 'edp_shipping'
		),
		'unlimited_download' => array (
			'db_field' => 'unlimited_download'
		),
		'free_shipping' => array (
			'db_field' => 'free_shipping'
		),
		'avail_since' => array (
			'db_field' => 'avail_since'
		),
		'product' => array (
			'table' => 'product_descriptions',
			'db_field' => 'product'
		),
		'category_id' => array (
			'table' => 'products_categories',
			'db_field' => 'category_id'
		),
		'category' => array (
			'table' => 'category_descriptions',
			'db_field' => 'category'
		),
		'price' => array (
			'table' => 'product_prices',
			'query_field' => 'MIN(product_prices.price) as price',
			'db_field' => 'price'
		),
		'short_name' => array (
			'table' => 'product_descriptions',
			'db_field' => 'shortname'
		),
		'short_description' => array (
			'table' => 'product_descriptions',
			'db_field' => 'short_description'
		),
		'full_description' => array (
			'table' => 'product_descriptions',
			'db_field' => 'full_description'
		),
		'meta_keywords' => array (
			'table' => 'product_descriptions',
			'db_field' => 'meta_keywords'
		),
		'meta_description' => array (
			'table' => 'product_descriptions',
			'db_field' => 'meta_description'
		),
		'search_words' => array (
			'table' => 'product_descriptions',
			'db_field' => 'search_words'
		),
		'page_title' => array (
			'table' => 'product_descriptions',
			'db_field' => 'page_title'
		),
		'icon' => array (
			'schema' => array (
				'is_single' => true,
				'type' => 'images',
				'name' => 'icon',
				'filter' => array (
					'image_id' => array (
						'table' => 'image_links',
						'db_field' => 'image_id'
					)
				)			
			)
		),
		'images' => array (
			'schema' => array (
				'is_single' => false,
				'type' => 'images',
				'filter' => array (
					'object_id' => array (
						'db_field' => 'product_id'
					),
					'object_type' => array (
						'db_field' => 'product'
					),
					'image_id' => array (
						'table' => 'image_links',
						'db_field' => 'detailed_id'
					)
				)
			)
		),
		'options' => array (
			'schema' => array (
				'is_single' => false,
				'type' => 'product_options',
				'filter' => array (
					'product_id' => array (
						'db_field' => 'product_id'
					)
				)
			)
		),
		'options_exceptions' => array (
		/*
			'process_get' => array (
				'func' => 'fn_get_api_product_options_exceptions',
				'params' => array (
					'product_id' => array (
						'db_field' => 'product_id'
					),
				)
			),
			*/
			'schema' => array (
				'is_single' => false,
				'type' => 'product_options_exceptions',
				'filter' => array (
					'product_id' => array (
						'db_field' => 'product_id'
					)
				)
			)
		),
		'options_inventory' => array (
		/*
			'process_get' => array (
				'func' => 'fn_get_api_product_options_inventory',
				'params' => array (
					'product_id' => array (
						'db_field' => 'product_id'
					),
					'lang_code' => array (
						'param' => 'lang_code'
					)
				)
			),
			*/
			'schema' => array (
				'is_single' => false,
				'type' => 'product_options_inventory',
				'filter' => array (
					'product_id' => array (
						'db_field' => 'product_id'
					)
				)
			)
		),
		'reviews' => array (
			'schema' => array (
				'is_single' => false,
				'type' => 'product_reviews',
				'filter' => array (
					'object_id' => array (
						'db_field' => 'product_id'
					),
					'object_type' => array (
						'value' => 'P'
					)
				)
			)
		),
	)
);

?>