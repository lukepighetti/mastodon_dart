import 'dart:math' show Random;

class MockProperties {
  static bool get boolean => _randomItem([true, false]);
  static int get integer => Random().nextInt(999);
  static String get string => Random().nextInt(99999999).toString();
  static Uri get uri => Uri.parse(_randomItem(["google.com", "github.com"]));

  static String get comment => _randomItem(_comments);
  static String get email => _randomItem(_emails);
  static String get firstName => fullName.split(" ").first;
  static String get fullName => _randomItem(_fullNames);
  static String get lastName => fullName.split(" ").last;

  static String get tag => _randomItem(["happy", "yum", "water", "fluffy"]);

  static DateTime get pastDate => DateTime.now()
      .subtract(Duration(seconds: Random().nextInt(30 * 24 * 60 * 60)));

  static Uri get avatarUri => Uri.parse(_randomItem([
        "https://randomuser.me/api/portraits/men/${Random().nextInt(99)}.jpg",
        "https://randomuser.me/api/portraits/women/${Random().nextInt(99)}.jpg",
      ]));

  static Uri get emojiUri => Uri.parse(_randomItem([
        "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/155/grinning-face_1f600.png",
        "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/155/face-with-tears-of-joy_1f602.png",
        "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/155/splashing-sweat-symbol_1f4a6.png",
        "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/155/aubergine_1f346.png",
      ]));

  static Uri get headerUri => Uri.parse(_randomItem([
        "https://www.canva.com/signup?signupRedirect=%2Fdesign%3Fcreate%3Dtrue%26media%3DMAA_AQWx-AQ%26layoutQuery%3D*&loginRedirect=%2Fdesign%3Fcreate%3Dtrue%26media%3DMAA_AQWx-AQ%26layoutQuery%3D*&referrer=twitter-post-templates",
        "https://www.canva.com/signup?signupRedirect=%2Fdesign%3Fcreate%3Dtrue%26media%3DMAA_AfG8OoE%26layoutQuery%3D*&loginRedirect=%2Fdesign%3Fcreate%3Dtrue%26media%3DMAA_AfG8OoE%26layoutQuery%3D*&referrer=twitter-post-templates",
        "https://marketplace.canva.com/MAA_AYqRMnc/1/0/thumbnail_large/canva-snowy-mountaintops-profile-header-MAA_AYqRMnc.jpg",
        "https://marketplace.canva.com/MAA_AcTcock/1/0/thumbnail_large/canva-purple-flower-profile-header-MAA_AcTcock.jpg",
      ]));

  static String get username =>
      _randomItem(["one", "lucky", "red", "sly"]) +
      _randomItem(["gerbal", "fedi", "masto", "ella"]) +
      Random().nextInt(9999).toString();

  static T _randomItem<T>(List<T> list) =>
      list[Random().nextInt(list.length - 1)];

  static const List<String> _comments = [
    "Hero, iconography, experience, shot – slick dude",
    "I want to learn this kind of hero! Teach me.",
    "Beastly work you have here.",
    "Really thought out! Everything feels nice.",
    "Extra sick atmosphere!!",
    "My 67 year old son rates this shot very admirable dude",
    "Red. Everything feels nice.",
    "Love your icons =)",
    "Mission accomplished. It's exquisite :-)",
    "Good. So minimal.",
    "It's delightful not just killer!",
    "Radiant! Adore the use of type and background!",
    "Mmh wondering if this comment will hit the generateor as well...",
    "Let me take a nap... great colour, anyway.",
    "I think I'm crying. It's that graceful.",
    "Leading the way mate.",
    "Such design, many layout, so elegant",
    "Such amazing.",
    "YEW!",
    "So magnificent and incredible!!",
    "This style has navigated right into my heart.",
  ];

  static const List<String> _emails = [
    "rhialto@att.net",
    "giafly@yahoo.com",
    "brainless@yahoo.ca",
    "agolomsh@yahoo.ca",
    "citizenl@sbcglobal.net",
    "wmszeliga@sbcglobal.net",
    "flavell@msn.com",
    "carcus@mac.com",
    "lipeng@yahoo.com",
    "skajan@me.com",
    "gavinls@verizon.net",
    "gozer@sbcglobal.net",
    "jgoerzen@sbcglobal.net",
    "barnett@me.com",
    "kalpol@me.com",
    "jsbach@msn.com",
    "wayward@yahoo.com",
    "bradl@icloud.com",
    "calin@att.net",
    "jdray@yahoo.ca",
  ];

  static const List<String> _fullNames = [
    /// Male
    "Malcolm Odea",
    "Cortez Janowski",
    "Waldo Mangano",
    "Bradly Kealey",
    "Val Stolp",
    "Julio Mcguirk",
    "Kristopher Fondren",
    "Cleveland Zielinski",
    "Augustine Summers",
    "Gonzalo Mandez",
    "Samuel Hinson",
    "Gerardo Charest",
    "Pablo Sandifer",
    "Russ Klepper",
    "Scotty Bethke",
    "Ferdinand Earnhardt",
    "Patricia Mcniff",
    "Anton Ronan",
    "Johnnie Nevels",

    ///Female
    "Xiomara Aylward",
    "Rona Currie",
    "Justine Gosser",
    "Adrien Smedley",
    "Keila Glines",
    "Lara Preas",
    "Magaly Ulman",
    "Clarinda Mickelson",
    "Ressie Nolasco",
    "Inga Overcast",
    "Susie Hallenbeck",
    "Tenisha Mazon",
    "Joy Mcniel",
    "Jetta Viger",
    "Verna Wordlaw",
    "Ardelle Mosely",
    "Laci Quesinberry",
    "Christeen Moulton",
    "Richelle Lafreniere",
    "Christin Session",
  ];
}
