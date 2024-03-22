<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js
              " rel="stylesheet" id="bootstrap-css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet" id="bootstrap-css">
        <link href="css/profile.css" rel="stylesheet" />  
        <title>JSP Page</title>
        
    </head>
    <body>
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-3 border-right">
                    <c:if test = "${listAid.avatar == null}">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold">${listAid.username}</span><span class="text-black-50">${listAid.email}</span><span> </span></div>
                    </c:if>
                    <c:if test = "${listAid.avatar != null}">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="${listAid.avatar}"><span class="font-weight-bold">${listAid.username}</span><span class="text-black-50">${listAid.email}</span><span> </span></div>
                    </c:if>
                    </div>
                <div class="col-md-5 border-right">
                    <div class="p-3 py-5">
                        
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            
                            <h4 class="text-right">Profile Settings</h4>
                        </div>
                        <form action='profile' class="form-container" method='post'>
                        <div class="row mt-2">
                            <div class="col-md-12"><label class="labels"></label><input  hidden=""readonly=""name="id" type="text" class="form-control"  value="${listAid.id}"></div>
                            <div class="col-md-12"><label class="labels">User Name</label><input  name="username" type="text" class="form-control"  value="${listAid.username}"></div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12"><label class="labels">Phone</label><input name="phone"  readtype="number" class="form-control"  value="${listAid.phone}"></div>
                            <div class="col-md-12"><label class="labels">Address</label><input name="address"  readtype="text" class="form-control"  value="${listAid.address}"></div>
                            <div class="col-md-12"><label class="labels">Email</label><input name="email" readonly="" readtype="text" class="form-control"  value="${listAid.email}"></div>
                            
                            <div class="col-md-12"><label class="labels">Password</label><input name="pass"  readtype="text" class="form-control"  value="${listAid.pass}"></div>
                        </div>

                            <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Save Profile</button></div>
                        </form>

                    </div>
                </div>

                </div>
            </div>

</body>
</html>
