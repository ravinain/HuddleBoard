<div class="theme1" id="otherInfoData" style="margin-left: 0; margin-right: 0" title="Add Other Info">

<form name="otherInfoDataForm">
<table class="otherInfoTable">
	<tr>
		<th>Category</th>
		<th>Description</th>

	</tr>
	<tr>
		<td>
			<select name="Category">
				<option value="ACHIEVEMENTS">Achievements</option>
				<option value="KAIZEN_IDEAS">Kaizen Ideas</option>
				<option value="OPEN_ISSUES">Open Issues</option>
				<option value="LEAVE_PLANS">Leave Plans</option>
			</select>
		</td>
		<td>
			<textarea rows="3" cols="100" name="Description"  class="validate[required] text-input" 
				data-errormessage-value-missing="* Description field is required!"></textarea>
			<input type="hidden" name="flag">
			<input type="hidden" name="type" value="OTHERINFO">
		</td>
	</tr>
</table>
</form>
</div>