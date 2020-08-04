import 'dart:typed_data';

final _decodeTable = Uint8List.fromList([
  146,
  178,
  204,
  241,
  54,
  111,
  183,
  98,
  158,
  4,
  102,
  77,
  119,
  184,
  87,
  165,
  151,
  97,
  205,
  73,
  159,
  242,
  202,
  126,
  17,
  182,
  51,
  48,
  136,
  40,
  175,
  1,
  123,
  10,
  56,
  12,
  113,
  69,
  68,
  212,
  71,
  127,
  67,
  229,
  196,
  153,
  221,
  203,
  59,
  156,
  58,
  108,
  110,
  217,
  215,
  172,
  160,
  0,
  63,
  117,
  194,
  2,
  225,
  185,
  226,
  188,
  149,
  38,
  32,
  152,
  39,
  180,
  80,
  99,
  106,
  244,
  125,
  47,
  134,
  135,
  168,
  187,
  132,
  129,
  237,
  112,
  255,
  76,
  186,
  176,
  228,
  198,
  138,
  9,
  52,
  15,
  70,
  46,
  122,
  161,
  214,
  120,
  75,
  145,
  60,
  81,
  65,
  191,
  220,
  43,
  30,
  232,
  5,
  144,
  72,
  181,
  190,
  7,
  103,
  89,
  105,
  197,
  169,
  84,
  234,
  195,
  25,
  100,
  139,
  8,
  95,
  14,
  174,
  163,
  248,
  233,
  82,
  42,
  142,
  11,
  235,
  218,
  162,
  148,
  252,
  140,
  21,
  166,
  222,
  223,
  209,
  31,
  211,
  224,
  23,
  250,
  253,
  243,
  57,
  28,
  45,
  78,
  251,
  208,
  254,
  91,
  189,
  20,
  66,
  19,
  18,
  86,
  207,
  55,
  74,
  150,
  201,
  147,
  34,
  37,
  164,
  143,
  26,
  193,
  49,
  247,
  118,
  64,
  16,
  173,
  236,
  128,
  249,
  36,
  115,
  133,
  101,
  238,
  53,
  33,
  29,
  157,
  88,
  114,
  199,
  27,
  200,
  246,
  13,
  116,
  107,
  177,
  44,
  131,
  41,
  230,
  96,
  206,
  24,
  245,
  121,
  210,
  240,
  90,
  61,
  170,
  83,
  35,
  22,
  179,
  155,
  85,
  171,
  79,
  124,
  231,
  137,
  104,
  93,
  154,
  141,
  167,
  130,
  192,
  50,
  239,
  92,
  6,
  216,
  109,
  62,
  94,
  227,
  213,
  219,
  3
]);

final _magicCode = Uint8List.fromList([149, 39, 95, 27, 149, 39, 95, 27]);

Uint8List decodeResource(Uint8List src) {
  if (src.length < _magicCode.length) return src;

  for (int i = 0; i < _magicCode.length; i++) {
    if (src[i] != _magicCode[i]) return src;
  }

  return Uint8List.fromList(
    List<int>.generate(
      src.length - _magicCode.length,
      (i) => _decodeTable[src[i + _magicCode.length]],
    ),
  );
}
