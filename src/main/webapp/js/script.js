var format = /[ `!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;

function containsNumbers(str) {
    return /\d/.test(str) || format.test(str);

  }
  
var submit = document.getElementById("submit");

function validaC() {
    
    var cognome = document.getElementById("cognome");

    if(containsNumbers(cognome.value)){
        submit.classList.add("hidden");
        cognome.classList.add("ERROR");
    }else {
        cognome.classList.remove("ERROR");
        submit.classList.remove("hidden");
    }

}

function validaN(){
    var nome = document.getElementById("nome");
    if(containsNumbers(nome.value)){
        submit.classList.add("hidden");
        nome.classList.add("ERROR");
    }else {
        nome.classList.remove("ERROR");
        submit.classList.remove("hidden");
    }
}

function controllotitolo() {
    var select = document.getElementById("titolodistudio");
    var voto = document.getElementById("voto");

    if(select.value.includes("Diploma")){
        voto.max = 100;
    }

    if(select.value.includes("Laurea")){
        voto.max = 110;
    }

}


controllotitolo();