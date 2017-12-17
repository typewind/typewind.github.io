<div id="player1" class="aplayer"></div>
<script src="/js/src/APlayer.min.js"></script>
<script type="text/javascript">
var ap = new APlayer({
    element: document.getElementById('player1'),                       // Optional, player element
    narrow: false,                                                     // Optional, narrow style
    autoplay: false,                                                    // Optional, autoplay song(s), not supported by mobile browsers
    showlrc: 0,                                                        // Optional, show lrc, can be 0, 1, 2, see: ###With lrc
    mutex: true,                                                       // Optional, pause other players when this player playing
    theme: '#e6d0b2',                                                  // Optional, theme color, default: #b7daff
    mode: 'random',                                                    // Optional, play mode, can be `random` `single` `circulation`(loop) `order`(no loop), default: `circulation`
    preload: 'metadata',                                               // Optional, the way to load music, can be 'none' 'metadata' 'auto', default: 'auto'
    listmaxheight: '513px',                                             // Optional, max height of play list
    music: {                                                           // Required, music info, see: ###With playlist
                title: 'secret base~君がくれたもの~',
                author: '茅野愛衣',
                url: 'http://devtest.qiniudn.com/secret base~.mp3',
                pic: 'http://devtest.qiniudn.com/secret base~.jpg',
        		lrc: 'https://github.com/MoePlayer/APlayer/blob/master/demo/secret%20base~%E5%90%9B%E3%81%8C%E3%81%8F%E3%82%8C%E3%81%9F%E3%82%82%E3%81%AE~.lrc'
    },
});
</script>
