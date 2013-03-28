<div class="page-header">
	<h2>{$page->title}</h2>
</div>

{if $spotnab|@count > 0}

<table class="data Sortable highlight table table-striped">

	<tr>
		<th>source description</th>
		<th>current status</th>
		<th>comments</th>
		<th>last broadcast</th>
		<th>last update</th>
		<th>options</th>
	</tr>

	{foreach from=$spotnab item=source}
	<tr class="{cycle values=",alt"}">
		<td><a href="{$smarty.const.WWW_TOP}/spotnab-edit.php?id={$source.ID}">{$source.description}</a></td>
		<td><a href="{$smarty.const.WWW_TOP}/spotnab-list.php?id={$source.ID}&toggle={if $source.active=="1"}0{else}1{/if}" {if $source.active=="0"}style="color: #ce0000;"{/if}>{if $source.active=="1"}active{else}inactive{/if}</a></td>
		<td>{$source.comments}</td>
		<td>
			{if $source.lastbroadcast != null}
				{$source.lastbroadcast}
			{else}
				n/a
			{/if}
		</td>
		<td>
			{if $source.lastupdate != null}
				{$source.lastupdate}
			{else}
				n/a
			{/if}
		</td>
		<td>
			<div class="btn-group">
				<a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/spotnab-edit.php?id={$source.ID}">edit</a> 
				<a class="btn btn-mini btn-danger" href="{$smarty.const.WWW_TOP}/spotnab-delete.php?id={$source.ID}">delete</a>
			</div>
		</td>		
	</tr>
	{/foreach}

</table>
{else}
	<div class="alert">
	    <button type="button" class="close" data-dismiss="alert">&times;</button>
	    <h4>Sorry!</h4>
	        No available sources. <a href="spotnab-edit.php?action=add">Add one?</a>
	</div>
{/if}
