<!DOCTYPE html>
<html>
    <head>
        <title>Employee List</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="../res/jquery-3.5.1.min.js"></script>
        <link rel="stylesheet" href="css/style.css">
        </head>
    <body>
    <div class="container">
       <div class="panel panel-primary">
		  <div class="panel-heading">
		    <h2>User List</h2>
		  </div>
		  <div class="panel-body">
            
		    <table class="table table-striped">
		      <thead>
		        <tr>
		          <th>Id</th>
		          <th>Name</th>
		          <th>Sex</th>
		          <th>Status</th>
					<th>Rname</th>
		        </tr>
		      </thead>
		      <tbody>
		       <#list userList as user>
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.sex!"null"}</td>
                    <td>${user.status!"null"}</td>
					<td>${user.rname!"null"}</td>
                </tr>
			   </#list>
		      </tbody>
		    </table>
		  </div>
		</div>
		</div>
     </body>
</html>