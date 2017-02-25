<script>
	jQuery(document).ready(function(){
		jQuery("div a").click(function() {
			jQuery(this).parent().children().removeClass("active");
			jQuery(this).addClass("active");
		});
	});
</script>

<script language="javascript" type="text/javascript">
	function confirmFwdDelete(){literal}{{/literal}return confirm("{$LANG.rcmail_deleteforwardwarning}");{literal}}{/literal}
</script>

{if $isonlyforwarder}

{include file="$template/includes/alert.tpl" type="info" msg=$LANG.rcmail_modifyforwarderdesc1|cat:"&nbsp;"|cat:$emailaddress|cat:"&nbsp;"|cat:$LANG.rcmail_modifyforwarderdesc2}

{if $delforwarderror}
<br />
<div class="alert alert-danger">
    <p>{$LANG.clientareaerrors}</p>
    <ul>
        {$delforwarderror}
    </ul>
</div>
{/if}

{if $delforwardsuccess}
<br />
<div class="alert alert-success">
	<p>{$LANG.moduleactionsuccess}</p>
    <ul>
        {$delforwardsuccess}
    </ul>
</div>
{/if}

{if $addforwarderror}
<br />
<div class="alert alert-danger">
    <p>{$LANG.clientareaerrors}</p>
    <ul>
        {$addforwarderror}
    </ul>
</div>
{/if}

{if $addforwardsuccess}
<br />
<div class="alert alert-success">
	<p>{$LANG.moduleactionsuccess}</p>
    <ul>
        {$addforwardsuccess}
    </ul>
</div>
{/if}

<h4>{$LANG.rcmail_forwarderactualtitle}</h4>

<table class="table table-bordered table-hover">
	{foreach key=num item=forwarder from=$adminForwards}
	{if $singleforward}
	<tr>
		<td>
			{$LANG.rcmail_mailssendto}: <span class="label label-warning">{$emailaddress}</span>&nbsp;{$LANG.rcmail_forwardingto}: <span class="label label-success">{$forwarder}</span>	
		</td>
	</tr>
	{else}
	<tr>
		<td>
			{$LANG.rcmail_mailssendto}: <span class="label label-warning">{$emailaddress}</span>&nbsp;{$LANG.rcmail_forwardingto}: <span class="label label-success">{$forwarder}</span><br />
		</td>
		<td>
			<form method="post" action="emailmanagement.php?action=modifyaccount">
				<input type="hidden" name="page" value="{$smarty.post.page}"/>
				<input type="hidden" name="domainid" value="{$domainid}"/>
				<input type="hidden" name="domain" value="{$domain}"/>
				<input type="hidden" name="freemailhosting" value="{$freemailhosting}"/>
				<input type="hidden" name="delforwarder" value="true"/>
				<input type="hidden" name="mailtype" value="onlyforwarder"/>
				<input type="hidden" name="forwarder" value="{$forwarder}"/>
				<input type="hidden" name="emailaddress" value="{$emailaddress}"/>
				<input type="submit" value="{$LANG.cartremove}" onclick="return confirmFwdDelete();" class="btn btn-danger btn-sm"/>
			</form>
		</td>
	</tr>
	{/if}
	{/foreach}
</table>

<br  />
<form method="post" action="emailmanagement.php?action=modifyaccount">
	<input type="hidden" name="page" value="{$smarty.post.page}"/>
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<input type="hidden" name="freemailhosting" value="{$freemailhosting}"/>
	<input type="hidden" name="addforwarder" value="true"/>
	<input type="hidden" name="mailtype" value="onlyforwarder"/>
	<input type="hidden" name="emailaddress" value="{$emailaddress}"/>
	<h4>{$LANG.rcmail_inputredirectto}</h4>
	<table class="table table-bordered table-hover">
		<tr>
			<td width="200">
				<strong>{$LANG.rcmail_redirectto}</strong>
			</td>
			<td>
				<textarea class="form-control" name="forwardto" cols="100" rows="5">{if $addforwardererror}{$smarty.post.forwardto}{/if}</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcmail_note}:</strong>
			</td>
			<td>
				{$LANG.rcmail_undeleteableforwarderdesc}
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<p align="center"><input type="submit" value="{$LANG.rcmail_addforwardbutton}" class="btn btn-success"/></p>
			</td>
		</tr>
</table>
</form>
{/if}

{if $ismailaccount}

{include file="$template/includes/alert.tpl" type="info" msg=$LANG.rcmail_modifyemailaccountdesc}

<div class="tab-content margin-bottom">
    <div class="tab-pane fade in active" id="tabModify">
		{if $modifyaccounterror}
		<br />
		<div class="alert alert-danger">
			<p>{$LANG.clientareaerrors}</p>
			<ul>
				{$modifyaccounterror}
			</ul>
		</div>
		{/if}

		{if $modifyaccountsuccess}
		<br />
		<div class="alert alert-success">
			<p>{$LANG.moduleactionsuccess}</p>
			<ul>
				{$modifyaccountsuccess}
			</ul>
		</div>
		{/if}			
		<form method="post" action="emailmanagement.php?action=modifyaccount#tabModify">
			<input type="hidden" name="page" value="{$smarty.post.page}"/>
			<input type="hidden" name="domainid" value="{$domainid}"/>
			<input type="hidden" name="domain" value="{$domain}"/>
			<input type="hidden" name="freemailhosting" value="{$freemailhosting}"/>
			<input type="hidden" name="mailtype" value="mailaccount"/>
			<input type="hidden" name="userdetails" value="true"/>
			<input type="hidden" name="emailaddress" value="{$emailaddress}"/>
			<h4>{$LANG.rcmail_modifypersonaldata}</h4>
			<table class="table table-bordered table-hover">
				<tr>
					<td width="200">
						<strong>{$LANG.clientareafirstname}</strong>
					</td>
					<td>
						<input class="form-control" name="firstname" type="text" value="{if $firstName}{$firstName}{else}{$smarty.post.firstname}{/if}" size="20"/>
					</td>
				</tr>
				<tr>
					<td>
						<strong>{$LANG.clientarealastname}</strong>
					</td>
					<td>
						<input class="form-control" name="lastname" type="text" value="{if $lastName}{$lastName}{else}{$smarty.post.lastname}{/if}" size="20"/>
					</td>
				</tr>
				<tr>
					<td>
						<strong>{$LANG.rcmail_emailaccounttitle}</strong>
					</td>
					<td>
						<input class="form-control" name="noname" type="text" value="{$emailaddress}" disabled="disabled" size="40"/>
					</td>
				</tr>
				<tr>
					<td>
						<strong>{$LANG.rcmail_alternatemailaddress}</strong>
					</td>
					<td>
						<input class="form-control" name="notifymail" type="text" value="{if alternatemailaddr}{$alternatemailaddr}{else}{$smarty.post.alternatemailaddr}{/if}" size="40"/><br/><strong>{$LANG.rcmail_importantnotetitle}</strong>: {$LANG.rcmail_importantnotedesc}
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<p align="center"><input type="submit" value="{$LANG.rcmail_applychangesbutton}"/ class="btn btn-success"></p>
					</td>
				</tr>
			</table>
		</form>	
	</div>

	<div class="tab-pane fade" id="tabChangepwd">
		{if $changepasswderror}
		<br />
		<div class="alert alert-danger">
			<p>{$LANG.clientareaerrors}</p>
			<ul>
				{$changepasswderror}
			</ul>
		</div>
		{/if}
		
		{if $changepasswdsuccess}
		<br />
		<div class="alert alert-success">
			<p>{$LANG.moduleactionsuccess}</p>
			<ul>
				{$changepasswdsuccess}
			</ul>
		</div>
		{/if}

		<form method="post" action="emailmanagement.php?action=modifyaccount#tabChangepwd">
			<input type="hidden" name="page" value="{$smarty.post.page}"/>
			<input type="hidden" name="domainid" value="{$domainid}"/>
			<input type="hidden" name="domain" value="{$domain}"/>
			<input type="hidden" name="freemailhosting" value="{$freemailhosting}"/>
			<input type="hidden" name="mailtype" value="mailaccount"/>
			<input type="hidden" name="changepasswd" value="true"/>
			<input type="hidden" name="emailaddress" value="{$emailaddress}"/>					
			<h4>{$LANG.rcmail_changepasswdtitle}</h4>
			<table class="table table-bordered table-hover">
				{if $changepasswdsuccess}
				<tr>
					<td colspan="2">
						<div class="alert alert-warning">
							<strong>{$LANG.rcmail_yournewpasswdis}:</strong>&nbsp;&nbsp;{$smarty.post.newmailpassword}<br />
						</div>
					</td>
				</tr>
				{/if}
				<tr>
					<td width="200" style="vertical-align:top">
						{$LANG.rcmail_youroldpasswd}
					</td>
					<td style="vertical-align:top">
						<input class="form-control" name="oldmailpassword" type="text" value="{if $changepasswderror}{$smarty.post.oldmailpassword}{/if}" size="20"/>
					</td>
				</tr>
				<tr>
					<td style="vertical-align:top">
						{$LANG.rcmail_yournewpasswd}
					</td>
					<td style="vertical-align:top">
						<input class="form-control" name="newmailpassword" type="text" value="{if $changepasswderror}{$smarty.post.newmailpassword}{/if}" size="20"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<p align="center"><input type="submit" value="{$LANG.rcmail_changepassword}" class="btn btn-success"/></p>
					</td>
				</tr>
			</table>
		</form>	
	</div>

	<div class="tab-pane fade" id="tabResetpwd">
		{if $resetpasswderror}
		<br />
		<div class="alert alert-danger">
			<p>{$LANG.clientareaerrors}</p>
			<ul>
				{$resetpasswderror}
			</ul>
		</div>
		{/if}
		
		{if $resetpasswdsuccess}
		<br />
		<div class="alert alert-success">
			<p>{$LANG.moduleactionsuccess}</p>
			<ul>
				{$resetpasswdsuccess}
			</ul>
		</div>
		{/if}
		
		<form method="post" action="emailmanagement.php?action=modifyaccount#tabResetpwd">
			<input type="hidden" name="page" value="{$smarty.post.page}"/>
			<input type="hidden" name="domainid" value="{$domainid}"/>
			<input type="hidden" name="domain" value="{$domain}"/>
			<input type="hidden" name="freemailhosting" value="{$freemailhosting}"/>
			<input type="hidden" name="mailtype" value="mailaccount"/>
			<input type="hidden" name="resetpasswd" value="true"/>
			<input type="hidden" name="emailaddress" value="{$emailaddress}"/>
			<h4>{$LANG.rcmail_resetmailpasswdtitle}</h4>
			<table class="table table-bordered table-hover">
				<tr>
					<td colspan="2">
						{if $resetpasswdsuccess}
						<div class="alert alert-warning">
							{$LANG.rcmail_yournewpasswdis}:&nbsp;&nbsp;{$resetpasswdoutput}<br />
						</div>
						{else}					
						<div align="center">{$LANG.rcmail_resetmailpasswddesc}</div>
						{/if}
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<p align="center"><input type="submit" value="{$LANG.rcmail_resetmailpasswdbutton}" class="btn btn-success"/></p>
					</td>
				</tr>
			</table>
		</form>	
	</div>
</div>
{/if}
