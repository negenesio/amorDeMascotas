<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="carouselbootstrap.min.css"/>
    <asset:javascript src="carouseljquery.min.js"/>
    <asset:javascript src="carouselbootstrap.min.js"/>

    <title>Bootstrap Example</title>
</head>
<body>

<div class="container">
    <h2>Carousel Example</h2>
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="https://www.w3schools.com/bootstrap/la.jpg" alt="Los Angeles" style="width:100%;">
            </div>

            <div class="item">
                <img src="https://www.w3schools.com/bootstrap/chicago.jpg" alt="Chicago" style="width:100%;">
            </div>

            <div class="item">
                <img src="https://www.w3schools.com/bootstrap/ny.jpg" alt="New york" style="width:100%;">
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span style="color:white; margin-top: 310px;" class="fa fa-chevron-left fa-4x"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span style="color:white; margin-top: 310px;" class="fa fa-chevron-right fa-4x"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>

</body>
</html>

</body>
</html>