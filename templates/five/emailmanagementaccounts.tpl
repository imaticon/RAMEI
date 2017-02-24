{include file="$template/pageheader.tpl" title=$LANG.rcmail_manageemailaccounts desc=$domain}

<script language="javascript" type="text/javascript">
	function confirmDelete(){literal}{{/literal}return confirm("{$LANG.rcmail_deletewarning}");{literal}}{/literal}
	function confirmSuspend(){literal}{{/literal}return confirm("{$LANG.rcmail_suspendwarning}");{literal}}{/literal}
</script>

{if $maildeletedsuccess}
<br />
<div class="alert alert-success">
    <p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$maildeletedsuccess}
    </ul>
</div>
{/if}

{if $mailsuspendsuccess}
<br />
<div class="alert alert-success">
	<p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$mailsuspendsuccess}
    </ul>
</div>
{/if}

{if $mailunsuspendsuccess}
<br />
<div class="alert alert-success">
    <p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$mailunsuspendsuccess}
    </ul>
</div>
{/if}

{if $deletemailresponseerror}
<br />
<div class="alert alert-error">
	<p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$deletemailresponseerror}
    </ul>
</div>
{/if}

<div class="searchbox">
    <form method="post" action="emailmanagement.php?action=manageemails">
		<div class="input-append">
        <input type="text" name="q" value="{if $q}{$q}{else}{$LANG.rcmail_searchentercriteria}{/if}" class="input-medium appendedInputButton" onfocus="if(this.value=='{$LANG.rcmail_searchentercriteria}')this.value=''" />
		<input type="hidden" name="page" value="{$pagenumber}"/>
		<input type="hidden" name="domainid" value="{$domainid}"/>
		<input type="hidden" name="domain" value="{$domain}"/>
		<input name="freemailhosting" value="{$freemailhosting}" type="hidden"/>
        <input type="submit" value="{$LANG.searchfilter}" class="btn btn-info" />
		</div>
    </form>
</div>

<br />

<p>{$numproducts} {$LANG.recordsfound}, {$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</p>

<br />
<script language="javascript" type="text/javascript">
	{literal}
		jQuery(document).ready(function() {
			jQuery("#select-all-email").click(function() {
				var checkBoxes = jQuery("input[name=multiaction\\[\\]]");
				checkBoxes.prop("checked", !checkBoxes.prop("checked"));
			});                 
		});	
	{/literal}
</script>

<table class="table table-striped table-framed">
    <thead>
        <tr>
			<th {if $orderby eq "emailAddress"} class="headerSort{$sort}"{/if}><a href="emailmanagement.php?action=manageemails{if $q}&q={$q}{/if}&orderby=emailAddress&domainid={$domainid}&domain={$domain}&freemailhosting={$freemailhosting}&sort={if $sort eq "desc"}asc{else}desc{/if}&page={$pagenumber}&itemlimit={$itemlimit}">{$LANG.rcmail_mailaccounttitle}</a></th>
			<th {if $orderby eq "accountType"} class="headerSort{$sort}"{/if}><a href="emailmanagement.php?action=manageemails{if $q}&q={$q}{/if}&orderby=accountType&domainid={$domainid}&domain={$domain}&freemailhosting={$freemailhosting}&sort={if $sort eq "desc"}asc{else}desc{/if}&page={$pagenumber}&itemlimit={$itemlimit}">{$LANG.rcmail_mailaccounttypetitle}</a></th>
			<th {if $orderby eq "status"} class="headerSort{$sort}"{/if}><a href="emailmanagement.php?action=manageemails{if $q}&q={$q}{/if}&orderby=status&domainid={$domainid}&domain={$domain}&freemailhosting={$freemailhosting}&sort={if $sort eq "desc"}asc{else}desc{/if}&page={$pagenumber}&itemlimit={$itemlimit}">{$LANG.rcmail_mailaccountstatus}</a></th>
			<th {if $orderby eq "quotaUsed"} class="headerSort{$sort}"{/if}><a href="emailmanagement.php?action=manageemails{if $q}&q={$q}{/if}&orderby=quotaUsed&domainid={$domainid}&domain={$domain}&freemailhosting={$freemailhosting}&sort={if $sort eq "desc"}asc{else}desc{/if}&page={$pagenumber}&itemlimit={$itemlimit}">{$LANG.rcmail_mailaccountcuota}</a></th>
			<th colspan="3"><a href="#" onclick="return false">{$LANG.rcmail_mailactions}</a></th>
			<th><input id="select-all-email" type="checkbox" /></th>
		</tr>
	</thead>
	<tbody>
		{foreach key=num item=service from=$searchdataKey}
		<tr>
			<td>
				<div style="width: 180px; word-wrap: break-word;">{$service.emailAddress}</div>
			</td>
			<td>
				{if $iscatchallactive eq $service.emailAddress}{$LANG.rcmail_catchalladdress}
				{elseif $service.accountType eq "POP_WITH_AUTORESPONDER"}{$LANG.rcmail_mailwithautoresponder}
				{elseif $service.accountType eq "POP_WITHOUT_AUTORESPONDER"}{$LANG.rcmail_mailwithoutautoresponder}
				{elseif $service.accountType eq "FORWARD_ONLY"}{$LANG.rcmail_mailonlyfwd}
				{/if}			
			</td>
			<td>
				{if $service.status eq "ACTIVE"}<span class="label active">{$LANG.clientareaactive}</span>{else}<span class="label suspended">{$LANG.clientareasuspended}</span>{/if}
			</td>
			<td>
				{$service.quotaUsed} Kb / {$service.percentageQuotaUsage}%			
			</td>
			<td>
				<form method="post" action="emailmanagement.php?action=modifyaccount">
					<input type="hidden" name="page" value="{$pagenumber}"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input name="freemailhosting" value="{$freemailhosting}" type="hidden"/>
					<input type="hidden" name="emailaddress" value="{$service.emailAddress}"/>
					<input type="hidden" name="mailtype" value="{if $service.accountType eq "FORWARD_ONLY"}onlyforwarder{else}mailaccount{/if}"/>
					<input type="submit" value="{$LANG.rcmail_modifyemailbutton}" class="btn btn-info"/>
				</form>
			</td>
			<td>
				<form method="post" action="emailmanagement.php?action=manageemails" onclick="return confirmDelete();">
					<input type="hidden" name="delete" value="true"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input name="freemailhosting" value="{$freemailhosting}" type="hidden"/>
					<input type="hidden" name="emailaddress" value="{$service.emailAddress}"/>
					<input type="hidden" name="page" value="{$pagenumber}"/>
					<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
					<input type="hidden" name="q" value="{$q}"/>
					<input type="submit" value="{$LANG.rcmail_deletebutton}" class="btn btn-danger"/>
				</form>
			</td>
			<td>
				<form method="post" action="emailmanagement.php?action=manageemails" {if $service.status eq "ACTIVE"}onclick="return confirmSuspend();{/if}">
					<input type="hidden" name="{if $service.status eq "ACTIVE"}suspend{else}unsuspend{/if}" value="true"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input name="freemailhosting" value="{$freemailhosting}" type="hidden"/>
					<input type="hidden" name="emailaddress" value="{$service.emailAddress}"/>
					<input type="hidden" name="page" value="{$pagenumber}"/>
					<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
					<input type="hidden" name="q" value="{$q}"/>
					<input type="submit" value="{if $service.status eq "ACTIVE"}{$LANG.rcmail_suspendbutton}{else}{$LANG.rcmail_unsuspendbutton}{/if}" class="btn"/>
				</form>
			</td>
			<td><input name="multiaction[]" type="checkbox" value="{$service.emailAddress}" class="checkbox"/></td>
		</tr>
		{foreachelse}
		<tr>
			<td align="left" colspan="8">
				{$LANG.norecordsfound}
			</td>
		</tr>
		{/foreach}
		<tr>
			<td colspan="8">
				{if $searchdataKey}
				<div style="float:right;">
					<form id="multiaction" method="post" action="emailmanagement.php?action=manageemails">
						<input type="hidden" name="domain" value="{$domain}"/>
						<input type="hidden" name="domainid" value="{$domainid}"/>
						<input name="freemailhosting" value="{$freemailhosting}" type="hidden"/>
						<input type="hidden" name="page" value="{$pagenumber}"/>
						<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
						<input type="hidden" name="q" value="{$q}"/>
						<input type="submit" name="mdelete" value="{$LANG.rcmail_multideletebutton}" class="btn btn-danger" onclick="return confirmDelete();" />
						<input type="submit" name="msuspend" value="{$LANG.rcmail_multisuspendbutton}" class="btn" onclick="return confirmSuspend();" />
					</form>
				</div>
				{/if}
				{if $q neq ""}
				<div style="float:left;">
					<form method="post" action="emailmanagement.php?action=manageemails">
						<input type="hidden" name="page" value="{$pagenumber}"/>
						<input type="hidden" name="q" value=""/> 
						<input type="hidden" name="domainid" value="{$domainid}"/>
						<input type="hidden" name="domain" value="{$domain}"/>
						<input name="freemailhosting" value="{$freemailhosting}" type="hidden"/>
						<input type="submit" value="{$LANG.rcmail_deletesearchquerybutton}" class="btn"/>
					</form>
				</div>
				{/if}				
			</td>
		</tr>
	</tbody>
</table>

<br >
<script language="javascript" type="text/javascript">
	{literal}
		jQuery('#multiaction').on('submit',function(e){
			$form=jQuery(this);
			jQuery('input[type=checkbox]:checked').each(function(index,elem){
				var val=jQuery(elem).val(),name=jQuery(elem).attr('name');
				var hiddenInput=jQuery('<input type="hidden" value="'+val+'" name="'+name+'"/>');
				$form.append(hiddenInput);
			});
		});
	{/literal}
</script>

<div class="recordslimit">
	<form action="emailmanagement.php">
		<input type="hidden" name="action" value="manageemails" />
		<input type="hidden" name="page" value="{$pagenumber}"/>
		<select name="itemlimit" id="itemlimit" onchange="this.form.submit();">
			<option>{$LANG.resultsperpage}</option>
			<option value="10"{if $itemlimit==10} selected{/if}>10</option>
			<option value="25"{if $itemlimit==25} selected{/if}>25</option>
			<option value="50"{if $itemlimit==50} selected{/if}>50</option>
			<option value="100"{if $itemlimit==100} selected{/if}>100</option>
			<option value="all"{if $itemlimit > 100} selected{/if}>{$LANG.clientareaunlimited}</option>
		</select>
		<input type="hidden" name="domainid" value="{$domainid}" />
		<input type="hidden" name="domain" value="{$domain}" />
		<input type="hidden" name="freemailhosting" value="{$freemailhosting}" />
	</form>
</div>

<div class="pagination">
    <ul>
		<li class="prev{if !$prevpage} disabled{/if}"><a href="{if $prevpage}emailmanagement.php?action=manageemails{if $q}&q={$q}{/if}&amp;page={$prevpage}&domainid={$domainid}&domain={$domain}&freemailhosting={$freemailhosting}&itemlimit={$itemlimit}{else}javascript:return false;{/if}">&larr; {$LANG.previouspage}</a></li>
        <li class="next{if !$nextpage || $nextpage==$pageend} disabled{/if}"><a href="{if $nextpage != $pageend}emailmanagement.php?action=manageemails{if $q}&q={$q}{/if}&amp;page={$nextpage}&domainid={$domainid}&domain={$domain}&freemailhosting={$freemailhosting}&itemlimit={$itemlimit}{else}javascript:return false;{/if}">{$LANG.nextpage} &rarr;</a></li>
    </ul>
</div>

<br />

<form method="post" action="emailmanagement.php?action=managemailhosting">
	<input type="hidden" name="page" value="{$pagenumber}"/>
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<input name="freemailhosting" value="{$freemailhosting}" type="hidden"/>
	<p align="center"><input type="submit" value="{$LANG.clientareabacklink}" class="btn"/></p>
</form>
