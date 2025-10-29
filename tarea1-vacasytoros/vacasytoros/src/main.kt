import kotlin.random.Random
val random = {Random.nextInt(9)}
var toros = 0
var vacas = 0

fun main(args: Array<String>) {
    input()
}

fun input()
{
    val y = generar_numeros()
    var intentos = 0
    var x = ""

    while(toros < 4)
    {
        if (intentos == 0)
        {
            println("Adivina el Nro, es de 4 digitos no repetibles, 0 no es el primero")
            x = readln().toString()
            intentos++
        }
        else
        {
            println("Intente de nuevo...")
            x = readln().toString()
        }

        if (x.length != 4)
        {
            println("Ingrese de nuevo 4 digitos...")
            continue
        }

        toros = (comparar(x,y))
        if (toros == 4)
        {
            println("Acertaste, el numero era $y")
            break
        }
    }

}

fun generar_numeros() : String {

    val primerNro = if (random() == 0) random() else random()
    var segundoNro = random()
    var tercerNro = random()
    var cuartoNro = random()

    while (segundoNro == primerNro) {
        segundoNro = random()
    }

    while (tercerNro == segundoNro || tercerNro == primerNro)
    {
        tercerNro = random()
    }

    while (cuartoNro == tercerNro || cuartoNro == segundoNro
        || cuartoNro == primerNro)
    {
        cuartoNro = random()
    }
    // println("$primerNro$segundoNro$tercerNro$cuartoNro")
    return "$primerNro$segundoNro$tercerNro$cuartoNro"
}

fun comparar (x: String, y: String) : Int
{
    vacas = 0
    toros = 0
    for ((indice, numero) in y.withIndex())
    {
        if (numero == x[indice])
        {
            toros++
        }
        else if (x[indice] in y)
        {
            vacas++
        }
    }
    println("Hay $vacas ${if (vacas > 1 || vacas == 0) "vacas" else "vaca"} y hay" +
            " $toros ${if (toros > 1 || toros == 0) "toros" else "toro"}")
    return toros
}