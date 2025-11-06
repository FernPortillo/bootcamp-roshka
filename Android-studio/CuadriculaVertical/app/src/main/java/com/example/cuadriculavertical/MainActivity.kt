package com.example.cuadriculavertical

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.WindowInsets
import androidx.compose.foundation.layout.asPaddingValues
import androidx.compose.foundation.layout.aspectRatio
import androidx.compose.foundation.layout.calculateEndPadding
import androidx.compose.foundation.layout.calculateStartPadding
import androidx.compose.foundation.layout.defaultMinSize
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.safeDrawing
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.statusBarsPadding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Person
import androidx.compose.material3.Card
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalLayoutDirection
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.LayoutDirection
import androidx.compose.ui.unit.dp
import com.example.cuadriculavertical.model.DataSource
import com.example.cuadriculavertical.model.Topic
import com.example.cuadriculavertical.ui.theme.CuadriculaVerticalTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            TopicsApp()
        }
    }
}

@Composable
fun TopicsApp()
{
    Surface(
        modifier = Modifier
            .fillMaxSize()
    )
    {
        TopicsList(DataSource.loadTopics())
    }
}

@Composable
fun CartaTopic(topic: Topic, modifier: Modifier = Modifier)
{
    Card(modifier = Modifier
        .fillMaxWidth()
        .aspectRatio(2f)
        .padding(start = 8.dp, bottom = 8.dp))
    {
        Row (modifier = Modifier
            .fillMaxSize()
            .padding(start = 8.dp),
            verticalAlignment = Alignment.CenterVertically)
        {
            Box(contentAlignment = Alignment.Center)
            {
                Image(
                    painter = painterResource(topic.topicPicId),
                    contentDescription = stringResource(topic.topicNameId),
                    modifier.size(68.dp)
                        .aspectRatio(1f),
                )
            }
                Column(modifier
                    .padding(start = 16.dp)
                    .align(Alignment.CenterVertically))
                {
                    Text(
                        text = stringResource(topic.topicNameId),
                        style = MaterialTheme.typography.bodyMedium,
                        modifier =
                            Modifier.padding(
                                bottom = 8.dp
                            )
                    )
                    Row(
                        verticalAlignment = Alignment.CenterVertically
                    )
                    {
                        Icon(
                            imageVector = Icons.Filled.Person,
                            contentDescription = null,
                            modifier
                                .size(16.dp)

                        )
                        Text(
                            text = topic.people.toString(),
                            style = MaterialTheme.typography.labelMedium,
                            )
                    }
                }
            }
        }
    }



@Composable
fun TopicsList(topicList : List<Topic>, modifier: Modifier = Modifier)
{
    LazyVerticalGrid (GridCells.Fixed(2),
        modifier = Modifier
            .padding(8.dp))
    {
        items(topicList)
        {
            topic ->
            CartaTopic(
                topic = topic,
            )
        }
    }
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    CuadriculaVerticalTheme {
        Column(modifier = Modifier
            .fillMaxSize(),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center)
        {
            TopicsApp()
        }
    }
}