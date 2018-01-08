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
	    	url: 'http://fs.open.kugou.com/1b81c1159fee2375f9a4ef9995a137e0/5a4ffba9/G028/M02/04/19/XA0DAFV55U-ARPXiADQyIdXOzqI823.mp3',
	    	pic: 'https://i.imgur.com/GRLlItn.png'
	    },
	    {
	    	title: '真空のダイアモンドクレバス',
	    	author: '菅野よう子',
	    	url: 'http://fs.open.kugou.com/8e66e40063ad06827867e9f6569ae469/5a4ffbca/G048/M03/1E/1D/cA0DAFYpFrmAQoJ5AEoVdblbMto675.mp3',
	    	pic: 'https://i.imgur.com/GRLlItn.png'
	    },

	    	    {
	    	title: '暁の車',
	    	author: 'FictionJunction YUUKA',
	    	url: 'http://fs.open.kugou.com/39c09fc09415583df82eba6d6621bcf4/5a4ffbda/G007/M03/19/14/Rw0DAFS1xOaAEoKLAEoiIeEh8A0850.mp3',
	    	pic: 'https://i.imgur.com/GRLlItn.png'
	    },

	        	    {
	    	title: 'Hanezeve Caradhina',
	    	author: 'Kevin Penkin',
	    	url: 'http://fs.open.kugou.com/b3e7aa8e48bd165b07544ab1d955ee92/5a4ffc11/G109/M00/1C/05/DYcBAFnNgzCAH12VADEmXbRYgLE715.mp3',
	    	pic: 'https://i.imgur.com/GRLlItn.png'
	    },
	        	    {
	    	title: '星屑',
	    	author: '梶浦由記',
	    	url: 'http://fs.open.kugou.com/00f9c46793c391d22e1ace45ffa6c735/5a4ffc23/G007/M05/13/18/Rw0DAFS3UuuAGcxuAGOXnRc0wx0608.mp3',
	    	pic: 'https://i.imgur.com/GRLlItn.png'
	    },
	        	   
	        	    {
	    	title: 'いのちの祭',
	    	author: '吉田潔',
	    	url: 'http://other.web.rb01.sycdn.kuwo.cn/resource/n1/14/72/3337250331.mp3',
	    	pic: 'https://i.imgur.com/GRLlItn.png'
	    },
	        	    {
	    	title: 'The fear in my heart',
	    	author: '朴树',
	    	url: 'http://other.web.ri01.sycdn.kuwo.cn/resource/n3/19/45/2840627416.mp3',
	    	pic: 'https://i.imgur.com/GRLlItn.png'
	    },
	     {
	    	title: '散花',
	    	author: 'Key Sounds Label',
	    	url: 'http://other.web.rt01.sycdn.kuwo.cn/resource/n2/81/68/2654245240.mp3',
	    	pic: 'https://i.imgur.com/GRLlItn.png'
	    },

	    {
	    	title: 'エミヤ (卫宫) (UBW Extended)',
	    	author: '深澤秀行',
	    	url: 'http://other.web.rm01.sycdn.kuwo.cn/resource/n2/65/96/1052645143.mp3',
	    	pic: 'https://i.imgur.com/GRLlItn.png'
	    },





        ]
});
</script>
