<div id="player1" class="aplayer"></div>
<script src="/js/src/APlayer.min.js"></script>
<script type="text/javascript">
var ap = new APlayer({
    element: document.getElementById('player1'),                       // Optional, player element
    narrow: false,                                                     // Optional, narrow style
    autoplay: false,                                                    // Optional, autoplay song(s), not supported by mobile browsers
    showlrc: 0,                                                        // Optional, show lrc, can be 0, 1, 2, see: ###With lrc
    mutex: true,                                                       // Optional, pause other players when this player playing
    theme: '#b7daff',                                                  // Optional, theme color, default: #b7daff
    mode: 'random',                                                    // Optional, play mode, can be `random` `single` `circulation`(loop) `order`(no loop), default: `circulation`
    preload: 'metadata',                                               // Optional, the way to load music, can be 'none' 'metadata' 'auto', default: 'auto'
    listmaxheight: '513px',                                             // Optional, max height of play list
    music: [  
    
	    {
	    	title: '陽だまりにて和む猫',
	    	author: 'Falcom Sound Team J.D.K.',
	    	url: 'https://s3-eu-west-1.amazonaws.com/typewind-first-bucket/Falcom+Sound+Team+jdk+-+%E9%98%B3%E3%81%9F%E3%82%99%E3%81%BE%E3%82%8A%E3%81%AB%E3%81%A6%E5%92%8C%E3%82%80%E7%8C%AB.mp3',
	    	pic: 'https://i.imgur.com/GRLlItn.png'
	    },
	     {
	    	title: '鳥の詩',
	    	author: 'Lia',
	    	url: 'https://s3-eu-west-1.amazonaws.com/typewind-first-bucket/Lia+-+%E9%B8%9F%E3%81%AE%E8%AF%97.mp3',
	    	pic: 'https://i.imgur.com/GRLlItn.png'
	    },
	    {
	    	title: 'China (The Atomic Era)',
	    	author: 'Geoff Knorr',
	    	url: 'https://s3-eu-west-1.amazonaws.com/typewind-first-bucket/Geoff+Knorr%2CPhill+Boucher+-+China+(The+Atomic+Era).mp3',
	    	pic: 'https://i.imgur.com/GRLlItn.png'
	    },

	    	    {
	    	title: '暁の車',
	    	author: 'FictionJunction YUUKA',
	    	url: 'https://s3-eu-west-1.amazonaws.com/typewind-first-bucket/FictionJunction+-+%E6%9A%81%E3%81%AE%E8%BB%8A.mp3',
	    	pic: 'https://i.imgur.com/GRLlItn.png'
	    },

	        	    {
	    	title: 'Hanezeve Caradhina',
	    	author: 'Kevin Penkin',
	    	url: 'https://s3-eu-west-1.amazonaws.com/typewind-first-bucket/Kevin+Penkin+-+Hanezeve+Caradhina+(ft.Takeshi+Saito).mp3',
	    	pic: 'https://i.imgur.com/GRLlItn.png'
	    },
	        	    {
	    	title: '星屑',
	    	author: '梶浦由記',
	    	url: 'https://s3-eu-west-1.amazonaws.com/typewind-first-bucket/FictionJunction+-+%E6%98%9F%E5%B1%91.mp3',
	    	pic: 'https://i.imgur.com/GRLlItn.png'
	    },
	        	   
	        	    {
	    	title: 'Radical Dreamers',
	    	author: '光田康典',
	    	url: 'https://s3-eu-west-1.amazonaws.com/typewind-first-bucket/%E5%85%89%E7%94%B0%E5%BA%B7%E5%85%B8+-+Yasunori+Mitsuda+-+Radical+Dreamers+(from+Chrono+Cross).mp3',
	    	pic: 'https://i.imgur.com/GRLlItn.png'
	    },
	     {
	    	title: 'エミヤ ~無元の剣製~',
	    	author: 'James Harris',
	    	url: 'https://s3-eu-west-1.amazonaws.com/typewind-first-bucket/James+Harris+-+%E3%82%A8%E3%83%9F%E3%83%A4+~%E7%84%A1%E5%85%83%E3%81%AE%E5%89%A3%E8%A3%BD~.mp3',
	    	pic: 'https://i.imgur.com/GRLlItn.png'
	    },
	    {
	    	title: 'The Fear in my Heart',
	    	author: '朴树',
	    	url: 'https://s3-eu-west-1.amazonaws.com/typewind-first-bucket/%E6%9C%B4%E6%A0%91+-+The+fear+in+my+heart.mp3',
	    	pic: 'https://i.imgur.com/GRLlItn.png'
	    },








        ]
});
</script>
