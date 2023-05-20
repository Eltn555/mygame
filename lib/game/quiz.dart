myQuest(int level){
  final lvl1 = [
    {
      'id' : 0,
      'title' : 'Din va shariat',
      'topic' : "Alloh taoloning bandalariga yuborgan hukmlari to'plami bu din va sha'riat deyiladi, Alloh taolo bandalariga dunyo va ohirat rohatlariga erishmoqlari uchun to'g'ri yo'l yo'riqlardan iborat hukmlar yuborgan",
      'extraTopic' : "Bu hukmlarda banda qilishi lozim bo'lgan va qilishi taqiqlangan vazifalarning bayoni bor",
      'quest' : "Alloh taoloning bandalariga yuborgan hukmlari to'plami nima deb ataladi?",
      'singleAnswer' : true,
      'answers' : [
        "Din va shariat",
        "Vazifalar bayoni",
        "Hukmlar va din",
        "Din va she'riyat"
      ],
    },
    {
      'id' : 1,
      'title' : 'Din va shariat 2',
      'topic' : "Alloh taolo bandalari ichida eng loyiqlarini payg'ambar etib sayladi va o'sha payg'ambarlarga farishta Jabroil (a.s) vositasida din hukmlarini o'rgatdi. So'ngra payg'ambarlar bu hukmlarni odamlarga yetkazdilar",
      'extraTopic' : "«Alloh farishtalardan ham, odamlardan ham elchilarni O’zi tanlaydi. Alloh eshituvchi va ko‘ruvchidir». (Haj, 75.)",
      'quest' : "Alloh taolo payg'ambarlarga qaysi farishta vositasida din hukmlarini o'rgatdi?",
      'singleAnswer' : true,
      'answers' : [
        "Jabroil (a.s)",
        "Azroil (a.s)",
        "Isrofil (a.s)",
        "Mikoil (a.s)"
      ],
    },
    {
      'id' : 2,
      'title' : 'Imon va Islom',
      'topic' : "Alloh taolodan kelgan haq dinga ishonmoq imondandir, Islom esa Alloh taolodan kelgan haq dindir. Bu dinga ishonib, shu dinda buyurilgan vazifalarni bajarishga intilish barcha bandalarning burchidir.",
      'extraTopic' : "Bizlar Muhammad alayhissalomning ummatlarimiz. Muhammad alayhissalomga kelgan dinga ishonib, o'sha dinda buyurilgan amallarni qilamiz, unda taqiqlangan amallarni tark etamiz.",
      'quest' : "Alloh taolodan kelgan haq dinning nomi nima",
      'singleAnswer' : true,
      'answers' : [
        "Islom",
        "Xristian",
        "Hinduizm",
        "Buddizm"
      ],
    },
    {
      'id' : 3,
      'title' : 'Amal',
      'topic' : "Bandaning hayotda qilgan ishlari amal deyiladi. \n Islomda bandaning amali sakkiz qismga bo'linadi:\n-Farz\n-Vojib\n-Sunnat\n-Mustahab\n-Muboh\n-Harom\n-Makruh\n-Mustakrah",
      'extraTopic' : "“Kimki, tavba qilsa va imon keltirib yaxshi amallar qilsa, bas, Alloh ana o‘shalarning yomonlik (gunoh)larini yaxshilik (savob)ga aylantirib qo‘yur. Alloh mag‘firatli va rahmli zotdir”. (Furqon, 70.)",
      'quest' : "Islomda bandaning 8 amalida keltirilmagan amalni belgilang",
      'singleAnswer' : true,
      'answers' : [
        "Halol",
        "Farz",
        "Vojib",
        "Sunnat"
      ],
    },
    {
      'id' : 4,
      'title' : 'Farz amali',
      'topic' : "Farz Alloh taolo buyurgan amaldir. Uni qilgan kishi savob topadi. Uzrsiz bajarmagan kishi gunohkor bo'ladi. Uning zarurligiga ishonmagan kishi esa kofir va imonsiz sanaladi.",
      'extraTopic' : "Farz amaliga kiruvchi amallar:\n -Alloh taologa iymon keltirish\n -Islom dinidagi besh vaqt namozni o'qish\n -Ramazon oyida har kuni ro'za tutish\n -Zakot berish\n -Haj qilish",
      'quest' : "Farz amali haqida qaysi qatorda to'g'ri ma'lumot berilgan?",
      'singleAnswer' : true,
      'answers' : [
        "Barchasi to'g'ri",
        "Uni qilgan kishi savob topadi",
        "Uzrsiz bajarmagan kishi gunohkor bo'ladi",
        "Uning zarurligiga ishonmagan kishi esa kofir va imonsiz sanaladi"
      ],
    },
    {
      'id' : 5,
      'title' : 'Vojib amali',
      'topic' : "Vojib - Islom dinida bajarilishi shart bo'lgan amal. Uni bajargan kishi savob oladi, bajarmaganlar gunohkor bo'ladi. Vojib amalga ishonmagan kishi kofir va imonsiz bo'lmasa ham, katta gunohga botadi.",
      'extraTopic' : "Vojib amalga kiruvchi amallar:\n -Vitr namozini o'qish\n -Hayit namozlarini o'qish\n -Sadaqa va fitr berish\n -Qurbonlik so'yish\n -Qur'ondan sajda oyatlari o'qilgan paytda sajda qilish",
      'quest' : "Vojib amalga ishongan kishi...",
      'singleAnswer' : true,
      'answers' : [
        "Katta gunohga botadi",
        "Kofir bo'ladi",
        "Imonsiz bo'ladi",
      ],
    },
    {
      'id' : 6,
      'title' : 'Sunnat amali',
      'topic' : "Sunnat - Payg'ambarimiz Muhammad alayhissalomning qilgan amallari. Sunnat amalini qilgan kishi savob topadi. Qilmagan kishi gunohkor bo'lmasa-da, qiyomat kuni malomatga qoladi, Payg'ambarimiz shafoatlariga loyiq bo'lmaydi.",
      'extraTopic' : "Sunnat amali quyidagi amallarda ko'rinadi:\n -Yaxshi ishlarni “Bismillahir rohmanir rohim“, deya boshlash\n -Mo'min kishilarga salom berish\n -Qur'on o'qishni “A'uzu billahi minash shaytonir rohim“ so'zlari bilan boshlash\n singari amallardir",
      'quest' : "Noto'gri javobni toping",
      'singleAnswer' : true,
      'answers' : [
        "Sunnat amalini qilmagan kishi gunohkor bo'ladi",
        "Sunnat amalini qilmagan kishi qiyomat kuni malomatda qoladi",
        "Sunnat amalini qilgan kishi savob topadi",
        "Sunnat amalini qilmagan kishi Payg'ambarimiz shafoatlariga loyiq bo'lmaydi"
      ],
    },
    {
      'id' : 7,
      'title' : 'Mustahab amali',
      'topic' : "Mustahab Payg'ambarimiz Muhammad alayhissalom ba'zan bajargan va ba'zan bajarishni lozim ko'rmagan amaldir. Uni qilgan kishi savob topadi. Ammo qilmasa, gunohkor bo'lmaydi. Qiyomat kuni azob va malomatga ham qolmaydi.",
      'extraTopic' : "Mustahab amaliga:\n -Nafl namoz o'qish\n -Nafl ro'za tutish\n -Nafl sadaqa berish\n -Doim tahoratli yurish\nkabi amallar kiradi",
      'quest' : "Mustahab amali bo'lmagan javobni toping",
      'singleAnswer' : true,
      'answers' : [
        "Islom dinidagi 5 vaqt namozni o'qish",
        "Doim tahoratda yurish",
        "Nafl ro'za tutush",
        "Nafl sadaqa berish"
      ],
    },
    {
      'id' : 8,
      'title' : 'Muboh amali',
      'topic' : "Muboh shunday amalki, qilsa ham qilmasa ham durust bo'laveradi. Undan kishi savob ham, gunoh ham topmaydi. Qilish qilmaslik bandaning ihtiyoridadir",
      'extraTopic' : "Mubohga misol bo'ladigan amallar:\n -Halol taomlarni yeyish\n -Halol ichimliklarni ichish\n -O'tirish\n -Turish\n -Yurish\n -Zararsiz so'zlarni so'zlash",
      'quest' : "To'g'ri javobni toping",
      'singleAnswer' : true,
      'answers' : [
        "Muboh amal qilgan kishi gunoh ham savob ham topmaydi",
        "Barcha javoblar to'g'ri",
        "Muboh amal qilgan kishi gunohkor bo'ladi",
        "Muboh amal qilgan kishi savob topadi"
      ],
    },
    {
      'id' : 9,
      'title' : "Harom amali",
      'topic' : "Harom Islom dinida qat'iy taqiqlangan amaldir. Uni qilgan kishi qattiq gunohga botadi, uni halol deguvchilar kofir va imonsiz hisoblanadi",
      'extraTopic' : "Harom ishlar:\n -Nohaq odam o'ldirish\n -Odamzodga va hayvonotga zulm qilish\n -G'iybat qilish\n -O'g'rilik qilish\n -Yolg'onchilik\n -Aroqxo'rlik\n -Zinokorlik\nkabi ishlar",
      'quest' : "Harom amali bo'lmagan javobni toping",
      'singleAnswer' : true,
      'answers' : [
        "Doim tahoratda yurish",
        "Nohaq odam o'ldirish",
        "G'iybat qilish",
        "Aroqxo'rlik",
      ],
    },
    {
      'id' : 10,
      'title' : "Makruh amali",
      'topic' : "Makruh Islom dini taqiqlagan amal. Makruhni qilmagan kishi savobga qoladi, qilgan kishi esa azoblanishi mumkun. Uni qilgan kishi kofir bo'lmasada, gunohga botadi",
      'extraTopic' : "Makruh amali quyidagi ishlarda ko'rinadi:\n -Masjidga tuflash\n -(Fahsh)nag'malarga quloq solish\n -Odobsiz she'rlarni kuylab hofizlik qilish\n -Odamlar ichida masxarabozlik qilish\n -Uyatsiz she'rlarni bitish\nkabi amallar",
      'quest' : "To'g'ri javobni toping",
      'singleAnswer' : true,
      'answers' : [
        "Makruh - Islom dini taqiqlagan amal",
        "Makruhni qilgan kishi savobga qoladi",
        "Makruhni qilgan kishi gunohga botmaydi",
      ],
    },
    {
      'id' : 11,
      'title' : "Mustakrah amali",
      'topic' : "Mustakrah shunday amalki, uni qilgandan ko’ra qilmagan yaxshiroqdir. Qilgan kishi gunohkor sanalmasa-da, odobsiz bo’ladi. Qiyomatda azobga qolishi mumkin.",
      'extraTopic' : "Bu amalga quyidagilar kiradi:\n -Taomni katta-katta yeyish\n -Bozorda, ko’chada ovqatlanish\n -Baland ovoz bilan kekirish\n -Hayqirib esnash kabilar",
      'quest' : "Mustakrah amali bo'lmagan amalni toping",
      'singleAnswer' : true,
      'answers' : [
        "G'iybat qilish",
        "Bozorda, ko’chada ovqatlanish",
        "Taomni katta-katta yeyish",
        "Hayqirib esnash kabilar",
      ],
    },
    {
      'id' : 12,
      'title' : "Balog'at va oqillik",
      'topic' : " Islomdagi barcha amallarga rioya qilishlik balog’at yoshiga yetgan va aqlini tanigan kishilarga buyurilgan.\n Balog'at yoshidagilar bu - kamolotga yetgan kishilardir va go'daklar balog'at yoshida emaslar.\n Aqlli kishilarni oqil desa bo'ladi va aqli zaif odamlar bundan mustasno",
      'extraTopic' : "Go’daklar va devonalar farzu vojib amallarni ado qilmasalar yoki harom amallardan saqlanishga qodir bo’lmasalar gunohkor bo’lmaydilar. Chunki ular uzrlidirlar.\n O’g’il bolalar erkaklik alomati bilinganida. Ya’ni, o’n ikki yoshlarida balog'atga yetadilar. Qizlarda qizlik alomati zohir bo’lganida. Ya’ni, to’qqiz yoshlarida balog'at yoshiga yetadilar",
      'quest' : "Kimlar Islomdagi amallarga rioya qilmasalar ham gunohkor bo'lmaydilar",
      'singleAnswer' : true,
      'answers' : [
        "Balog'at yoshiga yetmaganlar va aqli zaiflar",
        "Balog'at yoshiga yetgan kishilar",
        "Oqil kishilar",
        "Kamolotga yetgan kishilar",
      ],
    },
    {
      'id' : 13,
      'title' : "Ibodat",
      'topic' : "Amallar va ibodatlarning ulug’rog’i beshta amaldir:\n —Alloh taoloning borligiga, har bir sifatiga va Islom diniga, buyurilgan har bir hukmning haqligiga ishonish\n -Har kuni besh vaqt namoz o’qish\n -Ramazon oyi davomida har kuni ro’za tutish\n -Ortiqcha molidan har yili bir marta muhtojlarga zakot berishn\n -Qurbi yetsa, umri davomida bir bora Makkai Mukarramaga borib haj qilish",
      'extraTopic' : "",
      'quest' : "",
      'singleAnswer' : true,
      'answers' : [
        "",
        "",
        "",
        "",
      ],
    },
    {
      'id' : 9,
      'title' : "",
      'topic' : "",
      'extraTopic' : "",
      'quest' : "",
      'singleAnswer' : true,
      'answers' : [
        "",
        "",
        "",
        "",
      ],
    },
    {
      'id' : 9,
      'title' : "",
      'topic' : "",
      'extraTopic' : "",
      'quest' : "",
      'singleAnswer' : true,
      'answers' : [
        "",
        "",
        "",
        "",
      ],
    },
    {
      'id' : 9,
      'title' : "",
      'topic' : "",
      'extraTopic' : "",
      'quest' : "",
      'singleAnswer' : true,
      'answers' : [
        "",
        "",
        "",
        "",
      ],
    },{
      'id' : 9,
      'title' : "",
      'topic' : "",
      'extraTopic' : "",
      'quest' : "",
      'singleAnswer' : true,
      'answers' : [
        "",
        "",
        "",
        "",
      ],
    },
    {
      'id' : 9,
      'title' : "",
      'topic' : "",
      'extraTopic' : "",
      'quest' : "",
      'singleAnswer' : true,
      'answers' : [
        "",
        "",
        "",
        "",
      ],
    },
    {
      'id' : 9,
      'title' : "",
      'topic' : "",
      'extraTopic' : "",
      'quest' : "",
      'singleAnswer' : true,
      'answers' : [
        "",
        "",
        "",
        "",
      ],
    },



    // {
    //   'id' : 9,
    //   'title' : "",
    //   'topic' : "",
    //   'extraTopic' : "",
    //   'quest' : "",
    //   'singleAnswer' : true,
    //   'answers' : [
    //     "",
    //     "",
    //     "",
    //     "",
    //   ],
    // }
  ];


  if(level == 1){
    return lvl1;
  } else {
    return lvl1;
  }
}

