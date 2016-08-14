<div class="theme1" id="defectsData" style="margin-left: 0; margin-right: 0" title="Add new Defect">

<form name="defectsDataForm">
<table class="defectsTable">
	<tr>
		<th>ID</th>
		<th>Application</th>
		<th>Severity</th>
		<th>Status</th>
		<th>Assigned To</th>
		<th>Efforts</th>
	</tr>
	<tr>
		<td>
			<input type="text" name="ID" class="validate[required, custom[onlyLetterNumber]]  text-input"
				data-errormessage-value-missing="* ID field is required!" 
    			data-errormessage-custom-error="* Invalid ID!"> 
		</td>
		<td>
			<select name="Application" class="validate[required]"
				data-errormessage-value-missing="* Application field is required!">
				<option value="">...</option>
				<option value="App1">App1</option>
				<option value="App2">App2</option>		
				<option value="App3">App3</option>		
				<option value="App4">App4</option>		
				<option value="App5">App5</option>					
			</select>
		</td>
		<td>
			<select name="Severity">
				<option value="Sev1">Sev1</option>
				<option value="Sev2">Sev2</option>
				<option value="Sev3">Sev3</option>
				<option value="Sev4">Sev4</option>
				<option value="Sev5">Sev5</option>
			</select>
		</td>
		<td>
			<select name="Status">
				<option value="New">New</option>
				<option value="In Analysis">In Analysis</option>
				<option value="In Development">In Development</option>
				<option value="Fixed">Fixed</option>
				<option value="In System Testing">In System Testing</option>
				<option value="Delivered to Prod">Delivered to Prod</option>
				<option value="Retest">Retest</option>
			</select>
		</td>
		<td>
			<select name="AssignedTo" class="validate[required]" 
				data-errormessage-value-missing="* Assigned To field is required!">
				<option value="">...</option>
				<option value="user1">user1</option>
				<option value="user2">user2</option>		
				<option value="user3">user3</option>		
			</select>
		</td>
		<td>
			<input type="text" name="Efforts" class="validate[required] custom[number] text-input"
				data-errormessage-value-missing="* Efforts field is required!" 
    			data-errormessage-custom-error="* Invalid Efforts!">
		</td>
	</tr>
	<tr>
		<th>Commit Status</th>
		<th>SLA Date</th>
		<th>Release Date</th>
		<th>Fixed/Cancelled Date</th>
		<th>RCA</th>
	</tr>
	<tr>
		<td>
			<select name="Committed">
				<option value="Committed">Committed</option>
				<option value="Not Committed">Not Committed</option>
			</select>
		</td>
		<td>
			<input type="text" name="SLADate" class="validate[required, custom[date]] text-input"
    			data-errormessage-custom-error="* Invalid Date!">
		</td>
		<td>
			<input type="text" name="ReleaseDate" class="validate[required, custom[date]] text-input"
    			data-errormessage-custom-error="* Invalid Date!">
		</td>
		<td>
			<input type="text" name="FixCancelDate" class="validate[required, custom[date]] text-input"
    			data-errormessage-custom-error="* Invalid Date!">
		</td>
		<td>
			<input type="text" name="RCA" class="validate[required] text-input"
    			data-errormessage-value-missing="* RCA field is required!" />
			<input type="hidden" name="flag">
			<input type="hidden" name="type" value="DEFECTS">
		</td>
	</tr>
</table>
</form>
</div>