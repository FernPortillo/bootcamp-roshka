package Reloj


fun main()
    {
        println("Ingrese el primer reloj")
        println("1 para reloj default, 2 para reloj con hora especifica" +
                " y 3 para reloj en segundos")
        var eleccion = -1
        var reloj : Reloj? = null
        when (val inputUser = inputReloj(eleccion))
        {
            1 -> reloj = relojDefault()
            2 -> reloj = relojEleccion()
            3 -> reloj = relojSegundos()
        }
        println("La hora que ingresaste fue: ${reloj.toString()}, tick 10 segs")
        repeat(10)
        {
            reloj!!.tick()
            println(reloj.toString())
        }
        println("Ingrese el segundo reloj.")
        println("1 para reloj default, 2 para reloj con hora especifica" +
                " y 3 para reloj en segundos")
        eleccion = -1
        var relojResta : Reloj? = null
        when (val inputUser = inputReloj(eleccion))
        {
            1 -> relojResta = relojDefault()
            2 -> relojResta = relojEleccion()
            3 -> relojResta = relojSegundos()
        }
        reloj!!.restaReloj(relojResta!!)
        println("La resta es: ${reloj.toString()}")
    }

fun inputReloj(eleccion: Int) : Int {
    var input = eleccion
    while (input !in 1..3) {
        input = readln().toIntOrNull() ?: 1
        if (input !in 1..3) {
            println("Elija una opcion correcta.")
        }
    }
    return input
}

fun relojDefault() : Reloj
{
    println("Reloj Default elegido, iniciando a las 12:00:00")
    return Reloj()
}
fun relojEleccion() : Reloj
{
    println("Reloj Eleccion elegido, ingrese Horas luego Minutos luego Segundos")
    return Reloj(readln().toInt(), readln().toInt(), readln().toInt())
}
fun relojSegundos() : Reloj
{
    println("Reloj Segundos elegido, ingrese segundos desde medianoche")
    return Reloj(readln().toInt())
}