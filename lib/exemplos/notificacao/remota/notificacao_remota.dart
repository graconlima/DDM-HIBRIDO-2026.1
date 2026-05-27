import 'package:ddm_20261/exemplos/notificacao/local/notificacao_local.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../modelos/notificacao.dart';

class NotificacaoRemota{

  NotificacaoLocal nl = NotificacaoLocal();
  FirebaseMessaging fm = FirebaseMessaging.instance;

  NotificacaoRemota(){
    inicializar();
  }

  inicializar() async {
    await fm.requestPermission();//iOS
    String? token = await fm.getToken();//o token gerado deve ser enviado aos backends para enviar notificacoes
    print("Token: $token");

    //app em foreground
    FirebaseMessaging.onMessage.listen((m){
      nl.notificar(Notificacao(id: m.notification!.android.hashCode, titulo: m.notification?.title, body: m.notification?.body, payload: m.data['dado_extra']));
      print("Nova mensagem!");
    });

    //app em background
    FirebaseMessaging.onMessageOpenedApp.listen((m){
      print("Notificacao aberta!");
    });
  }
}