package com.example.juego_topos.screens

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.safeDrawingPadding
import androidx.compose.material3.Button
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavHostController
import com.example.juego_topos.composables.PasswordTextFieldConSelectorVisibilidad
import com.example.juego_topos.composables.VisibleTextField
import com.example.juego_topos.model.AuthUIState
import com.example.juego_topos.model.AuthViewmodel
import com.example.juego_topos.navigator.Screen

@Composable
fun LayoutLogin(
    viewModel: AuthViewmodel,
    mainNavController : NavHostController
)
{
    when(viewModel.uiStateLogin)
    {
        AuthUIState.Error -> {/* Error dialog */}
        AuthUIState.Exito -> {}
        AuthUIState.Idle -> {}
    }

    LaunchedEffect(viewModel.uiStateLogin){
        if (viewModel.uiStateLogin is AuthUIState.Exito) {
            mainNavController.navigate(Screen.Main.ruta)
        }
        viewModel.resetLoginState()
    }
    Surface()
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
            LoginTextFields(viewModel, mainNavController)
        }
    }
}

@Composable
fun LoginTextFields(viewModel: AuthViewmodel,
                    mainNavController: NavHostController,
)
{
    Column(
        modifier = Modifier
            .padding(horizontal = 16.dp)
            .fillMaxWidth(0.9f),
        horizontalAlignment = Alignment.CenterHorizontally
    )
    {
        Text("Login")

        VisibleTextField(
            viewModel.user,
            "Usuario",
            onValueChange = { viewModel.updateLoginUser(it) }
        )

        PasswordTextFieldConSelectorVisibilidad(
            valor = viewModel.password,
            onValueChange = {viewModel.updateLoginPass(it)}
        )

        Button(
            onClick = { viewModel.onButtonLoginClick()},
            modifier = Modifier.padding(top = 32.dp),
            content = { Text("Iniciar Sesion") }
        )

        TextButton(onClick = {mainNavController.navigate(Screen.Register.ruta)})
        {
            Text("Registrarse")
        }
    }
}
