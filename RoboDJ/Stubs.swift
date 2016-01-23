

struct Stubs {
    static var playlists: [Playlist] = !Settings.loadStubData ? [] : [
        PlaylistStub(id: 0, name: "Jazz", count: 192),
        PlaylistStub(id: 1, name: "Rock", count: 180),
        PlaylistStub(id: 2, name: "Disco", count: 34),
        PlaylistStub(id: 3, name: "Electro", count: 5),
    ]
}
