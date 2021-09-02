'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "310ef08eb8419a63c6abb74fe9829c91",
"assets/assets/logo.jpeg": "35eb110563ca9bfb944a86b6977fe694",
"assets/assets/profile.jpeg": "a1ebb6eb270eb590d753cae7fdc062a0",
"assets/assets/WhatsApp%2520Image%25202021-09-01%2520at%252013.08.00.jpeg": "aff1575d5e1ca503e04d0fc1632a3021",
"assets/assets/WhatsApp%2520Image%25202021-09-01%2520at%252013.08.01.jpeg": "58b07a3a3bde673960778201ba53a8a6",
"assets/assets/WhatsApp%2520Image%25202021-09-01%2520at%252013.08.02%2520(1).jpeg": "c7a8ab62cfa83370a3a276d6d1faecd1",
"assets/assets/WhatsApp%2520Image%25202021-09-01%2520at%252013.08.03.jpeg": "756647157a86f5b6a5aa03c2aa7c92ed",
"assets/assets/WhatsApp%2520Image%25202021-09-01%2520at%252013.08.04%2520(1).jpeg": "e1abc0107098fcfafd8fedc9d455bdaa",
"assets/assets/WhatsApp%2520Image%25202021-09-01%2520at%252013.08.04.jpeg": "a7eb68dd3eb91ca7e60cdd7fc9f781f5",
"assets/assets/WhatsApp%2520Image%25202021-09-01%2520at%252013.08.05.jpeg": "6578513fc65ae746a27f5a7354da8fa0",
"assets/assets/WhatsApp%2520Image%25202021-09-01%2520at%252013.08.06.jpeg": "bc9be7f29f80d6894bacccc275038326",
"assets/assets/WhatsApp%2520Image%25202021-09-01%2520at%252013.13.06%2520(1).jpeg": "847251ce254be984b6baa7030e238e4a",
"assets/assets/WhatsApp%2520Image%25202021-09-01%2520at%252013.13.06.jpeg": "058c4d925bf8f5b233f3d2c4b3f5363b",
"assets/assets/WhatsApp%2520Image%25202021-09-01%2520at%252013.13.07.jpeg": "f49d4cfd3df1e2bdcbd11a204180af0c",
"assets/assets/WhatsApp%2520Image%25202021-09-01%2520at%252013.13.08%2520(1).jpeg": "03c1d38d2be2113df38e7c3b03db6f87",
"assets/assets/WhatsApp%2520Image%25202021-09-01%2520at%252013.13.08.jpeg": "db097a55ee5fe53bc06c8b9e5447d5bf",
"assets/assets/WhatsApp%2520Image%25202021-09-01%2520at%252013.13.09.jpeg": "8e3a61d30cb0b56d76b65683a994fb6d",
"assets/assets/WhatsApp%2520Image%25202021-09-01%2520at%252013.26.01.jpeg": "1d6edb1f9291ef6a70519eb5b50439f0",
"assets/assets/WhatsApp%2520Image%25202021-09-01%2520at%252013.26.09.jpeg": "42c109df21166e017656b1b1205158cd",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "077610d6ee37ce87576102526a1ef31f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "e4474beecec2025fcd9fc0773a1af230",
"/": "e4474beecec2025fcd9fc0773a1af230",
"main.dart.js": "29d5aefab11afd25d948a538b062aae3",
"manifest.json": "5279be780fc4a810116877fbbeea7476",
"version.json": "ae0e625359f412559c8f598d58413460"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
