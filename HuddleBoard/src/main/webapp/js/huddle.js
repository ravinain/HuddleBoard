function expandCollapse(obj, destId) {
	var expandFlag = obj.src.indexOf('expand')!= -1?true:false;
	if(expandFlag) {
		$( "#"+destId ).fadeTo("slow", 1);
		obj.src='images/collapse.png';
	} else {
		$( "#"+destId ).fadeOut("slow", 0);
		obj.src='images/expand.png';
	}
	
}

/*
 * deleteData(currentRowObj, data from which table needs to be deleted)
 */
function deleteData(obj, delName) { 
	showDeleteBox(obj, delName);
}

function showDeleteBox(obj, delName) {
	createDeleteDialogBox(obj, delName);
	$('#deleteBox').show();
	$('#deleteBox').dialog("open");
}

function createDeleteDialogBox(obj, delName) { 
  $("#deleteBox").dialog({
      autoOpen: false,
      height: 180,
      width: 430,
      modal: true,
      closeOnEscape: true,
      buttons: {
        "Yes": {
        	text : 'Yes',
        	'class' : 'dialogBtn',
        	click : function() {
        		$( this ).dialog( "close" );
        		callDeleteFunction(obj, delName);
        	}
        },
        "No" : {
        	text : 'No',
        	'class' : 'dialogBtn',
        	click : function() {
        		$( this ).dialog( "close" );
        	}
        }
      }
  });
}

function addNew(type) {
	createAddDialogBox(type);
	
	$('input[readonly]').each(function() 
	{
	    $(this).removeAttr('readonly');
	});
	
	$('select').each(function() 
	{
	    $(this).removeAttr('selectedIndex ');
	    $(this).removeAttr('defaultIndex ');
	    $(this).removeAttr('onfocus ');
	    $(this).removeAttr('onchange ');
	});

	$("#"+type).show();
	$("#"+type).dialog("open");
}

function createAddDialogBox(type) {
	$("#" + type).dialog({
		autoOpen : false,
		height : 300,
		width : 1000,
		modal : true,
		title : "Add Data",
		buttons : {
			"Add" : {
				text : 'Add',
				'class' : 'dialogBtn',
				click : function() {
					if($('form[name='+type+'Form]').validationEngine('validate')){
						showLoadingBox();
						addDataFunction(type);
					}
				}
	
			},
			"Cancel" : {
				text : 'Cancel',
				'class' : 'dialogBtn',
				click : function() {
					$(this).dialog("close");
				}
			}
		}

	});
}

function addDataFunction(type){
	document.forms[type+'Form'].flag.value = "ADD";
	var formData = $('form[name='+type+'Form]').serialize();
	
	var request = $.ajax({
						url : 'huddleController',	
						method : 'post',
						data : formData,
						cache : false
					});
	request.done(function(response){
		$('#loadingBox').dialog("close");
		var response = eval('('+response+')');
		if (response["message"] == 'success') {
			var formVar = $('form[name='+type+'Form]');
			var formType = $(formVar).find("input[name=type]").val();
			 
			if (formType =='PROJECTS') {
				createPMTRow(formVar);
			}
			else if (formType =='RDS') {
				createRDRow(formVar);
			}
			else if (formType =='DEFECTS') {
				createDefectRow(formVar);
			}
			else if (formType =='TICKETS') {
				createTicketsRow(formVar);
			}
			else if (formType =='QUERIES') {
				createQueryRow(formVar, response["id"]);
			}
			else if (formType =='OTHERINFO') {
				addType = 'Information';
			}
		}
		else
			alert(response);
		$('#'+type).dialog("close");
	
	});
	request.fail(errorHandler);
}

function createPMTRow (formVar) {
	alert("Project has been added successfully!");
	
	var trLen = $("#pmtTableId table tr").length - 1;	
	
	var trContent = "<tr>";
	trContent += "<td>" + $(formVar).find("input[name=ID]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=Title]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("select[name=Application]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("select[name=Status]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("select[name=AssignedTo]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=Percentage]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=Estimates]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=UsedHours]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=ReleaseDate]").val() + "</td>";
	trContent += "<td class='actionCell'>";
	trContent += "<img src='images/edit.png' onclick=updData('pmtData','pmtForm" + trLen + "') />";
	trContent += "<img src='images/delete.png' onclick=deleteData(this.parentNode.parentNode,'pmtForm" + trLen + "') />";
	trContent += "<form name='pmtForm" + trLen + "'>";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=ID]").val() + "' name='ID' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=Title]").val() + "' name='Title' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("select[name=Application]").val() + "' name='Application' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("select[name=Status]").val() + "' name='Status' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("select[name=AssignedTo]").val() + "' name='AssignedTo' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=Percentage]").val() + "' name='Percentage' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=Estimates]").val() + "' name='Estimates' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=UsedHours]").val() + "' name='UsedHours' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=ReleaseDate]").val() + "' name='ReleaseDate' />";
	trContent += "<input type='hidden' value='' name='flag' />";
	trContent += "<input type='hidden' value='PROJECTS' name='type' />";
	trContent += "</form>";
	trContent += "</td>";
	trContent += "</tr>";
	$("#pmtTableId table tr").eq(trLen-1).after(trContent);
}

function createRDRow (formVar) {
	alert("RD has been added successfully!");
	
	var trLen = $("#rdsTableId table tr").length - 1;

	var trContent = "<tr>";
	trContent += "<td>" + $(formVar).find("input[name=ID]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=Title]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("select[name=Application]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("select[name=Status]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=ScheduledDate]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=ActualDate]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=Estimates]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=UsedHours]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("select[name=AssignedTo]").val() + "</td>";
	trContent += "<td class='actionCell'>";
	trContent += "<img src='images/edit.png' onclick=updData('rdsData','rdsForm" + trLen + "') />";
	trContent += "<img src='images/delete.png' onclick=deleteData(this.parentNode.parentNode,'rdsForm" + trLen + "') />";
	trContent += "<form name='rdsForm" + trLen + "'>";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=ID]").val() + "' name='ID' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=Title]").val() + "' name='Title' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("select[name=Application]").val() + "' name='Application' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("select[name=Status]").val() + "' name='Status' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=ScheduledDate]").val() + "' name='ScheduledDate' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=ActualDate]").val() + "' name='ActualDate' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=Estimates]").val() + "' name='Estimates' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=UsedHours]").val() + "' name='UsedHours' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("select[name=AssignedTo]").val() + "' name='AssignedTo' />";
	trContent += "<input type='hidden' value='' name='flag' />";
	trContent += "<input type='hidden' value='RDS' name='type' />";
	trContent += "</form>";
	trContent += "</td>";
	trContent += "</tr>";
	$("#rdsTableId table tr").eq(trLen-1).after(trContent);
}

function createDefectRow (formVar) {
	alert("Defect has been added successfully!");
	
	var trLen = $("#defectsTableId table tr").length - 1;	
	
	var trContent = "<tr>";
	trContent += "<td>" + $(formVar).find("input[name=ID]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("select[name=Application]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("select[name=Severity]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("select[name=Status]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("select[name=AssignedTo]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=Efforts]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("select[name=Committed]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=SLADate]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=ReleaseDate]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=FixCancelDate]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=RCA]").val() + "</td>";
	trContent += "<td class='actionCell'>";
	trContent += "<img src='images/edit.png' onclick=updData('defectsData','defectsForm" + trLen + "') />";
	trContent += "<img src='images/delete.png' onclick=deleteData(this.parentNode.parentNode,'defectsForm" + trLen + "') />";
	trContent += "<form name='defectsForm" + trLen + "'>";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=ID]").val() + "' name='ID' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("select[name=Application]").val() + "' name='Application' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("select[name=Severity]").val() + "' name='Severity' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("select[name=Status]").val() + "' name='Status' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("select[name=AssignedTo]").val() + "' name='AssignedTo' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=Efforts]").val() + "' name='Efforts' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("select[name=Committed]").val() + "' name='Committed' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=SLADate]").val() + "' name='SLADate' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=ReleaseDate]").val() + "' name='ReleaseDate' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=FixCancelDate]").val() + "' name='FixCancelDate' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=RCA]").val() + "' name='RCA' />";
	
	trContent += "<input type='hidden' value='' name='flag' />";
	trContent += "<input type='hidden' value='DEFECTS' name='type' />";
	trContent += "</form>";
	trContent += "</td>";
	trContent += "</tr>";
	$("#defectsTableId table tr").eq(trLen-1).after(trContent);
}

function createTicketsRow (formVar) {
	alert("Ticket has been added successfully!");
	
	var trLen = $("#ticketsTableId table tr").length - 1;	
	alert(trLen);	
	var trContent = "<tr>";
	trContent += "<td>" + $(formVar).find("input[name=ID]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("select[name=Application]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("select[name=Priority]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("select[name=Status]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("select[name=AssignedTo]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=SLADate]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=ClosedDate]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=RCA]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=Efforts]").val() + "</td>";
	trContent += "<td class='actionCell'>";
	trContent += "<img src='images/edit.png' onclick=updData('ticketsData','ticketsForm" + trLen + "') />";
	trContent += "<img src='images/delete.png' onclick=deleteData(this.parentNode.parentNode,'ticketsForm" + trLen + "') />";
	trContent += "<form name='ticketsForm" + trLen + "'>";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=ID]").val() + "' name='ID' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("select[name=Application]").val() + "' name='Application' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("select[name=Priority]").val() + "' name='Priority' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("select[name=Status]").val() + "' name='Status' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("select[name=AssignedTo]").val() + "' name='AssignedTo' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=SLADate]").val() + "' name='SLADate' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=ClosedDate]").val() + "' name='ClosedDate' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=RCA]").val() + "' name='RCA' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=Efforts]").val() + "' name='Efforts' />";
	
	trContent += "<input type='hidden' value='' name='flag' />";
	trContent += "<input type='hidden' value='TICKETS' name='type' />";
	trContent += "</form>";
	trContent += "</td>";
	trContent += "</tr>";
	alert(trContent);
	$("#ticketsTableId table tr").eq(trLen-1).after(trContent);
}

function createQueryRow (formVar, idVal) {
	alert("Query has been added successfully!"+idVal);
	
	var trLen = $("#queriesTableId table tr").length - 1;	
	
	var trContent = "<tr>";
	trContent += "<td>" + $(formVar).find("input[name=Title]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("select[name=Application]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("select[name=Status]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("select[name=AssignedTo]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=Percentage]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=EndDate]").val() + "</td>";
	trContent += "<td>" + $(formVar).find("input[name=Efforts]").val() + "</td>";
	trContent += "<td class='actionCell'>";
	trContent += "<img src='images/edit.png' onclick=updData('queriesData','queriesForm" + trLen + "') />";
	trContent += "<img src='images/delete.png' onclick='deleteData(this, \'queriesForm" + trLen + "')' />";
	trContent += "<form name='queriesForm" + trLen + "'>";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=Title]").val() + "' name='Title' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("select[name=Application]").val() + "' name='Application' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("select[name=Status]").val() + "' name='Status' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("select[name=AssignedTo]").val() + "' name='AssignedTo' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=Percentage]").val() + "' name='Percentage' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=EndDate]").val() + "' name='EndDate' />";
	trContent += "<input type='hidden' value='" + $(formVar).find("input[name=Efforts]").val() + "' name='Efforts' />";
	
	trContent += "<input type='hidden' value='' name='flag' />";
	trContent += "<input type='hidden' value='QUERIES' name='type' />";
	trContent += "<input type='hidden' value='"+idVal+"' name='id' />";
	trContent += "</form>";
	trContent += "</td>";
	trContent += "</tr>";
	//****************************************************************
	
	$("#queriesTableId table tr").eq(trLen-1).after(trContent);
}

function updData(type,formName) {
	createUpdDialogBox(type,formName);
	populateUpdateData(type,formName);
	$("#"+type).show();
	$("#"+type).dialog("open");
}

function createUpdDialogBox(type,formName) {
	  $("#"+type).dialog({
	      autoOpen: false,
	      height: 250,
	      width: 1000,
	      modal: true,
	      title: "Update Data",
	      buttons: {
	        "Update" : {
	        	text : 'Update',
	        	'class' : 'dialogBtn',
	        	click : function() {
	        		$( this ).dialog( "close" );
	        		updateDataFunction(type,formName);
	        	}
	        },
	        "Cancel": {
	        	text : 'Cancel',
	        	'class' : 'dialogBtn',
	        	click : function() {
	        		$( this ).dialog( "close" );
	        	}
	        }
	      }
	        
	  });
	}

function populateUpdateData(type,formName) { alert(type); alert(formName);
	updForm = document.forms[type+"Form"];
	dataForm = document.forms[formName];
	if (type=='pmtData') {
		updForm.ID.value = dataForm.ID.value;
		updForm.Title.value = dataForm.Title.value;
		updForm.Application.value = dataForm.Application.value;
		updForm.Status.value = dataForm.Status.value;
		updForm.AssignedTo.value = dataForm.AssignedTo.value;
		updForm.Percentage.value = dataForm.Percentage.value;
		updForm.Estimates.value = dataForm.Estimates.value;
		updForm.UsedHours.value = dataForm.UsedHours.value;
		updForm.ReleaseDate.value = dataForm.ReleaseDate.value;
		
		updForm.ID.readOnly = true;
		
		updForm.Application.onfocus = function() { this.defaultIndex = this.selectedIndex; };
		updForm.Application.onchange = function() { this.selectedIndex = this.defaultIndex; };
	}
	if (type=='rdsData') {
		updForm.ID.value = dataForm.ID.value;
		updForm.Title.value = dataForm.Title.value;
		updForm.Application.value = dataForm.Application.value;
		updForm.Status.value = dataForm.Status.value;
		updForm.ScheduledDate.value = dataForm.ScheduledDate.value;
		updForm.ActualDate.value = dataForm.ActualDate.value;
		updForm.Estimates.value = dataForm.Estimates.value;
		updForm.UsedHours.value = dataForm.UsedHours.value;
		updForm.AssignedTo.value = dataForm.AssignedTo.value;
		
		updForm.ID.readOnly = true;
		
		updForm.Application.onfocus = function() { this.defaultIndex = this.selectedIndex; };
		updForm.Application.onchange = function() { this.selectedIndex = this.defaultIndex; };
	}
	if (type=='defectsData') {
		updForm.ID.value = dataForm.ID.value;
		updForm.Application.value = dataForm.Application.value;
		updForm.Severity.value = dataForm.Severity.value;
		updForm.Status.value = dataForm.Status.value;
		updForm.AssignedTo.value = dataForm.AssignedTo.value;
		updForm.Efforts.value = dataForm.Efforts.value;
		updForm.Committed.value = dataForm.Committed.value;
		updForm.SLADate.value = dataForm.SLADate.value;
		updForm.ReleaseDate.value = dataForm.ReleaseDate.value;
		updForm.FixCancelDate.value = dataForm.FixCancelDate.value;
		updForm.RCA.value = dataForm.RCA.value;
		
		updForm.ID.readOnly = true;
		
		updForm.Application.onfocus = function() { this.defaultIndex = this.selectedIndex; };
		updForm.Application.onchange = function() { this.selectedIndex = this.defaultIndex; };
	}
	if (type=='ticketsData') {
		updForm.ID.value = dataForm.ID.value;
		updForm.Application.value = dataForm.Application.value;
		updForm.Priority.value = dataForm.Priority.value;
		updForm.Status.value = dataForm.Status.value;
		updForm.AssignedTo.value = dataForm.AssignedTo.value;
		updForm.SLADate.value = dataForm.SLADate.value;
		updForm.ClosedDate.value = dataForm.ClosedDate.value;
		updForm.RCA.value = dataForm.RCA.value;
		updForm.Efforts.value = dataForm.Efforts.value;
		
		updForm.ID.readOnly = true;
		
		updForm.Application.onfocus = function() { this.defaultIndex = this.selectedIndex; };
		updForm.Application.onchange = function() { this.selectedIndex = this.defaultIndex; };
	}
	if (type=='queriesData') {
		updForm.Title.value = dataForm.Title.value;
		updForm.Application.value = dataForm.Application.value;
		updForm.Status.value = dataForm.Status.value;
		updForm.AssignedTo.value = dataForm.AssignedTo.value;
		updForm.Percentage.value = dataForm.Percentage.value;
		updForm.EndDate.value = dataForm.EndDate.value;
		updForm.Efforts.value = dataForm.Efforts.value;
		
		//updForm.ID.readOnly = true;
		
		updForm.Application.onfocus = function() { this.defaultIndex = this.selectedIndex; };
		updForm.Application.onchange = function() { this.selectedIndex = this.defaultIndex; };
	}
	if (type=='otherInfoData') {
		updForm.Category.value = dataForm.Category.value;
		updForm.Description.value = dataForm.Description.value;
	}
}

function updateDataFunction(type,formName) {
	document.forms[type+'Form'].flag.value = "UPDATE";
	var formData = $('form[name='+type+'Form]').serialize();
	showLoadingBox();
	var request = $.ajax({
		url : 'huddleController',	
		method : 'post',
		data : formData,
		cache : false
	});
	request.done(function(response){
		$('#loadingBox').dialog("close");
		var response = eval('('+response+')');
		if (response["message"] == 'success') {
			var formType = document.forms[type+'Form'].type.value;
			
			if (formType =='PROJECTS') {
				updatePMTRow(type,formName);
			}
			else if (formType =='RDS') {
				updateRDSRow(type,formName);
			}
			else if (formType =='DEFECTS') {
				updateDefectsRow(type,formName);
			}
			else if (formType =='TICKETS') {
				updateTicketsRow(type,formName);
			}
			else if (formType =='QUERIES') {
				updateQueriesRow(type,formName);
			}
			else if (formType =='OTHERINFO') {
				updType = 'Information';
			}
		}
		else
			alert(response);
	});
	
	request.fail(errorHandler);
}

function updatePMTRow(type,formName) {
	alert("Project has been updated successfully!");
	
	var rowObj = document.forms[formName].parentNode.parentNode;
	var popupObj = document.forms[type+'Form'];
	
	rowObj.cells[1].innerHTML = popupObj.Title.value;
	rowObj.cells[3].innerHTML = popupObj.Status.value;
	rowObj.cells[4].innerHTML = popupObj.AssignedTo.value;
	rowObj.cells[5].innerHTML = popupObj.Percentage.value;
	rowObj.cells[6].innerHTML = popupObj.Estimates.value;
	rowObj.cells[7].innerHTML = popupObj.UsedHours.value;
	rowObj.cells[8].innerHTML = popupObj.ReleaseDate.value;
	
	$(rowObj).animate({ backgroundColor: "#00aa22" }, "slow").animate({ background: "none" }, "slow");
	
}

function updateRDSRow(type,formName) {
	alert("RD has been updated successfully!");
	
	var rowObj = document.forms[formName].parentNode.parentNode;
	var popupObj = document.forms[type+'Form'];
	
	rowObj.cells[1].innerHTML = popupObj.Title.value;
	rowObj.cells[3].innerHTML = popupObj.Status.value;
	rowObj.cells[4].innerHTML = popupObj.ScheduledDate.value;
	rowObj.cells[5].innerHTML = popupObj.ActualDate.value;
	rowObj.cells[6].innerHTML = popupObj.Estimates.value;
	rowObj.cells[7].innerHTML = popupObj.UsedHours.value;
	rowObj.cells[8].innerHTML = popupObj.AssignedTo.value;
	
	$(rowObj).animate({ backgroundColor: "#00aa22" }, "slow").animate({ background: "none" }, "slow");
	
}

function updateDefectsRow(type,formName) {
	alert("Defect has been updated successfully!");
	
	var rowObj = document.forms[formName].parentNode.parentNode;
	var popupObj = document.forms[type+'Form'];
	
	rowObj.cells[3].innerHTML = popupObj.Severity.value;
	rowObj.cells[4].innerHTML = popupObj.Status.value;
	rowObj.cells[5].innerHTML = popupObj.AssignedTo.value;
	rowObj.cells[6].innerHTML = popupObj.Efforts.value;
	rowObj.cells[7].innerHTML = popupObj.Committed.value;
	rowObj.cells[8].innerHTML = popupObj.SLADate.value;
	rowObj.cells[9].innerHTML = popupObj.ReleaseDate.value;
	rowObj.cells[8].innerHTML = popupObj.FixCancelDate.value;
	rowObj.cells[9].innerHTML = popupObj.RCA.value;
	
	$(rowObj).animate({ backgroundColor: "#00aa22" }, "slow").animate({ background: "none" }, "slow");
	
}

function updateTicketsRow(type,formName) {
	alert("Ticket has been updated successfully!");
	
	var rowObj = document.forms[formName].parentNode.parentNode;
	var popupObj = document.forms[type+'Form'];
	
	rowObj.cells[2].innerHTML = popupObj.Priority.value;
	rowObj.cells[3].innerHTML = popupObj.Status.value;
	rowObj.cells[4].innerHTML = popupObj.AssignedTo.value;
	rowObj.cells[5].innerHTML = popupObj.SLADate.value;
	rowObj.cells[6].innerHTML = popupObj.ClosedDate.value;
	rowObj.cells[7].innerHTML = popupObj.RCA.value;
	rowObj.cells[8].innerHTML = popupObj.Efforts.value;
	
	$(rowObj).animate({ backgroundColor: "#00aa22" }, "slow").animate({ background: "none" }, "slow");
	
}

function updateQueriesRow(type,formName) {
	alert("Query has been updated successfully!");
	
	var rowObj = document.forms[formName].parentNode.parentNode;
	var popupObj = document.forms[type+'Form'];
	
	rowObj.cells[4].innerHTML = popupObj.Status.value;
	rowObj.cells[5].innerHTML = popupObj.AssignedTo.value;
	rowObj.cells[6].innerHTML = popupObj.Percentage.value;
	rowObj.cells[7].innerHTML = popupObj.EndDate.value;
	rowObj.cells[9].innerHTML = popupObj.Efforts.value;
	
	$(rowObj).animate({ backgroundColor: "#00aa22" }, "slow").animate({ background: "none" }, "slow");
	
}

function callDeleteFunction(obj, formName) { alert(formName);
	$('form[name='+formName+'] input[name=flag]').attr("value", "DELETE");
	
	var formData = $('form[name='+formName+']').serialize();
	
	var request = $.ajax({
						url : '/HuddleBoard/huddleController',	//servlet url
						method : 'post',
						data : formData,
						cache : false
					});
	request.done(function(response){
		var response = eval('('+response+')');
		if (response["message"] == 'success') {
			alert('Deleted successfully!');
			$(obj).animate({ backgroundColor: "#ff8870" }, "slow")
			.animate({ opacity: "hide" }, "slow");
		}
		else
			alert('Some error occured...');
		
	});
	
	request.fail(errorHandler);
}

function errorHandler(jxhr, status) {
	alert('Error');
}

function showLoadingBox() {
	createLoadingDialogBox();
	$('#loadingBox').show();
	$('#loadingBox').dialog("open");
}

function createLoadingDialogBox() {
  $("#loadingBox").dialog({
      autoOpen: false,
      height: 200,
      width: 250,
      modal: true,
      closeOnEscape: true
  });
}