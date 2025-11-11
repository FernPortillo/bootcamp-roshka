package com.example.login.ui.theme.pantallas

import com.example.login.model.LoginViewModel
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.safeDrawingPadding
import androidx.compose.foundation.layout.size
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Devices
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.compose.LoginTheme
import com.example.login.composables.ErrorDialog
import com.example.login.composables.passField
import com.example.login.composables.visibleField
import com.example.login.repository.SharedPrefsRepository
import com.example.login.model.LoginUiState
import com.example.login.R
import com.example.login.composables.Customs.getTransparentButtonColor

@Composable
fun LoginScreen(
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
                viewModel.errorCode,
                onExitDialog = {
                    viewModel.resetState()
                }
            )
        }
        is LoginUiState.Exito ->
            LaunchedEffect(Unit) { onLoginExitoso() }
        else -> {}
    }

    Surface(
        color = MaterialTheme.colorScheme.background
    ){
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .safeDrawingPadding()
                .fillMaxSize(),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        )
        {
            LoginFields(viewModel, onNavegarRegistro, modifier)
        }
    }
}

@Composable
private fun LoginFields(
    viewModel: LoginViewModel,
    onNavegarRegistro: () -> Unit,
    modifier: Modifier)
{
    Column(
        modifier
            .padding(horizontal = 40.dp)
            .fillMaxWidth(),
        horizontalAlignment = Alignment.CenterHorizontally,
    )
    {
        Text(
            text = stringResource(R.string.login),
            modifier.padding( top = 40.dp),
            textAlign = TextAlign.Left,
            style = MaterialTheme.typography.titleLarge,
            fontWeight = FontWeight.Bold
        )

        visibleField(
            viewModel.email,
            stringResource(R.string.correo),
            onValueChange = { viewModel.email = it },
            modifier.fillMaxWidth()
            .padding(bottom = 32.dp)
        )

        passField(
            viewModel.pass,
            onValueChange = { viewModel.pass = it },
            modifier.fillMaxWidth()
        )

        Button(
            onClick = {
                viewModel.onLoginButtonClick()
            },
            modifier
                .padding(top = 32.dp)
                .size(170.dp, 48.dp)
        )
        {
            Text(stringResource(R.string.login))
        }

        Button(
            onClick = onNavegarRegistro,
            colors = getTransparentButtonColor()
        )
        {
            Text(stringResource(R.string.registrarse),
                style = MaterialTheme.typography.bodyMedium,
                fontWeight = FontWeight.Bold,
                modifier = Modifier.padding(top = 16.dp))
        }
    }
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

        LoginScreen(
            viewModel,
            onLoginExitoso = { },
            onNavegarRegistro = {}
        )
    }
}