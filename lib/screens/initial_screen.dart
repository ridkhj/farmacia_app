
import 'package:farmacia_app/components/product.dart';
import 'package:farmacia_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class InitialScreen extends StatefulWidget {
  const InitialScreen({
    super.key,
  });

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}



class _InitialScreenState extends State<InitialScreen> {

  TextStyle style = const TextStyle(fontSize: 17, fontWeight: FontWeight.w600);
  final List<String> categorias = [
    'promocao',
    'analgesico',
    'antibiotico',
    'vitamina',
    'antidepressivo',
    'laxante'
  ];
  List<String> selectedCategorias = [];

  @override
  Widget build(BuildContext context) {

    final List<Product> listaDeProdutos = [
      Product(
        name: 'Pyridium',
        picture: 'assets/images/pyridium.jpg',
        price: 12.49,
        description: '100mg - 22 comprimidos',
        bigDescription: 'PyIridium é indicado para o alívio da disúria, de dor, ardor, desconforto para urinar e outros sintomas decorrentes da irritação da mucosa do trato urinário inferior causados por infecção, trauma, cirurgia, procedimentos endoscópicos ou passagens de sondas ou cateteres. O uso da fenazopiridina não deve retardar o diagnóstico definitivo e o tratamento das condições causais, nem ser usado como um substituto para cirurgia específica ou tratamento antimicrobiano.\n\nA fenazopiridina é compatível com a terapêutica antimicrobiana e pode auxiliar no alívio dos sintomas até que a terapêutica antimicrobiana comece a controlar a infecção. O tratamento de infecção do trato urinário com fenazopiridina não deve exceder dois dias. ',
        category: 'analgesico',
        promo: false,
        contextCart: context,
      ),
       Product(
        name: 'Cibazol',
        picture: 'assets/images/cibazol.jpg',
        price: 00.49,
        description: '50mg - 20 comprimidos',
        bigDescription: 'Cibazol: Diga adeus aos vermes intestinais e viva com mais saúde!\n\nCansado de sofrer com os sintomas incômodos dos vermes intestinais?\n\nCibazol é a solução completa para você e sua família! Um antiparasitário eficaz que combate diversos tipos de vermes, proporcionando mais saúde e bem-estar.\n\nNão deixe os vermes intestinais atrapalharem sua vida!\nTome Cibazol e viva com mais saúde!\nCibazol: A sua saúde em primeiro lugar.',
        category: 'antiverme',
        promo: false,
        contextCart: context,
      ),
      Product(
        name: 'Rivotril',
        picture: 'assets/images/rivotril.png',
        price: 28.93,
        description: '2mg - 30 comprimidos',
        bigDescription: 'Rivotril pertence à classe dos benzodiazepínicos, medicamentos que causam inibição leve do sistema nervoso,\ncom consequente ação anticonvulsivante, sedativa leve, relaxante muscular e tranquilizante.\n\nClassificação - Tarja Preta\nPartes do Corpo	- Para Sistema Nervoso\n Forma de Administração - Sublingual, Via Oral',
        category: 'antidepressivo',
        promo: false,
        contextCart: context,
      ),
      Product(
        name: 'Amoxicilina',
        picture: 'assets/images/amoxilina.png',
        price: 10.19,
        description: '500mg - 15 capsulas',
        bigDescription: '500mg Genérico Ems 15 Comprimidos contém uma penicilina chamada amoxicilina como ingrediente ativo.\nA amoxicilina pertence ao grupo dos antibióticos penicilânicos.\nA amoxicilina é usado no tratamento de uma gama de infecções causadas por bactérias, que podem manifestar-se nos pulmões (pneumonia e bronquite), nas amígdalas (amigdalite), nos seios da face (sinusite), no trato urinário e genital, na pele e nas mucosas.\nA amoxicilina atua destruindo as bactérias que causam essas infecções.',
        category: 'antibiotico',
        promo: false,
        contextCart: context,
      ),
      Product(
        name: 'Dipirona',
        picture: 'assets/images/dipirona.png',
        price: 14.19,
        description: '1g - 10 comprimidos',
        bigDescription: '''
Cansado da dor e da febre te atrapalhando?

Apresentamos a Dipirona 1g, a solução completa para o seu alívio rápido e eficaz!

Com apenas 1 comprimido, você desfruta de:

* Alívio rápido da dor: Dores de cabeça, musculares, articulares e até cólicas menstruais não resistem à Dipirona 1g.
* Febre controlada: Diga adeus à febre alta e aproveite noites tranquilas e dias mais produtivos.
* Ação prolongada: O efeito da Dipirona 1g dura até 4 horas, para que você possa aproveitar seus momentos sem interrupções.

Dipirona 1g, sua aliada para uma vida sem dor e febre!

Disponível sem prescrição médica.

Consulte a bula e siga as instruções de uso.

Lembre-se:

* Este medicamento não é indicado para crianças menores de 3 meses.
* Mulheres grávidas ou que amamentam devem consultar um médico antes de usar.
* Em caso de hipersensibilidade à dipirona ou outros componentes da fórmula, não utilize o medicamento.
* Mantenha fora do alcance de crianças.

Dipirona 1g. Aliviando sua dor, cuidando da sua saúde.
''',
        category: 'analgesico',
        promo: false,
        contextCart: context,
      ),
       Product(
        name: 'Muvinlax',
        picture: 'assets/images/muvinlax.png',
        price: 47.19,
        description: '14g - 20 sachês',
        bigDescription:'''
## Muvinlax: Aliviando a constipação intestinal de forma suave e eficaz!

Cansado de sofrer com constipação intestinal?

Apresentamos o Muvinlax, a solução ideal para quem busca um alívio suave e eficaz da prisão de ventre.

Com apenas 1 comprimido por dia, você desfruta de:

* Eliminação natural: Muvinlax age estimulando os movimentos intestinais de forma natural, sem causar cólicas ou desconforto.
* Efeito prolongado: O efeito do Muvinlax dura até 12 horas, proporcionando alívio duradouro e regularidade intestinal.
* Fórmula suave: Muvinlax é feito com ingredientes naturais e de alta qualidade, ideal para quem busca uma solução suave e segura.

Muvinlax, seu aliado para uma vida livre da constipação intestinal!

Disponível sem prescrição médica.

Consulte a bula e siga as instruções de uso.

Lembre-se:

* Este medicamento não é indicado para crianças menores de 6 anos.
* Mulheres grávidas ou que amamentam devem consultar um médico antes de usar.
* Em caso de hipersensibilidade aos ingredientes do Muvinlax, não utilize o medicamento.
* Mantenha fora do alcance de crianças.

Muvinlax. Aliviando a constipação, cuidando da sua saúde intestinal.
''',
        category: 'laxante',
        promo: false,
         contextCart: context,
      ),
      Product(
        name: 'tamarine',
        picture: 'assets/images/tamarine.png',
        price: 121.49,
        description: '150g - geleia',
        bigDescription:'''
## Tamarine Geléia Zero Açúcar: Alívio natural para a prisão de ventre sem adição de açúcares!

Cansado de sofrer com intestino preso?

Conheça o **Tamarine Geléia Zero Açúcar**, a solução natural e eficaz para aliviar a constipação intestinal sem adição de açúcares!

Composto por plantas medicinais cuidadosamente selecionadas, o Tamarine Geléia Zero Açúcar atua de forma suave e eficaz, promovendo:

* Ativação natural das secreções intestinais: Estimula a produção de secreções naturais que facilitam a passagem do bolo fecal, proporcionando um alívio suave e sem desconforto.
* Restauração da função intestinal normal: Auxilia na regulação do trânsito intestinal, promovendo o funcionamento regular do intestino sem causar irritação.
* Alívio eficaz da constipação: Combate a prisão de ventre de forma natural e eficaz, proporcionando mais bem-estar e qualidade de vida.

Tamarine Geléia Zero Açúcar: o seu aliado para um intestino saudável!

Benefícios adicionais:

* Fórmula sem açúcar: Ideal para diabéticos e pessoas que controlam o consumo de açúcar.
* Sabor agradável: Sabor de ameixa que torna o consumo mais prazeroso.
* Prático de usar: Disponível em formato de geléia, pronto para ser consumido.

Disponível sem prescrição médica.

Consulte a bula e siga as instruções de uso.

Lembre-se:

* Este medicamento não é indicado para crianças menores de 3 meses.
* Mulheres grávidas ou que amamentam devem consultar um médico antes de usar.
* Em caso de hipersensibilidade aos componentes do Tamarine Geléia Zero Açúcar, não utilize o medicamento.
* Mantenha fora do alcance de crianças.

Tamarine Geléia Zero Açúcar. Aliviando a prisão de ventre, cuidando da sua saúde intestinal de forma natural!
''',
        category: 'laxante',
        promo: false,
        contextCart: context,
      ),
       Product(
        name: 'Neosaldina',
        picture: 'assets/images/neosaldina.png',
        price: 34.29,
        description: '360mg - 20 capsulas',
        bigDescription:'''
## Neosaldina: Alívio rápido e eficaz para dores de cabeça e enxaqueca!

Neosaldina combina três ativos poderosos que combatem a dor de cabeça na sua origem:

* **Dipirona:** Reduz a sensibilidade à dor, aliviando o desconforto rapidamente.
* **Isometepteno:** Diminui a dilatação dos vasos sanguíneos na cabeça, contribuindo para a redução da dor e potencializando o efeito analgésico.
* **Cafeína:** Atua como um estimulante do sistema nervoso central e vasoconstritor, diminuindo o calibre dos vasos sanguíneos cranianos, sendo especialmente útil no tratamento de enxaquecas.

Neosaldina age rápido e por até 6 horas, proporcionando alívio duradouro da dor para que você possa aproveitar seus dias sem interrupções.

**Modo de usar:**

* Uso oral.
* 1 a 2 drágeas (em dose única) a cada 6 horas ou 4 vezes ao dia.
* Não tome mais de 8 drágeas por dia (4 x 2 drágeas).
* Não parta, abra ou mastigue o comprimido.

**Composição:**

* Dipirona 300mg
* Mucato de isometepteno 30mg
* Cafeína anidra 30mg

**Neosaldina. Sua aliada contra as dores de cabeça e enxaqueca.**

**Disponível sem prescrição médica.**

**Consulte a bula e siga as instruções de uso.**

**Lembre-se:**

* Este medicamento não é indicado para crianças menores de 3 meses.
* Mulheres grávidas ou que amamentam devem consultar um médico antes de usar.
* Em caso de hipersensibilidade aos componentes da Neosaldina, não utilize o medicamento.
* Mantenha fora do alcance de crianças.

**Neosaldina. Aliviando a dor, cuidando da sua saúde.**
''',
        category: 'analgesico',
        promo: false,
         contextCart: context,
      ),
       Product(
        name: 'Sertralina',
        picture: 'assets/images/cloridrato_sertralina.png',
        price: 85.11,
        description: '50mg - 30 comprimidos',
        bigDescription:'''
## Cloridrato de Sertralina: Aliviando os sintomas da depressão, ansiedade e outros transtornos

Cloridrato de Sertralina é um medicamento antidepressivo eficaz no tratamento de diversos transtornos, incluindo:

* **Depressão:** Alivia os sintomas da depressão, como tristeza profunda, perda de interesse em atividades, alterações no apetite e do sono, fadiga, dificuldade de concentração e pensamentos negativos.
* **Depressão com ansiedade:** Combate os sintomas da depressão e da ansiedade, como agitação, inquietação, nervosismo, dificuldade de relaxar e pensamentos intrusivos.
* **Transtorno do pânico:** Reduz as crises de pânico, caracterizadas por episódios súbitos de medo intenso acompanhados de sintomas físicos como taquicardia, sudorese, falta de ar e tontura.
* **Transtorno do estresse pós-traumático (TEPT):** Ameniza os sintomas do TEPT, como flashbacks, pesadelos, reexperimentação do trauma, ansiedade, irritabilidade e dificuldade de concentração.
* **Fobia social (transtorno de ansiedade social):** Alivia o medo intenso de situações sociais, como falar em público, participar de eventos ou conhecer novas pessoas.
* **Síndrome da tensão pré-menstrual (TPM) e transtorno disfórico pré-menstrual (TDPM):** Reduz os sintomas físicos e emocionais da TPM e do TDPM, como alterações de humor, irritabilidade, inchaço, dores de cabeça e fadiga.

**Cloridrato de Sertralina** atua no cérebro aumentando os níveis de serotonina, um neurotransmissor importante para o humor, o sono, o apetite e a regulação das emoções.

**Benefícios do Cloridrato de Sertralina:**

* Alívio eficaz dos sintomas da depressão, ansiedade e outros transtornos.
* Melhora do humor e da qualidade de vida.
* Aumento da disposição e da energia.
* Redução da ansiedade e dos pensamentos negativos.
* Melhora do sono e do apetite.
* Maior capacidade de concentração e foco.
* Fortalecimento da autoestima e da confiança.

**Cloridrato de Sertralina** deve ser usado sob orientação médica. O médico irá avaliar a sua condição e determinar a dosagem correta para você.

**Importante:**

* **Este medicamento não é indicado para crianças e adolescentes.**
* **Mulheres grávidas ou que amamentam devem consultar um médico antes de usar.**
* **Em caso de hipersensibilidade aos componentes do Cloridrato de Sertralina, não utilize o medicamento.**
* **Mantenha fora do alcance de crianças.**

**Cloridrato de Sertralina. Uma opção eficaz para o tratamento da depressão, ansiedade e outros transtornos.**

**Consulte a bula e siga as instruções de uso.**
''',
        category: 'antidepressivo',
        promo: false,
         contextCart: context,
      ),


    ];

    var mediaQuery = MediaQuery.of(context);
    final filterProducts = listaDeProdutos.where((product) {
      return selectedCategorias.isEmpty || selectedCategorias.contains(product.category);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.red[300],
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (contextNew) => CartScreen(contextCart: context ,)));
                },
                icon: const Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.black,
                  size: 28,
                ))
          ],
          title: Text(
            "Farmácia Jatobá",
            style: style.copyWith(fontSize: 21),
          ),
          elevation: 0,
          backgroundColor: Colors.red[300],
          leading: const Icon(
            Icons.local_hospital,
            color: Colors.black,
            size: 28,
          )),
      //floatingActionButton: FloatingActionButton(),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        const Text(
          "nossa localização",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                height: mediaQuery.size.height * 0.15,
                width: mediaQuery.size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.blueGrey[300],
                    borderRadius: BorderRadius.circular(12)),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      launcher.launchUrl(Uri.parse(
                          'https://maps.app.goo.gl/HfKbiyVsniDeM3o38'));
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/farmacia_jatoba.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: SizedBox(
              height: mediaQuery.size.height * 0.173,
              width: mediaQuery.size.width * 0.9,
              // decoration: BoxDecoration(
              //   color: Colors.white38,
              //   borderRadius: BorderRadius.circular(12)
              // ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: categorias
                    .map((categoria) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilterChip(
                            padding: EdgeInsets.all(0),
                            selected: selectedCategorias.contains(categoria),
                            label: Text(categoria),
                            onSelected: (selected) {
                              setState(() {
                                if(selected){
                                  selectedCategorias.add(categoria);
                                }else{
                                  selectedCategorias.remove(categoria);
                                }
                              });
                            },
                          ),
                    ))
                    .toList(),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: mediaQuery.size.height * 0.5,
              width: mediaQuery.size.width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.red[300],
                  borderRadius: BorderRadius.circular(12)),
              child: GridView.builder(
                itemCount: filterProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  Product product = filterProducts[index];
                  return product;
                },
              )),
        ),
      ]),
    );
  }
}
