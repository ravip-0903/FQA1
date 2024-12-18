{* $Id: usergroup_request.tpl 11786 2011-02-08 09:44:48Z 2tl $ *}

{include file="letter_header.tpl"}

{$lang.text_usergroup_request}<br>
<p>
<table>
<tr>
	<td>{$lang.usergroup}:</td>
	<td><b>{$usergroups.$usergroup_id.usergroup}</b></td>
</tr>
{if $settings.General.use_email_as_login != "Y"}
<tr>
	<td>{$lang.username}:</td>
	<td>{$user_data.user_login}</td>
</tr>
{/if}
<tr>
	<td>{$lang.name}:</td>
	<td>{$user_data.firstname}&nbsp;{$user_data.lastname}</td>
</tr>
<tr>
	<td>{$lang.email}:</td>
	<td>{$user_data.email}</td>
</tr>
</table>
</p>
{include file="letter_footer.tpl" user_type='A'}
