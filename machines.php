<?php
$con=mysqli_connect('localhost','root','','bdbb4');
$req="SELECT bm.refvm,adrvm,nbrrangvm*caprangvm as initiale,sum(Qtedispo) as dispo 
from boissonmachine bm,vendingmachine v where v.refvm=bm.refvm  and hs=0
group by bm.refvm";
$ex=mysqli_query($con,$req);
echo"<div style=' clear:both; text-align:center;'></h2 style='text-align:center ;font-family: Satisfy;' >Liste des Machines<h2> </div >";
while($t=mysqli_fetch_array($ex)){
    $total=$t[2];
    $qte=$t[3];
    $pour=($qte*100)/$total;    
    echo"
        <figcaption style='  border:2px solid blue;
    border-radius: 1px; float: left;
    width: 30%; margin:2px;'>
    <div style='text-align:center;'>
    <img src='images/vending_machine01.jpg'style='  width: 100px;

    height: 100px;  ' >
            
            <h3 style='  font-family: Satisfy;'>Ref: $t[0]</h3></div><br>
                <label style='font-weight:bold;' >Adr:</label>$t[0]  <br>   
                <label style='font-weight:bold;' >Adr:</label>$t[1]  <br>     
                <label style='font-weight:bold;' >boissons:</label> $qte  / $total  $pour %     <br>
                <label style='font-weight:bold;' ><a href='info_machine.php' >Autres informations</a></label>
        </figcaption>
    ";
}







?>