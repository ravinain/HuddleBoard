<div class="theme1" id="queriesData" style="margin-left: 0; margin-right: 0" title="Add new Query">

<form name="queriesDataForm">
<table class="queriesTable">
	<tr>
		<th>Title</th>
		<th>Application</th>
		<th>Status</th>
		<th>Assigned To</th>
	</tr>
	<tr>
		<td>
			<input type="text" name="Title" class="validate[required]  text-input"
				data-errormessage-value-missing="* Title field is required!">
		</td>
		<td>
			<select name="Application" class="validate[required]"
				data-errormessage-value-missing="* Application field is required!">
				<option value="App1">App1</option>
				<option value="App2">App2</option>		
				<option value="App3">App3</option>		
				<option value="App4">App4</option>		
				<option value="App5">App5</option>					
			</select>
		</td>
		<td>
			<select name="Status" class="validate[required]" 
				data-prompt-position="bottomLeft"
				data-errormessage-value-missing="* Status is required!">
				<option value="">...</option>
				<option value="Status1">Status1</option>
				<option value="Status2">Status2</option>		
				<option value="Status3">Status3</option>		
				<option value="Status4">Status4</option>		
				<option value="Status5">Status5</option>					
			</select>
		</td>
		<td>
			<select name="AssignedTo" class="validate[required]" 
				data-prompt-position="bottomLeft"
				data-errormessage-value-missing="* Assigned To field is required!">
				<option value="">...</option>
				<option value="user1">user1</option>
				<option value="user2">user2</option>		
				<option value="user3">user3</option>		
			</select>
		</td>
	</tr>
	<tr>
		<th>Percentage</th>
		<th>End Date</th>
		<th>Efforts</th>
	</tr>
	<tr>
		<td>
			<input type="text" name="Percentage" class="validate[required, custom[number]] text-input"
				data-errormessage-value-missing="* Percentage field is required!" 
    			data-errormessage-custom-error="* Invalid percentage!">
		</td>
		<td>
			<input type="text" name="EndDate" class="validate[custom[date]] text-input"
    			data-errormessage-custom-error="* Invalid Date!">
		</td>
		<td>
			<input type="text" name="Efforts" class="custom[number] text-input"
				data-errormessage-value-missing="* Efforts field is required!" 
    			data-errormessage-custom-error="* Invalid Efforts!">
			<input type="hidden" name="flag">
			<input type="hidden" name="type" value="QUERIES">
		</td>
	</tr>
</table>
</form>
</div>