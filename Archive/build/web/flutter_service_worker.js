'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "74c0a67a38441d3a18a0153a8a3cf223",
"version.json": "275fe9e44524c257ed6e9e0f41b23da2",
"index.html": "a5a876ecc9ff4646920c2725ce5c9129",
"/": "a5a876ecc9ff4646920c2725ce5c9129",
"main.dart.js": "cd12b70ca218b7d1031595641971ebb2",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "8593469e04edaeec73dc145786e37c5a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "1540a35da460029868cc91d58f21600a",
"assets/AssetManifest.json": "9919662285011ba18e0cf3c0e96733d0",
"assets/NOTICES": "6b2ea7eef52361216fc4179c3591392e",
"assets/FontManifest.json": "540c4afa878c3b47219d3a1ca9ce8ca3",
"assets/AssetManifest.bin.json": "32e63db4d94a158397db1fe0fe12d728",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "1808ec43ee7e6cabdfb6de032965e703",
"assets/fonts/MaterialIcons-Regular.otf": "d430cd8a93e14be1bf49b1938845b797",
"assets/assets/images/consultingHeader2.png": "12203803348863390fc20ff5375d411d",
"assets/assets/images/email.png": "e544373deba1e009d3f1d72d07f46f70",
"assets/assets/images/no_course.png": "8ee3f973d63f71fffc55eba25ea798e3",
"assets/assets/images/no_resource.png": "5e1e8153f0e76a022ce6600faf62d40e",
"assets/assets/images/gal1.png": "704e143a9598ccc6606e5a642ab1e19f",
"assets/assets/images/r_and_i.png": "055f5407aadd05f6dc75dbbc4b38eee2",
"assets/assets/images/vidm.webp": "69a05993ef7d0aa68344f13f7caf6812",
"assets/assets/images/shop1_old.png": "cfe933066c427c19d1561c5d2433939e",
"assets/assets/images/arrow_right.png": "9e85f66b8d0b87e351edbef2474705a0",
"assets/assets/images/eventsHeader.png": "1645ea6e7f37c15053924a5b5d07e8d1",
"assets/assets/images/icon.png": "a6432c08806df296ad79af981202a234",
"assets/assets/images/gal3.png": "1450b9e5a57cd01e03632ad2435933aa",
"assets/assets/images/org_itv.png": "a5b2d6e1590d3f035d04634b817972ac",
"assets/assets/images/gal2.png": "ad5602da28d6eaf9f81fbf9e62ecfc7f",
"assets/assets/images/h4.webp": "e6847ebf94ddd6d267cee574f34efef1",
"assets/assets/images/shop_book.png": "e3d4fc807570a39c2afdfcdeb0f8f568",
"assets/assets/images/book.png": "e3624bb8c67ac47b17abd6deb6f98fe7",
"assets/assets/images/sa1.png": "8bba2ec76a85c38ca382d8ab1b0558e3",
"assets/assets/images/consultation.png": "01a42e5b552d5700ee8b29452b4c7ae2",
"assets/assets/images/coachingMobile1.webp": "f4b2f54a4a3fe1edcecc5049983d126b",
"assets/assets/images/gal18.png": "6d891f1dd4d3e31329d0a73b29112f10",
"assets/assets/images/eventsd.png": "e65648b5609bb8d365fbe8088224f1a9",
"assets/assets/images/gallery.png": "a138c5becb925b4c927d8651787f266f",
"assets/assets/images/gal6.png": "0ce7458e5dd924b59bbf92b49053a22d",
"assets/assets/images/org_ku.png": "5b1d54bdcb76c01e7adb06aaa8f1f6dd",
"assets/assets/images/org_ebs.png": "e3d17332feeb1d65e7dffa3426ee3988",
"assets/assets/images/cart.png": "dd9503f901f23854aa17b0a4bf5c6301",
"assets/assets/images/event1M.webp": "c8a9dc88bcabb8f2e250768b7633bee0",
"assets/assets/images/gal7.png": "eb304ff9385370e300365d9ed4744508",
"assets/assets/images/training1.png": "8db2528c785ae3fc734717b34d36a729",
"assets/assets/images/sa2.png": "c3d9b7b52e8aebd7029f4f8955e4d648",
"assets/assets/images/instagram.png": "dcaea03ea401ebd0e89076217c98cf80",
"assets/assets/images/gal5.png": "cc60521acc8e77984ffeba78af6b9de9",
"assets/assets/images/gal4.png": "7717dbd1dc0b4f7e025151cf6fd1f746",
"assets/assets/images/org_gt.png": "e8f99ea60edf744ab48875ecbe5e6443",
"assets/assets/images/shop1.webp": "075bd1c866a0addffc7edaf01db10ead",
"assets/assets/images/blog3.webp": "dced1527e3d9326838c4ee258b0f9c3f",
"assets/assets/images/blog_cover1.png": "7e65baa79e70d78bb973d771f0a55fa2",
"assets/assets/images/address.png": "b3678af93956392f423229181e83c0b9",
"assets/assets/images/book3.png": "d154337207b4bb5d7cb67c262caefe36",
"assets/assets/images/shop_audio.png": "8addff3529957fad2588f670239b707d",
"assets/assets/images/courseIcon2.png": "4088ccc1b64c4f3f2a80bc0cd9425465",
"assets/assets/images/aboutHeader2.png": "fb1f79d8176fdc139f632efdd62a9236",
"assets/assets/images/trainingHeader2.png": "8704c67c39732caa981c4d617880adc4",
"assets/assets/images/courseIcon3.png": "0f83413d0a902545e5339ed9a2be4955",
"assets/assets/images/h2.webp": "1d786c61b417732ed098dd081d43147d",
"assets/assets/images/consulting_option2.png": "1c8801b6bf780173cd2880535001edee",
"assets/assets/images/book2.png": "01dab0ab64a02ae6fff6d25761088b4e",
"assets/assets/images/blog4.webp": "c92ea6d8f897e1a652655a1a45e36c1d",
"assets/assets/images/shop_video.png": "89b2c5c38688902971a9f9fd9c569ffd",
"assets/assets/images/org_ecobank.png": "3b919b3032f70161b38227ab2175016f",
"assets/assets/images/courseIcon1.png": "4a9df975237a9057b238f3d8496fd2ce",
"assets/assets/images/iTV.png": "abf18568eec5d630041d69727e7ed9de",
"assets/assets/images/logout.png": "a024a65ccaaac7042f61e8bdf44dc1cc",
"assets/assets/images/shop2_old.png": "fad2061852004fa677cb9d15889ae38b",
"assets/assets/images/vid.webp": "47567d04614cc35d3a2e27ca132edaea",
"assets/assets/images/consulting_option1.png": "e249aa7d772a058fb899a7ac638032c8",
"assets/assets/images/book1.png": "a1e61ac1ed4fcddd29eca39499ab1b7c",
"assets/assets/images/coachingHeader.webp": "f58d45b45a98112efacab384a5a609ea",
"assets/assets/images/courseIcon4.png": "1cef991467bb34712b8e6902807e4a80",
"assets/assets/images/course1.webp": "3150f01eb6de2dae01e7f0a78832f9ae",
"assets/assets/images/trainingHeader3.webp": "bdec698b6e0b1b44f2d13149385be3f9",
"assets/assets/images/ebs.png": "c331f46ecc969b0877100fc4e8985596",
"assets/assets/images/shop3_old.png": "352e2459b0053a6cfc98484dbb58371e",
"assets/assets/images/org_total.png": "5a6546f4eed45bcf50d74a8cce1eb226",
"assets/assets/images/mh1.webp": "67ac430c379fa726596416ee46e0c226",
"assets/assets/images/h3.webp": "82c5f81d7fbb1fbdb2ce75bfd36f7ffc",
"assets/assets/images/org_globus.png": "1fceadc72f5929108023111fd818c0fc",
"assets/assets/images/channelsTV.png": "6ef75e59ace6ca06b66e12b8cf4ca944",
"assets/assets/images/org_seplat.png": "9078a84c428c1a719a598f38cd0f26dd",
"assets/assets/images/search.png": "f543af16e41ddc02a650d066c62f1847",
"assets/assets/images/coaching4.webp": "1ac6e93b91d0d3ed834b03aa94ccf74d",
"assets/assets/images/coursesHeader.png": "503970f2d74d68f966e4cd7b683d7f0d",
"assets/assets/images/testimonial_bubble.png": "8d6beef33fb13a86fa217bde0c4b19da",
"assets/assets/images/consulting.webp": "60f05dadcf44f7ceb9850aad34167fca",
"assets/assets/images/about_sola.webp": "1bb7c9a0d9a8de7203666ba4c96241d6",
"assets/assets/images/tiktok.png": "efbad174cbbbb114de6f2748671e507d",
"assets/assets/images/old_course1.png": "8b8e89faed6c67308c9b331da75076b7",
"assets/assets/images/old_course3.png": "c4a4bd42e5dbb928792decc594656d58",
"assets/assets/images/coachingHeader2.png": "b9c758cbc90e1567ac69fb2e3b10ce35",
"assets/assets/images/gal17.webp": "fd40aa71d00f8091ab05268d08f92d00",
"assets/assets/images/course2.webp": "59923a542ce0626ca6a73102047eaabf",
"assets/assets/images/form3.webp": "0d3f183e06bc7fd73d7da8a688306732",
"assets/assets/images/courses1.png": "5537422ae4e89cc4fd85fc5d11fe8abd",
"assets/assets/images/old_course2.png": "441a280567b3c7874ea8a8e7fe5e2a61",
"assets/assets/images/aboutHeader.png": "7dc75b6d58c7301dc71f20cef977c614",
"assets/assets/images/testmonial2.png": "4f2cc938dda615f13eb6e0e3e2f649ba",
"assets/assets/images/no_inbox.png": "baf2499390501ad89da7df460d211fc4",
"assets/assets/images/coaching.png": "2ba1c54525d193d6f7e21786cb0bd546",
"assets/assets/images/course3.webp": "7a27f1d03550b8a13b678154a4ccf78a",
"assets/assets/images/testimonial2.png": "4e05a0bf842197ecf6bfa27d5559336c",
"assets/assets/images/linkedin.png": "c1ff57390d223742dc6b4f1f377ae9bb",
"assets/assets/images/learn_success.png": "9977c4a8ad53006862b9473ea4132971",
"assets/assets/images/testmonial3.png": "cf6c6aedc172bf87f777ca6c1049409c",
"assets/assets/images/testmonial1.png": "97f66848454f8e3a3611ce34725ba5ff",
"assets/assets/images/profile.png": "ab78650baaa642eeb9a72dbf428f050f",
"assets/assets/images/resources.png": "e5801be31459a0ebcbb400bac18f194b",
"assets/assets/images/kuTV.png": "3717c61feb20836e41688e9b43ca690b",
"assets/assets/images/phone.png": "1eed71f63e833bffae50a776a835f0ec",
"assets/assets/images/social_channels.png": "6de5b7711fead8ea86b3bd2fcc4e3c28",
"assets/assets/images/h1.webp": "34735742c5ac9688af5cd0a5c794f3b0",
"assets/assets/images/testimonial1.png": "ffe8b6f5c829d7912ccc29b2f44651b8",
"assets/assets/images/coaching5.webp": "45fee0997fb0641a18e37d025fb04a62",
"assets/assets/images/coaching2.png": "1f6ad98aa382b8d9483e5fda11d09b6f",
"assets/assets/images/course4.webp": "ee7b518d579d33f78719857d4fa44ff0",
"assets/assets/images/coachingHeader3.webp": "863d31483b50cc1a1972d7504298e71b",
"assets/assets/images/gal9.png": "89da538ceaaa876a3214902dc0780989",
"assets/assets/images/gal8.png": "f8b69bdc38a15668efb947949dc1e695",
"assets/assets/images/youtube.png": "7f0b5dc5266af0f1f68e5750890f91ca",
"assets/assets/images/shop2.webp": "704612ce150c82d382d581986f9f6ba2",
"assets/assets/images/gal16.png": "bfa32debae8f012127ca52e7dccef400",
"assets/assets/images/about1.png": "e1349352eb204f6b207c40c49078e6ba",
"assets/assets/images/training.png": "e33a4f34d19d0f19930ccf5855cccd99",
"assets/assets/images/event1.webp": "03fe6abe8a693686cff21979c96a7431",
"assets/assets/images/form.png": "2e7ffa772320976a0be6d4674bb24f65",
"assets/assets/images/coaching1.png": "b9ac4e19651cb3e4b0c7af23754bf22e",
"assets/assets/images/gal14.png": "1a05a8f8bd241e28e3c260d3064212a6",
"assets/assets/images/drawer_icon.png": "a13b014829d50c0927e88e6de9806a6f",
"assets/assets/images/about2.png": "38a519722227dd581c9baa28d8c1f749",
"assets/assets/images/gal15.png": "116fca839b1d59be3ea87dd7c013d0b8",
"assets/assets/images/shop_pdf.png": "f372cc2030296c64919a25bde9f3c5b2",
"assets/assets/images/trainingHeader.png": "7ef309466acdd7001b16057f1df5dc0f",
"assets/assets/images/facebook.png": "330f059557014ecb3cd33eb228452972",
"assets/assets/images/meet.png": "00947c492ab833a180ef6f7fddc1bdde",
"assets/assets/images/gal11.png": "6a6fcf9e48bf25f77eda28259f45d81f",
"assets/assets/images/eventsm.png": "4fec3e75e48d41a22f33ae608b108268",
"assets/assets/images/post3.png": "059a472db903543527502fd6929b1784",
"assets/assets/images/post2.png": "db682c46dacd563a630f52a92927a4d9",
"assets/assets/images/coaching_option2.png": "45a80545737d33a0ba386561a3ef87e9",
"assets/assets/images/org_firstbank.png": "d2a43c6c9960d7ba4044fc098be067b5",
"assets/assets/images/gal10.png": "eb94ad01dfa355eaf735a742958e5dcf",
"assets/assets/images/coaching3.webp": "539a33e6dcdc933cf8eb81bdd70ced3b",
"assets/assets/images/form2.png": "bd807e08be501301d4523340146e78a1",
"assets/assets/images/org_ala.png": "91f91f492f7b980bf9b91f848b35a6e6",
"assets/assets/images/blog1.webp": "1061f1a0286f67a6fbf26d34f8692fb2",
"assets/assets/images/gal12.png": "9b61248992cffa22f3405f928459c068",
"assets/assets/images/blog2.png": "baf9438492090785037bf14900f20215",
"assets/assets/images/shop3.webp": "63f918ad0662cf16a7ef60a2d04ad0ee",
"assets/assets/images/consultingHeader.webp": "8faf998a4c33b5f9fb334f71190fd281",
"assets/assets/images/coachingMobile3.png": "31264aceb0d0a0f2f9337f74e4072c50",
"assets/assets/images/post1.png": "4f88907864736129683f970573623b26",
"assets/assets/images/shop_item1.png": "7b33773d5d5fc178b2320a9b81d0ecfa",
"assets/assets/images/coursesHeader2.png": "25067402130c1395b07141aa65bee427",
"assets/assets/images/coaching_option1.png": "f12b67c649f3f35ec5f55e12f51bf358",
"assets/assets/images/gal13.png": "e9b1c2fb87a7f0dd370b3507dca09365",
"assets/assets/images/no_event.png": "5f100826eb43ab38663b615fd2133d54",
"assets/assets/fonts/nunito-sans.regular.ttf": "fb98ed1700e8dfaf0764c11fc36a0a05",
"assets/assets/fonts/nunito-sans.extrabold.ttf": "e6a9e16cac802736f3c92c47d94a52de",
"assets/assets/fonts/Roboto-Regular.ttf": "df7b648ce5356ea1ebce435b3459fd60",
"assets/assets/fonts/nunito-sans.light.ttf": "3a318cfcc78904616af13303520a69a1",
"assets/assets/fonts/Suranna-Regular.ttf": "55dc7e059aa3b4c5885eea1539d63f73",
"assets/assets/fonts/StyleScript.otf": "e0c06f0b074a8041d7d033f62b3bbcd3",
"assets/assets/fonts/OpenSans-ExtraBold.ttf": "8bac22ed4fd7c8a30536be18e2984f84",
"assets/assets/fonts/nunito-sans.semibold.ttf": "9c443ad7c0f391c4854a6b7c0f52788b",
"assets/assets/fonts/nunito-sans.extralight.ttf": "bc36a8726e20804a94da3a12bd6eda84",
"assets/assets/fonts/OpenSans-Regular.ttf": "629a55a7e793da068dc580d184cc0e31",
"assets/assets/fonts/Roboto-Bold.ttf": "e31fcf1885e371e19f5786c2bdfeae1b",
"assets/assets/fonts/nunito-sans.bold.ttf": "51066f4d1d33630cd761e8cd0168d7b0",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
