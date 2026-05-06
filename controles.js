function verifRefill(){
    var machine=document.getElementById("refvm").selectedIndex
    var refb=document.getElementById("refb").selectedIndex
    var qte=document.getElementById("qte").value
    var numr=document.getElementById("numr").value
    if(machine<1){
        alert("machine")
        return false
    }
    if(refb<1){
        alert("reference machine")
        return false
    }
    if(numr.length==0 || Number(numr)<1 || Number(numr)>200){
    alert("numr")
    return false
    }
    if(qte.length==0 || Number(qte)<1 || Number(qte)>200){
        alert("qte")
        return false
    }
    return true
    
}