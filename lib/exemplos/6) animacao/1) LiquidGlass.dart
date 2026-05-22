import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

main(){
  runApp(MaterialApp(home: MyGlassWidget()));

}

class MyGlassWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // This is the content that will be behind the glass
          Positioned.fill(
            child: Image.network(
              'https://picsum.photos/seed/glass/800/800',
              fit: BoxFit.cover,
            ),
          ),
          //Exemplo 1
          /*Stack(
            children: [
              // 2. Create a layer for liquid glass effects
              LiquidGlassLayer(
                // 3. Add your LiquidGlass widgets here
                child: LiquidGlass(
                  shape: LiquidRoundedSuperellipse(borderRadius: 30),
                  child: const SizedBox.square(dimension: 100),
                ),
              ),
            ],
          )*/

          //Exemplo 2
          /*Center(
            child: LiquidGlassLayer(
              settings: const LiquidGlassSettings(
                thickness: 20,
                blur: 10,
                glassColor: Color(0x33FFFFFF),
              ),
              child: LiquidGlass(
                shape: LiquidRoundedSuperellipse(
                  borderRadius: 50,
                ),
                child: const SizedBox(
                  height: 200,
                  width: 200,
                  child: Center(
                    child: FlutterLogo(size: 100),
                  ),
                ),
              ),
            ),
          ),*/
          //Exemplo 3
          Center(child: LiquidGlassLayer(
            settings: const LiquidGlassSettings(
              thickness: 20,
              blur: 10,
            ),
            child: LiquidGlassBlendGroup(
              blend: 20.0, // Controls how much shapes blend together
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LiquidGlass.grouped(
                    shape: LiquidRoundedSuperellipse(
                      borderRadius: 40,
                    ),
                    child: const SizedBox.square(dimension: 100),
                  ),
                  const SizedBox(height: 50),
                  LiquidGlass.grouped(
                    shape: LiquidRoundedSuperellipse(
                      borderRadius: 40,
                    ),
                    child: const SizedBox.square(dimension: 100),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}