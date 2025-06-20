import 'package:argh/resources/flutter-icons-21a1aafc/my_flutter_app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class rules{



  void showEnd(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Fine del Gioco')),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Condizioni di Fine Partita',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Il gioco termina quando:\n'
                      '1. Tutte le celle isola sono state girate (mostrano il teschio).\n'
                      '2. La carta "Fine Gioco" è stata pescata dal mazzo.',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  'Conteggio Punti',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Somma il valore di tutte le tue carte Bottino:\n'
                      '- Le carte Tesoro valgono il loro valore indicato.\n'
                      '- Le carte Effetto possono modificare il totale.',
                  style: TextStyle(fontSize: 18),
                ),
                // Immagine esempio fine gioco
                // Image.asset('assets/fine_gioco.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showPoints(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Ottenere Bottino')),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '3 Modi per Ottenere Bottino',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.anchor),
                  title: Text('1. Attracco a un\'isola: lanci tante monete quante celle ha l\'isola. Ogni "testa" peschi 1 carta.'),
                ),
                ListTile(
                  leading: Icon(MyFlutterApp.explosive_materials),
                  title: Text('2. Attacco: ruba carte agli avversari.'),
                ),
                ListTile(
                  leading: Icon(Icons.casino),
                  title: Text('3. Carte Tesoro: pescale con i teschi sui dadi.'),
                ),
                SizedBox(height: 20),
                Text(
                  'Carte Speciali',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '"Risorse Scarse": quando esce, le isole visitate girano una cella a teschio e danno meno risorse.',
                  style: TextStyle(fontSize: 18),
                ),
                // Immagine esempio carte
                // Image.asset('assets/bottino.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showAttack(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Attacchi e Battaglie')),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Come Attaccare',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Esempio di zone di attacco:',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  'Questi pattern vanno pattuiti ad inizio partita',
                  style: TextStyle(fontSize: 12),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(child: Image.asset("assets/illustration/full_attack.png"), height: 200, width: 180,),
                    SizedBox(child: Image.asset("assets/illustration/simple_attack.png"), height: 200, width: 180,),
                  ],
                ),
                Text(
                  '1. Usa un token Attacco durante il tuo turno.\n'
                      '2. Scegli un avversario nella tua zona di attacco (vedi immagine).\n'
                      'Offrigli una possibilità di risolvere il conflitto in modo pacifico, chiedi che ti vengano date delle carte.\n'
                      'Se il difensore accetta, la battaglia finisce\nSe invece l\' offerta viene rifiutata\n\n'
                      '3. Risolvi la battaglia:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Mirare!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'lancia un dado per vedere se colpisci il difensore, se lo manchi il combattimento può finire qui',
                  style: TextStyle(fontSize: 18),
                ),
                ListTile(
                  leading: Icon(Icons.bolt),
                  title: Text('Zona Gialla: successo con 1 o + sul dado.'),
                ),
                ListTile(
                  leading: Icon(Icons.bolt),
                  title: Text('Zona Arancione: successo con 2 o + sul dado.'),
                ),
                ListTile(
                  leading: Icon(Icons.bolt),
                  title: Text('Zona Rossa: successo con 3 o + sul dado.'),
                ),
                SizedBox(height: 20),
                Text(
                  'Fuoco alle polveri',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'pescate una carta bottino a testa, chi ha il valore più alto vince',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '- Se vinci: peschi le carte richieste + la carta pescata.\n'
                      '- Il difensore può contrattaccare spendendo un token, e la battaglia rincomincia coi ruoli invertiti\n',
                  style: TextStyle(fontSize: 18),
                ),
                // Immagine zone di attacco
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showMovements(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Movimento delle Barche')),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tipi di Movimento',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.rotate_right),
                  title: Text('Rotazione: gira la barca senza spostarla.'),
                ),
                ListTile(
                  leading: Icon(Icons.arrow_forward),
                  title: Text('Avanzamento: muovi in linea retta nella direzione della prua.'),
                ),
                SizedBox(height: 20),
                Text(
                  'Lancio dei Dadi',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Si lanciano 3d6 (Teschio/2/4) e 3 monete (Ruota/Croce) per determinare:\n'
                      '- Avanzamenti: gruppi da 1 a 3 caselle (es. [2*⬈]).\n'
                      '- Rotazioni: da 1 a 4 (es. [3*↻]).\n'
                      'Puoi usarli in qualsiasi ordine!',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                // Immagine di esempio
                // Image.asset('assets/movimento.png'),
                Text(
                  'Esempio: se esce [3*↻], [2*⬈], puoi ruotare 3 volte e poi avanzare di 2 caselle.',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showMap(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Campo da Gioco')),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Struttura del Campo',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Il campo è una griglia esagonale con 30 caselle isola/porti:\n'
                      '- Caselle Isola: bloccano il movimento e hanno un lato "teschio".\n'
                      '- Porti: caselle dove attraccare per ottenere bottino.\n'
                      '- Mare: caselle libere per navigare.',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  'Regole di Posizionamento',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                ListTile(
                  leading: Icon(Icons.warning),
                  title: Text('Le isole devono essere distanti almeno 1 casella mare l\'una dall\'altra.'),
                ),
                ListTile(
                  leading: Icon(Icons.warning),
                  title: Text('Ogni isola ha 1 porto, posizionato verso l\'esterno.'),
                ),
                // Esempio di immagine
                // Image.asset('assets/mappa_esempio.png'),
                Text(
                  'Esempio di disposizione valida:',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showWin(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Come Vincere')),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Obiettivo del Gioco',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Vince il giocatore con il maggior valore di Bottino alla fine del gioco. Il Bottino si ottiene:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text('Attraccando alle isole e pescando carte Bottino.'),
                ),
                ListTile(
                  leading: Icon(MyFlutterApp.explosive_materials),
                  title: Text('Rubando carte agli avversari con attacchi.'),
                ),
                ListTile(
                  leading: Icon(Icons.casino),
                  title: Text('Pescando carte Tesoro dagli effetti dei dadi.'),
                ),
                SizedBox(height: 20),
                Text(
                  'Strategia',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '1. Visita più isole possibile prima che finiscano le risorse.\n'
                      '2. Usa gli attacchi per rubare carte agli avversari.\n'
                      '3. Gestisci bene i token di Attacco (ripristinali attraccando ai porti).\n'
                      '4. Tieni d\'occhio la carta "Risorse Scarse": segnala la fase finale di gioco!',
                  style: TextStyle(fontSize: 18),
                ),
                // Aggiungi un'immagine esplicativa se disponibile
                // Image.asset('assets/vittoria.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }



}