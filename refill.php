<?php
$con=mysqli_connect('localhost','root','','bdbb4');
$refvm=$_POST["refvm"];
$refb=$_POST["refb"];
$numr=$_POST["numr"];
$qte=$_POST["qte"];



$req="SELECT hs,caprangvm>qtedispo ,refVM,prixb,nomb
from vendingmachine v boissionmachine m,boisson b

where  v.refvm=m.refvm and m.refb=b.refb " ;
$ex=mysqli_connect($con,$req);
while($tab=mysqli_fetch_array($ex)){
    
    $prix_vente=ceil($t[3]*3.0)*0.5;
    if($tab[0]==1){
        echo"la machine est hors serive";
    }else{
        if($tab[1]==False){
            echo"La quantité dépasse la capacité d'une rangée";
        }
        else{
            $req="SELECT qteDispo,refVM from boissonmachine where refVM='$tab[2]' and num'$numr' ";
            $ex1=mysqli_query($con,$req);
            $tot=mysqli_fetch_row($ex1);
            if($tot[0]==0){
                $req="INSERT into boissonmachine values('$refvm','$numr','$refb','$qte','$prix_vente')";
                $ex3=mysqli_query($con,$req);
                if(mysqli_affected_rows($con)!=0){
                    echo"$qte $tab[4] sont cahrgés dans la rangée n° $numr";

                }

            }else{
                if(isset($_POST["force"]) ||  $tot[1]==$refvm  ){
                $req="INSERT into boissonmachine values('$refvm','$numr','$refb','$qte','$prix_vente')";
                                $ex3=mysqli_query($con,$req);
                if(mysqli_affected_rows($con)!=0){
                    echo"changement avec succes";

                }


                }else{
                    echo"Rangée non vide,contient déjà $tot[0] $tab[4] !";
                }
            }

        }
    }
    
}








?>
