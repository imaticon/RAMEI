{include file="$template/includes/alert.tpl" type="info" msg=$LANG.rcmail_createforwarderdesc1|cat:"@"|cat:$domain|cat:$LANG.rcmail_createforwarderdesc2|cat:"@"|cat:$domain}

{if $mailfwdcreateerror}
<br />
<div class="alert alert-danger">
    <p>{$LANG.clientareaerrors}</p>
    <ul>
        {$mailfwdcreateerror}
    </ul>
</div>
{/if}

{if $mailfwdcreatesuccess}
<br />
<div class="alert alert-success">
	<p>{$LANG.moduleactionsuccess}</p>
    <ul>
        {$mailfwdcreatesuccess}
    </ul>
</div>
{/if}

<form method="post" action="emailmanagement.php?action=createmailfwd">
	<input type="hidden" name="page" value="{$smarty.post.page}"/>
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<input name="freemailhosting" value="{$freemailhosting}" type="hidden"/>
	<input type="hidden" name="createmailfwd" value="true"/>
	<table class="table table-bordered table-hover">
		<tr>
			<td style="vertical-align:top">
				{$LANG.rcmail_ifmailarrives}
			</td>
			<td style="vertical-align:top">
				<div class="input-group">
					<input class="form-control" name="mailalias" type="text" value="{if $mailfwdcreateerror}{$smarty.post.mailalias}{/if}" size="30"/>
					<span class="input-group-addon" id="basic-addon2">@{$domain}</span>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcmail_redirectto}</strong>
			</td>
			<td>
				{$LANG.rcmail_inputredirectto}<br />
				<textarea class="form-control" name="forwardto" cols="50" rows="7">{if $mailfwdcreateerror}{$smarty.post.forwardto}{/if}</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcmail_note}:</strong>
			</td>
			<td>
				{$LANG.rcmail_maxforwarderdesc}
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<p align="center"><input type="submit" value="{$LANG.rcmail_createonlyfwd}" class="btn btn-success"/></p>
			</td>
		</tr>
	</table>
</form>
