<div class="theme1" id="ticketsData" style="margin-left: 0; margin-right: 0" title="Add new Ticket">

<form name="ticketsDataForm">
<table class="ticketsTable">
	<tr>
		<th>ID</th>
		<th>Application</th>
		<th>Priority</th>
		<th>Status</th>
		<th>Assigned To</th>
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
				<option value="App1">App1</option>
				<option value="App2">App2</option>		
				<option value="App3">App3</option>		
				<option value="App4">App4</option>		
				<option value="App5">App5</option>					
			</select>
		</td>
		<td>
			<select name="Priority">
				<option value="P1">P1</option>
				<option value="P2">P2</option>		
				<option value="P3">P3</option>		
				<option value="P4">P4</option>		
				<option value="P5">P5</option>					
			</select>
		</td>
		<td>
			<select name="Status">
				<option value="New">New</option>
				<option value="In Analysis">In Analysis</option>		
				<option value="Closed">Closed</option>		
			</select>
		</td>
		<td>
			<select name="AssignedTo" class="validate[required]" 
				data-prompt-position="bottomLeft"
				data-errormessage-value-missing="* Assigned To field is required!">
				<option value="u1">u1</option>
				<option value="u2">u2</option>		
				<option value="u3">u3</option>		
			</select>
		</td>
	</tr>
	<tr>
		<th>SLA Date</th>
		<th>Closed Date</th>
		<th>RCA</th>
		<th>Efforts</th>
	</tr>
	<tr>
		<td>
			<input type="text" name="SLADate" class="validate[custom[date]] text-input"
			data-errormessage-value-missing="* SLA Date field is required!" 
    			data-errormessage-custom-error="* Invalid Date!">
		</td>
		<td>
			<input type="text" name="ClosedDate" class="validate[custom[date]] text-input"
    			data-errormessage-custom-error="* Invalid Date!">
		</td>
		<td>
			<input type="text" name="RCA">
		</td>
		<td>
			<input type="text" name="Efforts" class="validate[required] custom[number] text-input"
				data-errormessage-value-missing="* Efforts field is required!" 
    			data-errormessage-custom-error="* Invalid Efforts">
			<input type="hidden" name="flag">
			<input type="hidden" name="type" value="TICKETS">
		</td>
	</tr>
</table>
</form>
</div>