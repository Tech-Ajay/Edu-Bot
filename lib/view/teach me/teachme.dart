import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathon/view/teach%20me/speechtotext.dart';
import 'package:hackathon/view/teach%20me/teach_me_custom.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:file_picker/file_picker.dart';

import 'package:syncfusion_flutter_pdf/pdf.dart';

class TeachMe extends StatefulWidget {
  const TeachMe({Key? key}) : super(key: key);

  @override
  State<TeachMe> createState() => _TeachMeState();
}

class _TeachMeState extends State<TeachMe> {
  TextToSpeech tts = TextToSpeech();
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  int index = 1;

  Future<List<int>> _readDocumentData(String name) async {
    final ByteData data = await rootBundle.load('assets/pdf/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  Future<void> _extractTextFromPDF({required String path}) async {
    //Load the PDF document.

    final PdfDocument document =
        PdfDocument(inputBytes: await _readDocumentData('$path'));

    //Create PDF text extractor to extract text.
    PdfTextExtractor extractor = PdfTextExtractor(document);
    //Extract text
    String text = extractor.extractText();
    tts.speak(text);
    //print(text);

    //Dispose the document.
    document.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    index = 1;
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});   
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  Future<void> _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  Future<void> _onSpeechResult(SpeechRecognitionResult result) async {
    _lastWords = result.recognizedWords;
    print(_lastWords);
    if (_lastWords=="pollution" || _lastWords=="teach me pollution" || _lastWords=="what is pollution" && index == 1) {
           tts.speak("${speak[2]}");
      index++;
                  await _stopListening();
                  index=1;
                  

    }
if (_lastWords=="preposition" || _lastWords=="teach me about preposition" || _lastWords=="what is preposition" || _lastWords=="chapter 4 preposition"  && index == 1) {
           tts.speak("${speak[3]}");
      index++;
                  await _stopListening();
                                    index=1;

    }
    if (_lastWords=="noun" || _lastWords=="now" || _lastWords=="what is noun" || _lastWords=="edubot tell me something about noun" && index == 1) {
           tts.speak("${speak[0]}");
      index++;
                  await _stopListening();
                                    index=1;

    }
      if (_lastWords=="shapes"  || _lastWords=="what is shapes" || _lastWords=="chapter 6 shapes" && index == 1) {
           tts.speak("${speak[0]}");
      index++;
                  await _stopListening();
                                    index=1;

    }
      if (_lastWords=="addition" || _lastWords=="chapter 7 addition" || _lastWords=="teach me addition" || _lastWords=="what is addition" && index == 1) {
           tts.speak("${speak[6]}");
      index++;
                  await _stopListening();
                                    index=1;

    }

    setState(() {});
    
  }
List<String> speak = [
      'Chapter 1, Noun. a word (other than a pronoun) used to identify any of a class of people, places, or things',
      'Chapter 2, My Family. My family has always been very supportive of my problems and help me come out of them. Every time someone talks about family, there are many things that come to the minds of different people. There are many types of families. These include small family, large family, joint family, nuclear family, and many more.Joint families are the largest type of family as far as people are concerned. Looking at a nuclear family, a person can see the value of a joint family but is separated from it. A joint family can be defined as a family where 3 generations of people live together. This includes grandparents, parents, uncles, aunts, and their children, with the grandfather being the head of the family.A small family comprises us, parents, and children. Here the father is the head of the family. A large family consists of grandparents, parents, and their children.  The small family and nuclear family are similar to each other in structure, but only the values differ.',
      'Chapter 3, Pollution. Pollution affects our health very much. Inhaling polluted air for a long time can cause lung diseases. There are other pollutions like noise pollution, plastic pollution, solid waste pollution.There are many types of pollution. All these pollutions affect our daily life. Moreover, it directly affects the quality of life we are living. People who live in the city are more affected by air pollution. Pollutants like carbon-die-oxide and carbon-monoxide pollute the air.People who live in the villages do not suffer from air pollution. Water pollution is a problem for them. Pollutants like herbicides, domestic wastes, insecticides make the water polluted there. Water pollution lowers the quality of agriculture.',
      'Prepostion is a word governing, and usually preceding, a noun or pronoun and expressing a relation to another word or element in the clause, as in the man on the platform, she arrived after dinner, what did you do it for ?',
      'Chapter 1, Noun. a word (other than a pronoun) used to identify any of a class of people, places, or things',
      'Chapter 2, My Family. My family has always been very supportive of my problems and help me come out of them. Every time someone talks about family, there are many things that come to the minds of different people. There are many types of families. These include small family, large family, joint family, nuclear family, and many more.Joint families are the largest type of family as far as people are concerned. Looking at a nuclear family, a person can see the value of a joint family but is separated from it. A joint family can be defined as a family where 3 generations of people live together. This includes grandparents, parents, uncles, aunts, and their children, with the grandfather being the head of the family.A small family comprises us, parents, and children. Here the father is the head of the family. A large family consists of grandparents, parents, and their children.  The small family and nuclear family are similar to each other in structure, but only the values differ.',
      'Chapter 7,  the action or process of adding something to something else.',
      'Prepostion is a word governing, and usually preceding, a noun or pronoun and expressing a relation to another word or element in the clause, as in the man on the platform, she arrived after dinner, what did you do it for ?',
      'Chapter 7, Noun. a word (other than a pronoun) used to identify any of a class of people, places, or things',
      'Chapter 2, My Family. My family has always been very supportive of my problems and help me come out of them. Every time someone talks about family, there are many things that come to the minds of different people. There are many types of families. These include small family, large family, joint family, nuclear family, and many more.Joint families are the largest type of family as far as people are concerned. Looking at a nuclear family, a person can see the value of a joint family but is separated from it. A joint family can be defined as a family where 3 generations of people live together. This includes grandparents, parents, uncles, aunts, and their children, with the grandfather being the head of the family.A small family comprises us, parents, and children. Here the father is the head of the family. A large family consists of grandparents, parents, and their children.  The small family and nuclear family are similar to each other in structure, but only the values differ.',
      'Chapter 3, Pollution. Pollution affects our health very much. Inhaling polluted air for a long time can cause lung diseases. There are other pollutions like noise pollution, plastic pollution, solid waste pollution.There are many types of pollution. All these pollutions affect our daily life. Moreover, it directly affects the quality of life we are living. People who live in the city are more affected by air pollution. Pollutants like carbon-die-oxide and carbon-monoxide pollute the air.People who live in the villages do not suffer from air pollution. Water pollution is a problem for them. Pollutants like herbicides, domestic wastes, insecticides make the water polluted there. Water pollution lowers the quality of agriculture.',
      'Prepostion is a word governing, and usually preceding, a noun or pronoun and expressing a relation to another word or element in the clause, as in the man on the platform, she arrived after dinner, what did you do it for ?',
    ];
  @override
  Widget build(BuildContext context) {
    

    List<String> chapter = [
      'Chapter: 1, \n Topic: Noun',
      'Chapter: 2, \n Topic: My Family',
      'Chapter: 3, \n Topic: Pollution',
      'Chapter: 4, \n Topic: Prepostion',
      'Chapter: 5, \n Topic: Traingles',
      'Chapter: 6, \n Topic: Shapes',
      'Chapter: 7, \n Topic: Addition',
      'Chapter: 8, \n Topic: Compound Interest',
      'Chapter: 9, \n Topic: World',
      'Chapter: 10, \n Topic: Politics',
      'Chapter: 1, \n Topic: Law',
      'Chapter: 12, \n Topic: Sociology',
    ];

    return Center(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Container(
            //   padding: EdgeInsets.all(16),
            //   child: Text(
            //     'Recognized words:',
            //     style: TextStyle(fontSize: 20.0),
            //   ),
            // ),
            FloatingActionButton(
              backgroundColor: Color(0xff6c64fa),
              onPressed:
                _speechToText.isNotListening
                      ? _startListening
                      : _stopListening,
              
                  // If not yet listening for speech start, otherwise stop
                  
             // tooltip: 'Listen',
              child: Icon(
                  _speechToText.isNotListening ? Icons.mic_off : Icons.mic),
            ),
        //     Expanded(
        //   child: Container(
        //     padding: EdgeInsets.all(16),
        //     child: Text(
        //       // If listening is active show the recognized words
        //       _speechToText.isListening
        //           ? '$_lastWords'
        //           // If listening isn't active but could be tell the user
        //           // how to start it, otherwise indicate that speech
        //           // recognition is not yet ready or not supported on
        //           // the target device
        //           : _speechEnabled
        //               ? 'Tap the microphone to start listening...'
        //               : 'Speech not available',
        //     ),
        //   ),
        // ),
          ],
        ),
        
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SpeechScreen()));
                        },
                        child: Image.asset(
                          "assets/images/stt.png",
                          width: MediaQuery.of(context).size.width * .15,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          //    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TeachMeCustom()));
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();

                          if (result != null) {
                            File file = File(result.files.single.name);
                            print(result.files.single.name);
                            _extractTextFromPDF(
                                path: result.files.single.name.trim());
                          } else {
                            // User canceled the picker
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff3f3d56),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          height: 200,
                          width: MediaQuery.of(context).size.width * .1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.upload,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              Text(
                                'upload pdf',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TeachMeCustom()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff3f3d56),
                            borderRadius: BorderRadius.circular(50),
                            // boxShadow: [
                            //   BoxShadow(
                            // color: Colors.pink.shade200,
                            //     spreadRadius: 2,
                            //     blurRadius: 4,
                            //   ),
                            // ],
                          ),
                          height: 200,
                          width: MediaQuery.of(context).size.width * .1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                    Icons.record_voice_over_outlined,
                                    size: 30,
                                    color: Colors.white),
                              ),
                              Text(
                                'Custom \nTeach me',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                                                        tts.stop();

                        },
                        child: Image.asset(
                          "assets/images/tts.png",
                          width: MediaQuery.of(context).size.width * .15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xff6c64fa),
                            borderRadius: BorderRadius.circular(15),
                            // boxShadow: [
                            //   BoxShadow(
                            // color: Colors.pink.shade200,
                            //     spreadRadius: 2,
                            //     blurRadius: 4,
                            //   ),
                            // ],
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 8),
                              child: Text(
                                " Chapter Wise Content ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Image.asset(
                          "assets/images/custom.png",
                          height: 200,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.transparent,
                      height: MediaQuery.of(context).size.height - 380,
                      width: MediaQuery.of(context).size.width * .6,
                      child: Center(
                        child: GridView.count(
                            scrollDirection: Axis.vertical,
                            mainAxisSpacing: 5.0,
                            crossAxisSpacing: 5.0,
                            crossAxisCount: 4,
                            // shrinkWrap: true,

                            //reverse: false,

                            children: List.generate(12, (index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff3f3d56),
                                    borderRadius: BorderRadius.circular(20),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    // color: Colors.pink.shade200,
                                    //     spreadRadius: 2,
                                    //     blurRadius: 4,
                                    //   ),
                                    // ],
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      tts.speak("${speak[index]}");
                                    },
                                    child: Text(
                                      "${chapter[index]}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              );
                            })),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
