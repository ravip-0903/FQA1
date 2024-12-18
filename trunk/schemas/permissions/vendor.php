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
// $Id: vendor.php 9088 2010-03-15 10:40:51Z 2tl $
//

if ( !defined('AREA') ) { die('Access denied'); }

$schema = array (
	'controllers' => array (
		'auth' => array (
			'permissions' => true,
		),
		'index' => array (
			'permissions' => true,
		),
		'elf_connector' => array (
			'modes' => array (
				'files' => array (
					'permissions' => false,
				),
			),
			'permissions' => true,
		),
		/* andyye TODO: move to add-on's code */
		'vendor_terms' => array (
			'permissions' => true,
			'modes' => array (
				'manage' => array (
					'permissions' => true,
				),
			),
		),
		
		'billing_detail_master' => array (
			'modes' => array (
				'billing_lookup' => array (
					'permissions' => true,
				),
			),
		),
		'companies' => array (
			'modes' => array (
				'companies_email' => array (
					'permissions' => true,
				),
			),
		),
		'product_tp_master' => array (
			'permissions' => false,
			'modes' => array (
				'product_tp' => array (
					'permissions' => false,
				),
			),
		),
		'milkrun_download' => array (
			'permissions' => true,
			'modes' => array (
				'download' => array (
					'permissions' => true,
				),
			),
		),
		'hp_general' => array (
			'permissions' => true,
			'modes' => array (
				'checkinternet' => array (
					'permissions' => true,
				),
			),
		),
		'merchant_report' => array (
            'permissions' => true,
            'modes' => array (
                'inventory_movement_view' => array (
                    'permissions' => true,
                ),
            ),
        ),
		'devtools' => array (
			'modes' => array (
				'manage' => array (
					'permissions' => true,
				),
			),
		'permissions' => true,
		),
		'sdeep_iconization' => array (
				'modes' => array (
					'manage' => array (
						'permissions' => true,
					),
				),
			'permissions' => true,
			),
		'sdeep_ratings' => array (
				'modes' => array (
					'manage' => array (
						'permissions' => true,
					),
				),
			'permissions' => true,
			),
			
			
		'mpromotions' => array (
				'modes' => array (
					'add' => array (
						'permissions' => true,
					),
				),
			'permissions' => true,
			),
		'export_orders' => array (
			'permissions' => true,
			'modes' => array (
				'export_orders_list' => array (
					'permissions' => true,
				),
			),
		),
	
		'profiles' => array (
			'modes' => array (
				'update_cards' => array (
					'permissions' => false
				),
				'delete_profile' => array (
					'permissions' => false
				),
				'delete_card' => array (
					'permissions' => false
				),
				'request_usergroup' => array (
					'permissions' => false
				),
				'manage' => array (
					'param_permissions' => array(
						'extra' => array(
							'user_type=P' => false,
						),
						'permission' => true,
					),
				),
				'act_as_user' => array (
					'permissions' => false,
				)
			),
			'permissions' => true,
		),
		'companies' => array (
			'modes' => array (
				'add' => array (
					'permissions' => false
				),
				'delete' => array (
					'permissions' => false
				),
				'update_status' => array (
					'permissions' => false
				),
				'm_activate' => array (
					'permissions' => false
				),
				'm_disable' => array (
					'permissions' => false
				),
				'm_delete' => array (
					'permissions' => false
				),/*modified by chandan*/
				'balance' => array (
					'permissions' => false
				),/*modified by chandan*/
			),
			'permissions' => true,
		),
		'profile_fields' => array (
			/*'modes' => array (
				'manage' => array (
					'permissions' => true
				),
			),*/
			'permissions' => false,
		),
		'usergroups' => array (
			/*'modes' => array (
				'manage' => array (
					'permissions' => true
				),
				'assign_privileges' => array (
					'permissions' => array ('GET' => true, 'POST' => false),
				),
				'update_status' => array (
					'permissions' => true,
				),
			),*/
			'permissions' => false,
		),
		
		'sales_reports' => array (
			'modes' => array(
				'reports_list' => array (
					'permissions' => false,
				),
				'reports_view' => array (
					'permissions' => true,
				),
			),
			'permissions' => array ('GET' => true, 'POST' => false),
		),
		
		'categories' => array (
			'modes' => array (
				'delete' => array (
					'permissions' => false
				),
				// Why .add was true ???
				'add' => array (
					'permissions' => false
				),
				'm_add' => array (
					'permissions' => false
				),
				'm_update' => array (
					'permissions' => false
				),
				'picker' => array (
					'permissions' => true
				),
			),
			'permissions' => array ('GET' => true, 'POST' => false),
		),
		
		'taxes' => array (
			'modes' => array(
				'update' => array(
					'permissions' => array ('GET' => true, 'POST' => false),
				),
				'manage' => array(
					'permissions' => array ('GET' => true, 'POST' => false),
				),
			),
			'permissions' => false,
		),

		'image' => array (
			'modes' => array(
				'barcode' => array(
					'permissions' => true,
				),
				'delete_image' => array(
					'permissions' => true,
				),
			),
			'permissions' => false,
		),

		'search' => array (
			'modes' => array(
				'results' => array(
					'permissions' => true,
				),
			),
			'permissions' => false,
		),

		'states' => array (
			'modes' => array(
				'manage' => array(
					'permissions' => true,
				),
			),
			'permissions' => false,
		),
		
		'countries' => array (
			'modes' => array(
				'manage' => array(
					'permissions' => array ('GET' => true, 'POST' => false),
				),
			),
			'permissions' => false,
		),
		
		'destinations' => array (
			'modes' => array(
				'update' => array(
					'permissions' => array ('GET' => true, 'POST' => false),
				),
				'manage' => array(
					'permissions' => array ('GET' => true, 'POST' => false),
				),
			),
			'permissions' => false,
		),
		
		'localizations' => array (
			/*'modes' => array(
				'update' => array(
					'permissions' => array ('GET' => true, 'POST' => false),
				),
				'manage' => array(
					'permissions' => true,
				),
			),*/
			'permissions' => false,
		),
		
		'languages' => array (
			/*'modes' => array(
				'manage' => array(
					'permissions' => true,
				),
			),*/
			'permissions' => false,
		),
		
		'product_features' => array (
			'modes' => array(
				'update' => array(
					'permissions' => array ('GET' => true, 'POST' => false),
				),
				'manage' => array(
					'permissions' => array ('GET' => true, 'POST' => false),
				),
			),
			'permissions' => false,
		),
		
		'statuses' => array (
			/*'modes' => array(
				'update' => array(
					'permissions' => array ('GET' => true, 'POST' => false),
				),
				'manage' => array(
					'permissions' => true,
				),
			),*/
			'permissions' => false,
		),
		
		'currencies' => array (
			'modes' => array(
				'update' => array(
					'permissions' => array ('GET' => true, 'POST' => false),
				),
				'manage' => array(
					'permissions' => true,
				),
			),
			'permissions' => false,
		),
		'exim' => array (
			'modes' => array(
				'export' => array(
					'permissions' => true,
				),
				'import' => array(
					'permissions' => true,
				),
			),
			'permissions' => true,
		),
		
		'product_filters' => array (
			'modes' => array(
				'update' => array(
					'permissions' => array ('GET' => true, 'POST' => false),
				),
				'manage' => array(
					'permissions' => array ('GET' => true, 'POST' => false),
				),
				'delete' => array(
					'permissions' => false,
				),
			),
			'permissions' => true,
		),
		
		'orders' => array (
			'modes' => array(
				'details' => array(
					'permissions' => true,
				),
				'delete' => array(
					'permissions' => false,
				),
				'delete_orders' => array(
					'permissions' => false,
				),
				'manage' => array(
									'permissions' => true,
				),
			),
			'permissions' => true,
		),
		/* Add permission by paresh to manifest, bulk order, milkrun completed system for vendor login */
		'manifest_create' => array (
			'modes' => array(
				'manifest_generate' => array(
					'permissions' => true,
				),
				'manifest_list_view' => array(
					'permissions' => true,
				),
				'manifest_list_detail' => array(
					'permissions' => true,
				),
			),
			'permissions' => true,
		),
		
		'import_orders' => array (
			'modes' => array(
				'import_orders_list' => array(
					'permissions' => true,
				),
			),
			'permissions' => true,
		),
		
		'import_orders_details' => array (
			'modes' => array(
				'import_orders_list_details' => array(
					'permissions' => true,
				),
			),
			'permissions' => true,
		),
		
		'milkrun_completed' => array (
			'modes' => array(
				'milkrun_initiate_list' => array(
					'permissions' => true,
				),
				'milkrun_order_list' => array(
					'permissions' => true,
				),
				'milkrun_completed_status' => array(
					'permissions' => true,
				),
			),
			'permissions' => true,
		),
		
		'create_shipment' => array (
			'modes' => array(
				'new' => array(
					'permissions' => true,
				),
				'list' => array(
					'permissions' => true,
				),
				'upload' => array(
					'permissions' => true,
				),
			),
			'permissions' => true,
		),
		
		'milkrun_create' => array (
			'modes' => array(
				'milkrun_generate' => array(
					'permissions' => true,
				),
				'milkrun_list' => array(
					'permissions' => true,
				),
				'milkrun_distribution' => array(
					'permissions' => true,
				),
			),
			'permissions' => true,
		),
		'manifest_search' => array (
			'modes' => array(
				'manifest_list' => array(
					'permissions' => true,
				)
				)
			),
		'manifest_ui' => array (
			'modes' => array(
				'manifest' => array(
					'permissions' => true,
				),
				'createcsv' => array(
					'permissions' => true,
				),
				'generatemanifest' => array(
					'permissions' => true,
				),
				)
			),
		'bd_company_rel'=>array(
		'modes'=>array(
			'manage'=>array('permissions'=>'true')
			           )
		),	
		'billing_detail_master'=>array(
		'modes'=>array(
			'billing_lookup'=>array('permissions'=>'true')
			           )
		),
		/* End permission by paresh to manifest, bulk order, milkrun completed system for vendor login */
		
		'shippings' => array (
			'permissions' => true,
		),
		
		'tags' => array (
			'modes' => array(
				'list' => array(
					'permissions' => true,
				),
			),
			'permissions' => false,
		),

		'pages' => array (
			'modes' => array(
				/*'m_add' => array(
					'permissions' => false,
				),
				'm_update' => array(
					'permissions' => false,
				),*/
			),
			'permissions' => true,
		),

		'products' => array (
			'modes' => array(
			),
			'permissions' => true,
		),
		
		'product_options' => array (
			'permissions' => true,
		),
	
		
		'promotions' => array (
			'permissions' => false,
		),
		
		'shipments' => array (
			'permissions' => true,
		),
		
		'attachments' => array (
			'permissions' => true,
		),
		
		'block_manager' => array (
			'permissions' => false,
		),
		
		'discussion_manager' => array (
			'modes' => array(
				'manage' => array(
					'permissions' => false
				),
			),
			'permissions' => true,
			//'permissions' => false,
		),

		'discussion' => array(
			'modes' => array(
				'update_posts' => array(
					'permissions' => true
				),
				'add_post' => array(
					'permissions' => true
				),
				'delete_posts' => array(
					'permissions' => true
				),
			),
			'permissions' => false,
		),
		
		'tools' => array (
			'modes' => array (
				'update_status' => array (
					'param_permissions' => array (
						'table_names' => array (
							'shippings' => true,
							'products' => true,
							'product_options' => true,
							'attachments' => true,
							'product_files' => true,
							'pages' => 'true',
							//'users' => true,
							/*'categories' => 'manage_catalog',
							'states' => 'manage_locations',
							'usergroups' => 'manage_usergroups',
							'currencies' => 'manage_currencies',
							'blocks' => 'edit_templates',
							'taxes' => 'manage_taxes',
							'promotions' => 'manage_promotions',
							'static_data' => 'manage_static_data',
							'statistics_reports' => 'manage_reports',
							'countries' => 'manage_locations',
							
							'languages' => 'manage_languages',
							'revisions_workflows' => 'manage_revisions',
							'revisions_workflows_queue' => 'manage_revisions',
							'sitemap_sections' => 'manage_sitemap',
							'localizations' => 'manage_locations',
							'products' => 'manage_catalog',
							'destinations' => 'manage_locations',
							'product_options' => 'manage_catalog',
							'product_features' => 'manage_catalog',
							'payments' => 'manage_payments',
							'product_filters' => 'manage_catalog',
							'product_files' => 'manage_catalog'
							*/
						)
					)
				),
				'cleanup_history' => array(
					'permissions' => true
				),
			)
		),
            'storesetup' => array(
			'modes' => array(
				'manage' => array(
					'permissions' => true
				),
                                'first_step' => array(
					'permissions' => true
				),
                                'second_step' => array(
					'permissions' => true
				),
                                'third_step' => array(
					'permissions' => true
				),
                                'fourth_step' => array(
					'permissions' => true
				),
                                'change_password' => array(
                                         'permissions' => true  
                                ),
                                'upload_prod' => array(
                                       'permissions' =>true
                                ),
                                'send_request' => array(
					'permissions' => true
				),
                                 'request_form' => array(
					'permissions' => true
				),
                                 'contact_form' => array(
                                                   'permissions' => true  
                                 ),
			),
		      'permissions' => false,
		),
            'merchant_messages' => array(
                
                            'modes'  =>array(
                                
                                  'messages' => array(
                                      
                                              'permissions' => true
                           ),
                                'messages_detail' => array(
                                        
                                               'permissions' => true  
                                ),
                                
                                'seller_connect' => array(
                                  
                                            'permissions' => true
                                    
                                ),
                                'seller_connect_reply' => array(
                                    
                                           'permissions' => true
                                    
                                ),
                       ),
            ),
            'storeperformance' => array(
                    'modes' => array(
                        'store_report' => array(
                                   'permissions' =>true
                      ), 
                 ),
            ),
            
	),
	
	'addons' => array (
		'affiliate' => array(
			'permission' => false,
		),
		'suppliers' => array(
			'permission' => false,
		),
		'access_restrictions' => array(
			'permission' => false,
		),
		'age_verification' => array(
			'permission' => false,
		),
		'anti_fraud' => array(
			'permission' => false,
		),
		'banners' => array(
			'permission' => false,
		),
		'bestsellers' => array(
			'permission' => false,
		),
		'customers_also_bought' => array(
			'permission' => false,
		),
		'form_builder' => array(
			'permission' => false,
		),
		'gift_registry' => array(
			'permission' => false,
		),
		'google_analytics' => array(
			'permission' => false,
		),
		'google_sitemap' => array(
			'permission' => false,
		),
		'hot_deals_block' => array(
			'permission' => false,
		),
		'live_help' => array(
			'permission' => false,
		),
		'news_and_emails' => array(
			'permission' => false,
		),
		'polls' => array(
			'permission' => false,
		),
		'quickbooks' => array(
			'permission' => false,
		),
		'reward_points' => array(
			'permission' => true,
		),
		'send_to_friend' => array(
			'permission' => false,
		),
		'sms_notifications' => array(
			'permission' => false,
		),
		'store_locator' => array(
			'permission' => false,
		),
		'webmail' => array(
			'permission' => false,
		),
	),
	'export' => array(
		'sections' => array(
			'translations' => array(
				'permission' => false,
			),
		),
		'patterns' => array(
			'google' => array(
				'permission' => false,
			),
		),
	),
	'import' => array(
		'sections' => array(
			'translations' => array(
				'permission' => false,
			),
			'orders' => array(
				'permission' => false,
			),
			'users' => array(
				'permission' => false,
			),
		),
		'patterns' => array(
		),
	),
);

?>