<?php
$con=mysqli_connect('localhost','root','','bdbb4');
$req="SELECT distinct typeB from boisson
group by 1 ";
$ex1=mysqli_query($con,$req);
while($tab=mysqli_fetch_array($ex1)){
    $req="SELECT prixb,imgB,prixvente,typeEm,VolEm,nomb,typeB 
from emballage e ,boissonmachine b ,boisson bo 
where e.refEm=bo.refEm and b.refB=bo.refB and typeB='$tab[0]'
";
$titre=$tab[0];
echo"<div style=' clear:both; text-align:center;'></h2 style='text-align:center ;font-family: Satisfy;' >$titre<h2> </div >";
$ex=mysqli_query($con,$req);
 echo"  <figure>";
    while($t=mysqli_fetch_array($ex)){
        $prix_vente=ceil($t[0]*3.0)*0.5;
        
        echo"
        <figcaption style='  border:2px solid blue;
    border-radius: 1px; float: left;
    width: 30%; margin:2px;'>
    <div style='text-align:center;'>
    <img src='boissons/$t[1]'style='  width: 30%;

    height: 100px;  ' >
            
            <h3 style='  font-family: Satisfy;'>$t[5]</h3></div>
                <label style='font-weight:bold;' >Achat:</label>$t[0]      
                <label style='font-weight:bold;' >-vente</label>$prix_vente     <br>
                <label style='font-weight:bold;' >Emballage:</label> $t[3]     <br>
                <label style='font-weight:bold;' >Volume:</label>$t[4]
        </figcaption>
    ";
    }
    echo"<br>";
}

echo"</figure>";







?>