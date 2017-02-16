{include file="$template/includes/alert.tpl" type="info" msg=$LANG.rcmail_catchallactivatedesc}

<br />
{if $catchallerror}
<br />
<div class="alert alert-danger">
	<p>{$LANG.clientareaerrors}</p>
    <ul>
        {$catchallerror}
    </ul>
</div>
{/if}

{if $catchallsuccess}
<br />
<div class="alert alert-success">
    <p>{$LANG.moduleactionsuccess}</p>
    <ul>
        {$catchallsuccess}&nbsp;{$smarty.post.selectascatchall}
    </ul>
</div>
{/if}

{if !$popaccounts}
<br />
<div class="alert alert-warning">
	<p>{$LANG.clientareaerrors}</p>
    <ul>
        {$LANG.rcmail_createmailfirst}
    </ul>
</div>

{else}

<form method="post" action="{$smarty.server.PHP_SELF}?action=catchall">
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<input name="freemailhosting" value="{$freemailhosting}" type="hidden"/>
	<input type="hidden" name="setcatchallaccount" value="true"/>
	<table class="table table-bordered table-hover">
		<tr>
			<td style="vertical-align:top">
				{$LANG.rcmail_catchalluseas}
			</td>
			<td style="vertical-align:top">
				<select class="form-control" name="selectascatchall">
					{foreach from=$popaccounts item=mailaddress}
					<option value="{$mailaddress}">{$mailaddress}</option>
					{/foreach}
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<p align="center"><input type="submit" value="{$LANG.rcmail_catchallcreatebutton}" class="btn btn-success"/></p>
			</td>
		</tr>
	</table>
</form>
{/if}
