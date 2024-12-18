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
// $Id: checkout.pre.php 12865 2011-07-05 06:57:22Z 2tl $
//

if ( !defined('AREA') )	{ die('Access denied');	}

if ($mode == 'checkout' || $mode == 'customer_info') {
	$view->assign('page_mailing_lists', fn_get_mailing_lists(array('checkout' => true)));
	$email = db_get_field("SELECT email FROM ?:users WHERE user_id = ?i", $_SESSION['auth']['user_id']);
	
	if ((empty($email) || $_SESSION['auth']['user_id'] == 0) && !empty($_SESSION['cart']['user_data']['email'])) {
		$email = $_SESSION['cart']['user_data']['email'];
	}
	$mailing_lists = db_get_hash_array("SELECT * FROM ?:subscribers INNER JOIN ?:user_mailing_lists ON ?:subscribers.subscriber_id = ?:user_mailing_lists.subscriber_id WHERE ?:subscribers.email = ?s", 'list_id', $email);
	$view->assign('user_mailing_lists', $mailing_lists);
	// on customer info page we show only one "format" selectbox. so we take active format from
	// first active newsletter from this user.
	$first = array_shift($mailing_lists);
	$view->assign('newsletter_format', $first['format']);
}

?>