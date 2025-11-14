package com.example.login.composables

import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.annotation.StringRes
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowDropDown
import androidx.compose.material3.Icon
import androidx.compose.material3.TextField
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.dp
import com.example.login.R
import com.example.login.composables.Customs.getCustomLoginTextField


@Composable
fun visibleField(
    value : String,
    usedFor : String,
    onValueChange : (String) -> Unit,
    modifier : Modifier)
{
    TextField(
        value = value,
        onValueChange = onValueChange,
        label = {Text(usedFor)},
        singleLine = true,
        colors = getCustomLoginTextField(),
        modifier = Modifier
            .padding(top = 50.dp)
            .fillMaxWidth(),
        )
}
@Composable
fun passField(
    value : String,
    onValueChange : (String) -> Unit,
    modifier : Modifier)
{
    TextField(
        value = value,
        onValueChange = onValueChange,
        label = {Text(stringResource(R.string.password))},
        singleLine = true,
        colors = getCustomLoginTextField(),
        visualTransformation = PasswordVisualTransformation(),
        trailingIcon = {
            Icon(
                imageVector = Icons.Default.ArrowDropDown,
                contentDescription = null,
            )
        },
        modifier = Modifier.padding(top = 50.dp)
            .fillMaxWidth(),

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
                Text(stringResource(R.string.entendido))
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
                Text(stringResource(R.string.entendido))
            }
        }
    )
}

