package com.example.greetingcard2

import android.content.res.Configuration
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.animation.animateContentSize
import androidx.compose.animation.core.EaseInOut
import androidx.compose.animation.core.FastOutSlowInEasing
import androidx.compose.animation.core.LinearOutSlowInEasing
import androidx.compose.animation.core.Spring
import androidx.compose.animation.core.animateDpAsState
import androidx.compose.animation.core.spring
import androidx.compose.animation.core.tween
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowDropDown
import androidx.compose.material.icons.filled.Close
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ElevatedButton
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.coerceAtLeast
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.greetingcard2.ui.theme.GreetingCard2Theme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            GreetingCard2Theme {
                MyApp()
            }
        }
    }
}

@Composable
fun OnBoardingScreen(
    onBotonApretameClicked: () -> Unit,
    modifier: Modifier = Modifier
)
{
    Column(
        modifier = modifier.fillMaxSize(),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    )
    {
        Text("Este boton hace cosas interesantes",
            fontWeight = FontWeight.Bold,
            fontSize = 16.sp
            )
        Button(
            modifier = modifier.padding(vertical = 2.dp),
            onClick = onBotonApretameClicked,
        )
        {
            Text("Apretame!", fontWeight = FontWeight.Bold)
        }
    }

}

@Composable
fun MyApp(modifier: Modifier = Modifier)
{
    var deberiaMostrarOnboarding by rememberSaveable() { mutableStateOf(true) }
    // usando by evitas usar el .value !!
    Surface (modifier){
        if (deberiaMostrarOnboarding) {
            OnBoardingScreen(onBotonApretameClicked = { deberiaMostrarOnboarding = false } )
        }
        else Greetings()
    }
}

@Composable
private fun Greetings(
    modifier: Modifier = Modifier,
    nombres : List<String> = List(1000) { "$it" })
    {
        LazyColumn(modifier.padding(vertical = (4.dp))){
            items(items = nombres) { nombre ->
                Greeting(nombre)
            }
        } 
    }

@Composable
fun Greeting(name: String, modifier: Modifier = Modifier)
{
    var expanded by rememberSaveable  { mutableStateOf(false)}
    val extraPadding by animateDpAsState(if (expanded) 48.dp else 0.dp,
        animationSpec = tween(
            durationMillis = 1000,
            delayMillis = 200,
            easing = LinearOutSlowInEasing
        ))
    Card(
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.primary
        ),
        modifier = modifier.padding(vertical = 4.dp, horizontal = 8.dp))
    {
        CardContent(name)
    }
}


@Composable
private fun CardContent(name: String)
{
    var expanded by rememberSaveable  { mutableStateOf(false)}
    Row(modifier = Modifier
        .padding(12.dp)
        .animateContentSize(
            animationSpec = tween(
                durationMillis = 500,
                delayMillis = 0,
                easing = LinearOutSlowInEasing
            )
        )
    )
    {
        Column(modifier = Modifier
            .weight(1f)
            .padding(12.dp))
        {
            Text(text = "Hello")
            Text(text = "$name!",
                style = MaterialTheme.typography.headlineLarge.copy(
                    fontWeight = FontWeight.Bold
                )
            )
            if(expanded)
            {
                Text(
                    text = ("Composem ipsum color sit lazy, " +
                            "padding theme elit, sed do bouncy.").repeat(4)
                )
            }
        }
        IconButton(
            onClick = { expanded = !expanded}
        ) {
            Icon(imageVector = if(!expanded) Icons.Filled.ArrowDropDown else Icons.Default.Close,
                contentDescription =
                    if(!expanded)
                    {
                        stringResource(R.string.show_less)
                    }
                    else
                    {
                        stringResource(R.string.show_less)
                    }
            )
        }
    }
}

@Preview(showBackground = false, uiMode = Configuration.UI_MODE_NIGHT_YES)
@Composable
fun DarkModeGreetingPreview() {
    GreetingCard2Theme {
        MyApp(Modifier.fillMaxSize())
    }
}

@Preview(showBackground = false)
@Composable
fun GreetingPreview() {
    GreetingCard2Theme {
        MyApp(Modifier.fillMaxSize())
    }
}

@Preview(showBackground = true, widthDp = 320, heightDp = 320)
@Composable
fun BoardingPreview()
{
    GreetingCard2Theme{
        OnBoardingScreen(onBotonApretameClicked = {})
    }
}

@Preview(showBackground = true, widthDp = 320)
@Composable
fun GreetingsPreview()
{
    GreetingCard2Theme {
        Greetings()
    }
}