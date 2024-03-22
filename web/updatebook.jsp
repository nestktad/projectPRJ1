<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/updatebook.css" rel="stylesheet" /> 
    </head>
    <body>


        <div class="form-popup" id="myForm">

            <form action="updatebook" class="form-container" method="post">
                
                ID <input type='text' readonly name='bid' value="${listB.bid}">
                Book Title<input type='text' name='bname' value="${listB.bname}">
                Author<input type='text' name='author' value="${listB.author}">
                Image <input type='text' name='image' value="${listB.image}">
                Describe <input type='text' name='describe' value="${listB.describe}">
                Category <select name ='category'>
                    
                    <option hidden="" value ="${listB.category.cid}">${listB.category.cname}</option>
                    
                    <c:forEach items="${requestScope.listC}" var = "o">
                        
                        <option value ="${o.cid}">${o.cname}</option>
                    </c:forEach>    
                </select><br>
                Quantity <input type='number' name ='quantity' value="${listB.quantity}">
                Publisher <select name ='publisher'>
                    <option hidden=""value ="${listB.publisher.pid}">${listB.publisher.pname}</option>
                    <c:forEach items="${requestScope.listP}" var = "o">
                        <option value ="${o.pid}">${o.pname}</option>
                    </c:forEach>

                </select> <br>
                Price <input type='number' name='price' value="${listB.price}">
                <button type="submit" class="btn" value="update">Update</button>

            </form>
        </div>


    </body>
</html>
