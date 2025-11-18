package com.example.juego_topos.screens

import android.annotation.SuppressLint
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.safeDrawingPadding
import androidx.compose.foundation.layout.width
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.Button
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.tooling.preview.Devices
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.juego_topos.composables.PasswordTextFieldConSelectorVisibilidad
import com.example.juego_topos.composables.VisibleTextField
import com.example.juego_topos.data.SharedPreferences
import com.example.juego_topos.model.AuthUIState
import com.example.juego_topos.model.AuthViewmodel
import com.example.juego_topos.repository.SharedPrefsRepository
import com.example.juego_topos.ui.theme.GameTheme


@Composable
fun LayoutRegistro(
    viewModel: AuthViewmodel,
    onNavegarAtras: () -> Unit,
    modifier: Modifier = Modifier
)
{
    when(viewModel.uiStateReg)
    {
        is AuthUIState.Error -> {/*Dialogo Error*/}
        is AuthUIState.Exito -> {/*Dialogo Exito*/}
        is AuthUIState.Idle -> {}
    }
    Surface()
    {
        Column(
            modifier = modifier
                .fillMaxWidth()
                .safeDrawingPadding()
                .fillMaxSize(),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        )
        {
            RegistroTextFields(viewModel, onNavegarAtras, modifier)
        }
    }
}


@Composable
fun RegistroTextFields(
    viewModel: AuthViewmodel,
    onNavegarAtras: () -> Unit,
    modifier: Modifier
)
{
    Column(
        modifier = modifier
            .padding(horizontal = 16.dp)
            .fillMaxWidth(0.9f),
        horizontalAlignment = Alignment.CenterHorizontally
    )
    {
        Row(
            modifier = modifier
                .fillMaxWidth()
                .padding(bottom = 16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        )
        {
            IconButton(onClick = onNavegarAtras)
            {
                Icon(
                    imageVector = Icons.AutoMirrored.Default.ArrowBack,
                    contentDescription = null
                )
            }
            Text("Registrarse")
            Spacer(modifier.width(64.dp))
        }

        VisibleTextField(
            viewModel.regUser,
            "Usuario",
            onValueChange = { viewModel.updateUser(it) }
        )

        PasswordTextFieldConSelectorVisibilidad(
            valor = viewModel.regPassword,
            onValueChange = {viewModel.updatePass(it)}
        )

        Button(
            onClick = { viewModel.onButtonRegisterClick() },
            modifier = modifier.padding(top = 32.dp),
            content = { Text("Registrarse") }
        )
    }
}

@SuppressLint("ViewModelConstructorInComposable")
@Composable
@Preview(
    showSystemUi = true,
    showBackground = true,
    device = Devices.PIXEL_7_PRO)
fun PreviewRegister()
{
    GameTheme{
        val context = LocalContext.current
        val sp = SharedPreferences(context)
        val repository = SharedPrefsRepository(sp)
        val viewModel = AuthViewmodel(repository)

        LayoutRegistro(
            viewModel,
            onNavegarAtras = {},
            modifier = Modifier
        )
    }
}