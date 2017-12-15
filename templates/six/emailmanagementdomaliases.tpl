<script language="javascript" type="text/javascript">
	function confirmDaliasDelete(){literal}{{/literal}return confirm("{$LANG.rcmail_deletedomainalias}");{literal}}{/literal}
</script>

{include file="$template/includes/alert.tpl" type="info" msg=$LANG.rcmail_managedomaliasedesc}

<div>
	{if $deldomaliaserror}
	<br />
	<div class="alert alert-danger">
		<p>{$LANG.clientareaerrors}</p>
		<ul>
			{$deldomaliaserror}
		</ul>
	</div>
	{/if}

	{if $deldomaliassuccess}
	<br />
	<div class="alert alert-success">
		<p>{$LANG.moduleactionsuccess}</p>
		<ul>
			{$deldomaliassuccess}
		</ul>
	</div>
	{/if}

	{if $adddomaliaserror}
	<br />
	<div class="alert alert-danger">
		<p>{$LANG.clientareaerrors}</p>
		<ul>
			{$adddomaliaserror}
		</ul>
	</div>
	{/if}

	{if $adddomaliassuccess}
	<br />
	<div class="alert alert-success">
		<p>{$LANG.moduleactionsuccess}</p>
		<ul>
			{$adddomaliassuccess}
		</ul>
	</div>
	{/if}

	<table class="table table-bordered table-hover">
		<tr>
			<td colspan="2">
				<h4>{$LANG.rcmail_domainaliasesactualtitle}</h4>
			</td>
		</tr>
		{if $domainaliases}
			{foreach key=num item=domainalias from=$domainaliases}
			<tr>
				<td>
					{$domainalias}
				</td>
				<td>
					<form method="post" action="emailmanagement.php?action=managedomainaliases">
						<input type="hidden" name="page" value="{$smarty.post.page}"/>
						<input type="hidden" name="domainid" value="{$domainid}"/>
						<input type="hidden" name="domain" value="{$domain}"/>
						<input type="hidden" name="freemailhosting" value="{$freemailhosting}"/>
						<input type="hidden" name="deletedomainalias" value="true"/>
						<input type="hidden" name="mailtype" value="{$mailtype}"/>
						<input type="hidden" name="isdomainalias" value="{$domainalias}"/>
						<input type="submit" value="{$LANG.cartremove}" onclick="return confirmDaliasDelete();" class="btn btn-danger btn-sm"/>
					</form>
				</td>
			</tr>
			{/foreach}			
		{else}
			<tr>
				<td>
					{$LANG.rcmail_domainaliasesadddesc}
				</td>
			</tr>			
		{/if}
	</table>

	<br />

	<form method="post" action="emailmanagement.php?action=managedomainaliases">
		<input type="hidden" name="page" value="{$smarty.post.page}"/>
		<input type="hidden" name="domainid" value="{$domainid}"/>
		<input type="hidden" name="domain" value="{$domain}"/>
		<input type="hidden" name="freemailhosting" value="{$freemailhosting}"/>
		<input type="hidden" name="adddomainalias" value="true"/>
		<input type="hidden" name="mailtype" value="{$mailtype}"/>
		<h4>{$LANG.rcmail_domainaliasestitle}</h4>
		<table class="table table-bordered table-hover">
			<tr>
				<td width="200">
					<strong>{$LANG.rcmail_recordalias}</strong>
				</td>
				<td>
					<input type="text" class="form-control" name="isdomainalias" value="{if $isdomainalias}{$isdomainalias}{/if}" />
				</td>
			</tr>
			<tr>
				<td>
					<strong>{$LANG.rcmail_note}:</strong>
				</td>
				<td>
					<ol>
						<li>{$LANG.rcmail_domainaliasesadddesc1}</li>
						<li>{$LANG.rcmail_domainaliasesadddesc2}</li>

						<br />

						<div>
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>
											<strong><u>{$LANG.rcmail_recordpriority}</u></strong>
										</th>
										<th>
											<strong><u>{$LANG.rcmail_recordhostdomain}</u></strong>
										</th>
										<th>
											<strong><u>{$LANG.rcmail_recordmx}</u></strong>
										</th>
										<th>
											<strong><u>{$LANG.rcmail_recordttl}</u></strong>
										</th>
									</tr>
								</thead>
								<tbody>
									{foreach key=num item=service from=$mxrecords}
										<tr>
											<td>
												{$service.priority}
											</td>
											<td>
												&lt;domainalias&gt;
											</td>
											<td>
												{$service.value}
											</td>
											<td>
												86400 {$LANG.rcmail_recordseconds}
											</td>
										</tr>
									{foreachelse}
										<tr>
											<td colspan="4">
												{$LANG.rcmail_dnsrecsnotavailableyet}
											</td>
										</tr>
									{/foreach}
								</tbody>
							</table>
						</div>
					</ol>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<p align="center"><input type="submit" value="{$LANG.rcmail_adddomainaliasbutton}" class="btn btn-success"/></p>
				</td>
			</tr>
	</table>
	</form>
</div>
