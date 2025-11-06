package com.example.login.ui.theme.pantallas

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column

import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.safeDrawingPadding
import androidx.compose.foundation.layout.size
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.Button
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ElevatedCard
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Devices
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.login.composables.ErrorDialog
import com.example.login.composables.PassField
import com.example.login.composables.RegisterDialog
import com.example.login.composables.UserField
import com.example.login.data.SharedPrefsRepository
import com.example.login.model.RegisterViewModel
import com.example.tiptime.ui.theme.LoginTheme
import androidx.compose.ui.res.stringResource
import com.example.login.R

@Composable
fun layoutRegistro(
    viewModel: RegisterViewModel,
    onNavegarLogin: () -> Unit,
    modifier: Modifier = Modifier
    )
{
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .safeDrawingPadding()
            .fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    )
    {
        CartaRegistro(viewModel, onNavegarLogin, modifier)
    }
}
 @Composable
 private fun CartaRegistro(
     viewModel: RegisterViewModel,
     onNavegarLogin: () -> Unit,
     modifier: Modifier)
 {
     ElevatedCard(
         elevation = CardDefaults.cardElevation(
             defaultElevation = 6.dp,
             ),
         modifier = Modifier)
     {
         RegisterFields(viewModel, onNavegarLogin, modifier)
     }
 }

@Composable
private fun RegisterFields(
    viewModel: RegisterViewModel,
    onNavegarLogin: () -> Unit,
    modifier: Modifier
) {
    Column(
        modifier // Aquí usamos el padding principal de la tarjeta
            .padding(horizontal = 16.dp)
            .fillMaxWidth(0.9f),
        horizontalAlignment = Alignment.CenterHorizontally,
    ) {
        // --- NUEVO BOX para el botón y el título ---
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .padding(top = 16.dp, bottom = 16.dp) // Reducimos el padding de aquí
        ) {
            // 1. Botón a la izquierda
            IconButton(
                onClick = {}, // Usamos la navegación
                modifier = Modifier
                    .align(Alignment.CenterStart) // Alinear a la izquierda del Box
                    .size(48.dp) // Tamaño estándar para botones
            ) {
                Icon(
                    imageVector = Icons.AutoMirrored.Filled.ArrowBack,
                    contentDescription = "Volver al Login"
                )
            }

            // 2. Título centrado respecto al Box completo
            Text(
                text = "Sign Up",
                modifier = Modifier.align(Alignment.Center), // Alinear al centro del Box
                textAlign = TextAlign.Center,
                style = MaterialTheme.typography.headlineSmall, // Estilo mejorado
            )
        }

        UserField(
            viewModel.email,
            onValueChange = { viewModel.email = it },
            modifier
                .padding(start = 16.dp, end = 16.dp, bottom = 16.dp)
                .fillMaxWidth()
        )

        PassField(
            viewModel.pass,
            onValueChange = { viewModel.pass = it },
            modifier
                .padding(start = 16.dp, end = 16.dp, bottom = 16.dp)
                .fillMaxWidth()
        )

        Button(
            onClick = {
                viewModel.onRegisterClick()
            },
            modifier.padding(16.dp)
        )
        {
            Text(stringResource(R.string.registrarse))
        }


        if (viewModel.mostrarDialogSuccess) {
            RegisterDialog(
                onExitDialog = {
                    viewModel.mostrarDialogSuccess = false
                },
            )
        }

        if (viewModel.mostrarDialogError) {
            ErrorDialog(
                R.string.error,
                desc = R.string.correo_pass_vacio,
                onExitDialog = {
                    viewModel.mostrarDialogError = false
                }
            )
        }
    }
}

//    // Funcion para ver si anda
//    Button(onClick = {
//        viewModel.onRegisterClick()
//        Toast.makeText(
//            context,
//            "Guardado: ${viewModel.email} / ${viewModel.pass}",
//            Toast.LENGTH_SHORT
//        ).show()
//    }) {
//        Text("Ver datos")
//    }


@Composable
@Preview(
    showSystemUi = true,
    showBackground = true,
    device = Devices.PIXEL_7_PRO)
fun PreviewRegister()
{
    LoginTheme{
        val context = LocalContext.current
        val repository = SharedPrefsRepository(context)
        val viewModel = RegisterViewModel(repository)

        layoutRegistro(
            viewModel,
            onNavegarLogin = { }
        )
    }
}




