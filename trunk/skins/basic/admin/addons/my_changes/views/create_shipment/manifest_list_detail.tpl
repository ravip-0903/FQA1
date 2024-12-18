{* $Id: export_order_list.tpl 12544 2011-05-27 10:34:19Z bimib $ *}
<!--<pre>
{$order_info|print_r}</pre> -->
{literal}
<style type="text/css">
.sortable th{ padding: 0px 5px;}
.sortable td, .sortable tr:hover td{ border-right: 1px solid #e4e4e4;}
</style>
{/literal}
<h1>Manifest Creation System</h1>
<p>Step1: Enter Order Numbers | Step2: Review  Manifest | <strong>Step3: Create Manifest Report</strong></p>

<span><strong>Manifest ID:</strong> {$manifest_id}</span><br />
<span><strong>Carrier Name:</strong> {$courier_name|replace:'_':' '}</span><br />
<span><strong>Dispatch Date:</strong> {$dispatch_date}</span><br />
<span><strong>No. Of Shipments:</strong> {$order_info|count}</span><br /><br />

<form method="get" action="{""|fn_url}" name="manifest_form" id="manifest_form">
<input type="hidden" name="mode_action" value="export_csv" />
<span class="submit-button cm-button-main cm-process-items">
<input type="submit" value="Export To CSV" name="dispatch[manifest_create.manifest_list_detail]" class="cm-process-items" /></span>
</form>

<!--<form method="get" action="{""|fn_url}" name="manifest_form" id="manifest_form">
<input type="hidden" name="mode_action" value="export_pdf" />
<span class="submit-button cm-button-main cm-process-items">
<input type="submit" value="PDF" name="dispatch[manifest_create.manifest_list_detail]" class="cm-process-items" /></span>
</form> -->

<table border="0" cellpadding="0" cellspacing="0" width="100%" class="table sortable">
<tr>
	<!--<th width="1%" class="center">
		<input type="checkbox" name="check_all" value="Y" title="{$lang.check_uncheck_all}" class="checkbox cm-check-items" /></th> -->
	<th width="5%">Order No.</th>
    <th width="10%">Merchant Name</th>
    <th width="10%">Payment Mode</th>
    <th width="10%">Buyer Name</th>
    <th width="15%">Shipping Address1</th>
    <th width="15%">Shipping Address2</th>
    <th width="15%">Shipping City</th>
    <th width="15%">Shipping State</th>
    <th width="15%">Shipping Pincode</th>
    <th width="10%">Buyer Phone No.</th>
    <th width="10%">Order SubTotal</th>
    <th width="10%">Collectible Amount</th>
    <th width="10%">Shipment Weight</th>
    <th width="20%">Product Details</th>
    <th width="10%">Courier Name</th>
    <th width="10%">Date Of Dispatch</th>
    <th width="10%">Manifest ID</th>
</tr>
{if $order_info}
{foreach from=$order_info item="order_details" key="k"}
    {assign var="oid" value=$order_details.order_id}

{hook name="orders:order_row"}
<tr {cycle values="class=\"table-row\", "}>
	<!--<td class="center" width="5%">
		<input type="checkbox" name="order_ids[]" value="{$o.id}" class="checkbox cm-item" /></td> -->
	<td>
		{$order_details.order_id}
	</td>
    <td>
		{$merchant_name.$oid}
    </td>
    <td>
		{if $order_details.payment_method.payment == '' && !isset($order_details.use_gift_certificates)}
        	CluesBucks
        {elseif isset($order_details.use_gift_certificates)}
        	Gift Certificate
        {else}
        	{$order_details.payment_method.payment}
        {/if}
    </td>
    <td>
		{$order_details.b_firstname} {$order_details.b_lastname}
	</td>
    <td>
		{$order_details.s_address}
    </td>
    <td>
		{$order_details.s_address_2}
    </td>
    <td>
		{$order_details.s_city} 
    </td>
    <td>
		{$order_details.s_state_descr} 
    </td>
    <td >
		{$order_details.s_zipcode} 
    </td>
    <td>
		{$order_details.b_phone} 
    </td>
    <td>
		{$order_details.subtotal|number_format:2:".":","}
    </td>
    <td>
		{if $order_details.payment_method.payment_id == '6'}
		{$order_details.total}
        {else}
        0.00
        {/if}
    </td>
    <td>
        {$order_info.$k.$oid.weight}
    </td>
    <td>
        {$prod_details.$k.$oid.prod_detail}
    </td>
    <td>
		{$courier_name|replace:'_':' '}
	</td>
    <td>
		{$dispatch_date}
	</td>
    <td>
		{$manifest_id}
	</td>
</tr>
{/hook}


{/foreach}
{else}
<tr>
	<td colspan="20">Data Not Found</td>
</tr>
{/if}
</table>