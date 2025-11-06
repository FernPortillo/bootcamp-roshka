package com.example.login.composables

import androidx.compose.material3.AlertDialog
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.annotation.StringRes
import androidx.compose.ui.res.stringResource
import com.example.login.R


@Composable
fun UserField(
    value : String,
    onValueChange : (String) -> Unit,
    modifier : Modifier = Modifier)
{
    OutlinedTextField(
        value = value,
        onValueChange = onValueChange,
        modifier,
        label = {Text(stringResource(R.string.correo))},
        singleLine = true,
        )
}
@Composable
fun PassField(
    value : String,
    onValueChange : (String) -> Unit,
    modifier : Modifier = Modifier)
{
    OutlinedTextField(
        value = value,
        onValueChange = onValueChange,
        modifier,
        label = {Text(stringResource(R.string.password))},
        singleLine = true,
        visualTransformation = PasswordVisualTransformation()
    )
}


@Composable
fun RegisterDialog(
    onExitDialog: () -> Unit,
    modifier: Modifier = Modifier
) {
    AlertDialog(
        onDismissRequest = {
            // Dismiss the dialog when the user clicks outside the dialog or on the back
            // button. If you want to disable that functionality, simply use an empty
            // onDismissRequest.
        },
        title = { stringResource(R.string.registrado) },
        text = { stringResource(R.string.registro_correcto) },
        modifier = modifier,

        confirmButton = {
            TextButton(onClick = onExitDialog) {
                Text(stringResource(R.string.ok))
            }
        }
    )
}

@Composable
fun ErrorDialog(
    @StringRes title : Int,
    @StringRes desc : Int,
    onExitDialog: () -> Unit,
    modifier: Modifier = Modifier
) {
    AlertDialog(
        onDismissRequest = {
            // Dismiss the dialog when the user clicks outside the dialog or on the back
            // button. If you want to disable that functionality, simply use an empty
            // onDismissRequest.
        },
        title = { stringResource(title) },
        text = { stringResource(desc) },
        modifier = modifier,

        confirmButton = {
            TextButton(onClick = onExitDialog) {
                Text(stringResource(R.string.ok))
            }
        }
    )
}

