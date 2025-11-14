package com.example.myapplication

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.wrapContentHeight
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.SegmentedButton
import androidx.compose.material3.SegmentedButtonDefaults
import androidx.compose.material3.SingleChoiceSegmentedButtonRow
import androidx.compose.material3.SmallFloatingActionButton
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.window.Dialog
import com.example.myapplication.ui.theme.MyApplicationTheme

@Preview(widthDp = 280, heightDp = 480)
@Composable
fun AguaPreview(){
    Surface(
        color = MaterialTheme.colorScheme.surface
    ){
        MyApplicationTheme {
            AguaApp()
        }
    }
}

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            MyApplicationTheme {
                AguaApp()
            }
        }
    }
}
@Composable
fun AguaApp()
{
    var mostrarDialog by remember { mutableStateOf(false) }
    var aguaTotal by rememberSaveable { mutableStateOf(0f)}
    var metaAgua by rememberSaveable { mutableStateOf(2000f) }

    if (mostrarDialog) {
        DialogAddWater(
            onDismissRequest = { mostrarDialog = false },
            onConfirmation = { cantidad, unidad ->
                val cantidadMl = if (unidad == "l") cantidad.toFloatOrNull()?.times(1000) ?: 0f
                else cantidad.toFloatOrNull() ?: 0f
                aguaTotal += cantidadMl
                mostrarDialog = false
            },
        )
    }

    val porcentaje = (aguaTotal / metaAgua).coerceIn(0f, 1f)
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    )
    {
        Box(
            modifier = Modifier
            .fillMaxWidth()
            .fillMaxHeight(porcentaje)
            .align(Alignment.BottomCenter)
            .background(MaterialTheme.colorScheme.primaryContainer))

        Column(
            modifier = Modifier.fillMaxSize(),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            Text(stringResource(R.string.tomado, aguaTotal.toInt()))
            Text(stringResource(R.string.meta, metaAgua.toInt()))
            // Para ver si funca nms

            BotonAddAgua(onClick = {mostrarDialog = true})
        }
    }
 }

@Composable
fun BotonAddAgua(modifier: Modifier = Modifier,
                 onClick : () -> Unit)
{
    SmallFloatingActionButton(
        onClick =  onClick,
        containerColor = MaterialTheme.colorScheme.primary,
        shape = CircleShape,
        modifier = Modifier
            .size(24.dp)
    ) {
        Icon(Icons.Filled.Add, stringResource(R.string.agregar_agua))
    }
}

@Composable
fun DialogAddWater(
    onDismissRequest: () -> Unit,
    onConfirmation : (cantidad : String, unidad : String) -> Unit,
) {
    var selectedIndex by rememberSaveable {
        mutableStateOf(0)
    }
    var cantidadInput by rememberSaveable {
        mutableStateOf("") }
    val options = listOf("ml", "l")
    Dialog(onDismissRequest =  onDismissRequest) {
        // Draw a rectangle shape with rounded corners inside the dialog
        Card(
            modifier = Modifier
                .fillMaxWidth(),
            shape = RoundedCornerShape(24.dp),
        ) {
            Column(
                modifier = Modifier
                    .padding(16.dp),
                verticalArrangement = Arrangement.Center,
                horizontalAlignment = Alignment.CenterHorizontally,
            )
            {
                Text(
                    text = stringResource(R.string.agregar_agua),
                    modifier = Modifier.padding(8.dp),
                )
                CantidadInputField(cantidadInput,
                    onValueChange = {cantidadInput = it})
                SingleChoiceSegmentedButton(
                    selectedIndex,
                    onSelectedIndex = {selectedIndex = it}
                )

                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(top = 16.dp),
                    horizontalArrangement = Arrangement.Center,
                )
                {
                    BotonDialog(
                        { onDismissRequest () },
                        stringResource(R.string.cancelar))

                    BotonDialog(
                        { onConfirmation(cantidadInput, options[selectedIndex]) },
                        stringResource(R.string.confirmar)
                    )
                }
            }
        }
    }
}

@Composable
fun BotonDialog(onClick: () -> Unit,
                texto : String,
                modifier: Modifier = Modifier)
{
    Button(onClick = onClick, modifier.padding(8.dp))
    {
        Text(texto)
    }
}

@Composable
fun SingleChoiceSegmentedButton(
    selectedIndex : Int,
    onSelectedIndex : (Int) -> Unit,
    modifier: Modifier = Modifier,
    ) {
    val options = listOf(R.string.mililitros, R.string.litros)

    SingleChoiceSegmentedButtonRow {
        options.forEachIndexed { index, label ->
            SegmentedButton(
                shape = SegmentedButtonDefaults.itemShape(
                    index = index,
                    count = options.size
                ),
                onClick = { onSelectedIndex(index) },
                selected = index == selectedIndex,
                label = { Text(stringResource(label))},
                icon = {}
            )
        }
    }
}

@Composable
fun CantidadInputField(
    value : String,
    onValueChange: (String) -> Unit,
)
{
    OutlinedTextField(
        modifier =
            Modifier.padding(start = 16.dp, end = 16.dp, bottom = 16.dp),
        value = value,
        onValueChange = onValueChange,
        label = { Text(stringResource(R.string.cantidad)) },
        singleLine = true,
        keyboardOptions = KeyboardOptions(
            keyboardType = KeyboardType.Number
        )
    )
}
// App para calcular agua tomada
// User mete la cantidad en ml o l en un boot y al agregarla va subiendo con el fondo
// empieza en 0, no hay agua en la app y mientras va agregando va subiendo el agua en el fondo
// el user tiene que ingresar su meta tb en litros o ml
// var aguaMeta con conversores a ml y l
// var aguaActua con conversores a ml y l que es el agua q tomo hasta ahora
// estas dos vars se dividen para conseguir el porcentaje de 100, ese porcentaje maneja en que parte de la pantalla va el agua
// aguaAAgregar que agrega el agua (con conversores..)
// si alcanza la meta tira una noti