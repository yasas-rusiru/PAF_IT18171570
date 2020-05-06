$(document).ready(function() {

    $("#alertSuccess").hide();
    $("#alertError").hide();

});

// Save
$(document).on("click", "#btnSave", function(event) {

    // Clear alerts
    $("#alertSuccess").text("");
    $("#alertSuccess").hide();
    $("#alertError").text("");
    $("#alertError").hide();

    // Form validation
    var status = validateHospitalForm();
    if (status != true) {
        $("#alertError").text(status);
        $("#alertError").show();
        return;
    }

    // If valid
    var type = ($("#hidHosIDSave").val() == "") ? "POST" : "PUT";

    $.ajax(
        {
            url : "HosAPI",
            type : type,
            data : $("#formHospital").serialize(),
            dataType : "text",
            complete : function(response, status)
            {
                onHospitalSaveComplete(response.responseText, status);
            }
        });

});

function onHospitalSaveComplete(response, status) {

    if (status == "success") {

        var resultSet = JSON.parse(response);

        if (resultSet.status.trim() == "success") {

            $("#alertSuccess").text("Successfully saved.");
            $("#alertSuccess").show();
            $("#divItemsGrid").html(resultSet.data);

        } else if (resultSet.status.trim() == "error") {

            $("#alertError").text(resultSet.data);
            $("#alertError").show();

        }
    } else if (status == "error") {

        $("#alertError").text("Error while saving.");
        $("#alertError").show();

    } else {

        $("#alertError").text("Unknown error while saving..");
        $("#alertError").show();

    }

    $("#hidHosIDSave").val("");
    $("#formHospital")[0].reset();

}

// Update
$(document).on("click", ".btnUpdate", function(event)
{
    $("#hidHosIDSave").val($(this).closest("tr").find('#hidHosIDUpdate').val());
    $("#h_id").val($(this).closest("tr").find('td:eq(0)').text());
    $("#h_name").val($(this).closest("tr").find('td:eq(1)').text());
    $("#h_address").val($(this).closest("tr").find('td:eq(2)').text());
    $("#h_phone").val($(this).closest("tr").find('td:eq(3)').text());
    $("#h_email").val($(this).closest("tr").find('td:eq(4)').text());
});

//Remove
$(document).on("click", ".btnRemove", function(event)
{
    $.ajax(
        {
            url : "HosAPI",
            type : "DELETE",
            data : "h_id=" + $(this).data("h_id"),
            dataType : "text",
            complete : function(response, status)
            {
                onHospitalDeleteComplete(response.responseText, status);
            }
        });
});

function onHospitalDeleteComplete(response, status) {

    if (status == "success") {

        var resultSet = JSON.parse(response);

        if (resultSet.status.trim() == "success") {

            $("#alertSuccess").text("Successfully deleted.");
            $("#alertSuccess").show();
            $("#divHospitalGrid").html(resultSet.data);

        } else if (resultSet.status.trim() == "error") {

            $("#alertError").text(resultSet.data);
            $("#alertError").show();

        }

    } else if (status == "error") {

        $("#alertError").text("Error while deleting.");
        $("#alertError").show();

    } else {

        $("#alertError").text("Unknown error while deleting..");
        $("#alertError").show();

    }

}

// Client Model
function validateHospitalForm() {

	 // ID
    if ($("#h_id").val().trim() == "")
    {
        return "Insert Hospital ID.";
    }
    // NAME
    if ($("#h_name").val().trim() == "")
    {
        return "Insert Hospital Name.";
    }

    // address-------------------------------
    if ($("#h_address").val().trim() == "")
    {
        return "Insert Hospital address.";
    }
    // phone
    if ($("#h_phone").val().trim() == "")
    {
        return "Insert a Hospital telephone No.";
    }
    // 
  
    // email
    if ($("#h_email").val().trim() == "")
    {
        return "Insert Hospital email address.";
    }
    return true;
}
