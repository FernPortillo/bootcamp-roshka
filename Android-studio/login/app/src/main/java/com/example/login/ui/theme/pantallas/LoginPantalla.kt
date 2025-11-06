package com.example.login.ui.theme.pantallas

import com.example.login.model.LoginViewModel
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.safeDrawingPadding
import androidx.compose.material3.Button
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ElevatedCard
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Devices
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.login.composables.ErrorDialog
import com.example.login.composables.PassField
import com.example.login.composables.UserField
import com.example.login.data.SharedPrefsRepository
import com.example.login.model.LoginUiState
import com.example.tiptime.ui.theme.LoginTheme
import com.example.login.R

@Composable
fun layoutLogin(
    viewModel: LoginViewModel,
    onNavegarRegistro: () -> Unit,
    onLoginExitoso: () -> Unit,
    modifier: Modifier = Modifier
)
{

    when (viewModel.uiState)
    {
        is LoginUiState.Error -> {
            ErrorDialog(
                R.string.error,
                R.string.correo_pass_incorrecta,
                onExitDialog = {
                    viewModel.ponerIdle()
                }
            )
        }
        is LoginUiState.Exito ->
            LaunchedEffect(Unit) { onLoginExitoso() }
        else -> {}
    }

    Column(
        modifier = Modifier.fillMaxWidth()
            .safeDrawingPadding()
            .fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    )
    {
        CardLogin(viewModel, onNavegarRegistro, onLoginExitoso, modifier)
    }
}
@Composable
private fun CardLogin(
    viewModel: LoginViewModel,
    onNavegarRegistro: () -> Unit,
    onLoginExitoso: () -> Unit,
    modifier: Modifier)
{
    ElevatedCard(
        elevation = CardDefaults.cardElevation(
            defaultElevation = 6.dp,
        ),
        modifier = Modifier)
    {
        LoginFields(viewModel,onNavegarRegistro, onLoginExitoso , modifier)
    }
}

@Composable
private fun LoginFields(
    viewModel: LoginViewModel,
    onNavegarRegistro: () -> Unit,
    onLoginExitoso: () -> Unit,
    modifier: Modifier
) {
    Column(
        modifier
            .padding(horizontal = 16.dp)
            .fillMaxWidth(0.9f),
        horizontalAlignment = Alignment.CenterHorizontally,
    )
    {
        Text(
            text = stringResource(R.string.iniciar_sesion),
            modifier.padding(bottom = 16.dp, top = 40.dp),
            textAlign = TextAlign.Center,
            style = MaterialTheme.typography.bodySmall,
        )

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
                viewModel.onLoginButtonClick()
            },
            modifier.padding(16.dp)
        )
        {
            Text(stringResource(R.string.login))
        }

        Button(
            onClick = onNavegarRegistro,
        )
        {
            Text(stringResource(R.string.registrarse))
        }


    }

//    // Funcion para ver si anda
//    Button(onClick = {
//        viewModel.onLoginButtonClick()
//        Toast.makeText(
//            context,
//            "Guardado: ${viewModel.email} / ${viewModel.pass}",
//            Toast.LENGTH_SHORT
//        ).show()
//    }) {
//        Text("Ver datos")
//    }
}


@Composable
@Preview(
    name = "Login - Pixel 6 (Modo Claro)",
    showSystemUi = true,
    showBackground = true,
    backgroundColor = 0xFFF5F5F5,
    device = Devices.PIXEL_7_PRO)
fun PreviewLogin()
{
    LoginTheme{
        val context = LocalContext.current
        val repository = SharedPrefsRepository(context)
        val viewModel = LoginViewModel(repository)

        layoutLogin(
            viewModel,
            onLoginExitoso = { },
            onNavegarRegistro = {}
        )
    }
}




