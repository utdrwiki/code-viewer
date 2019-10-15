<!doctype html>
<head>
<title>deltarune decompiled script thingy</title>
<!--
oh, hey.

... you're looking for secrets in a place designed to
help people look for secrets?

ok, i guess. i don't really get why, but, cool!
i bet nobody will see this message.

though if you're reading this, that means
there's one person:
							 you.

thanks for stopping by. <3

-->
<style>
body { background: #111; padding: 1em 2em; }
body, pre { font-family: Consolas, Ubuntu Mono, monospace; font-size: 12pt; color: #ccc; margin: 0; }
#yrstruly { position: relative; right: -1em; float: right; background: #080808; padding: 1em 2em; border: 1px solid #666; }
a { text-decoration: none; }
a { color: #8ad; }
a:hover { color: #adf; }
a.label { color: #afa; font-weight: bold; }
a.label:hover { color: #fff; }
a.junk { color: #666; font-style: italic; }

.langvar {
	color: #c7d;
	font-style: italic;
	display: none;
	position: absolute;
	left: 2px;
	top: -2em;
	background: black;
	padding: 0.2em 0.5em;
	border: 1px solid #836;
	}
.langtext { display: inline-block; color: #fbe; padding: 0.0em 0.25em; background: black; position: relative; margin-bottom: 0.2em; border: 1px dotted #969; }
.langtext > span { display: inline-block; vertical-align: top; }
.langtext:hover .langvar { display: block;}


.cc {
	font-size:	100%;
	width:		0.8em;
	text-indent:	-9999px;
	display:	inline-block;
/*	overflow:	hidden;
*/	padding:	0 0.2em;
	margin:		0 0.2em;
	position:	relative;
	}

.cc:hover {
	width:		unset;
	text-indent:	unset;
	display:	inline-block;
	overflow:	initial;
}
.cc-wait {
	background: #555;
	color:		#fff;
}
.cc-delay {
	background: #111;
	color:		#777;
}
.cc-close {
	background: #844;
	color:		#fff;
}

.cc-face {
	background: #252;
	font-style:	italic;
	font-size:	80%;
	color:		#8c8;
	padding:	0 0.2em;
}

.cc-delay:before {
	content: '\231b';
}
.cc-wait:before {
	content: '\2398';
}
.cc-close:before {
	content: '\239a';
}

.cc-color { color: white; }
.cc-color:hover { color: black; }

.cc-Y {	color: yellow;	}
.cc-R {	color: red;	}
.cc-B {	color: #8bf;	}
.cc-W {	color: unset;	}
.cc-G {	color: #7f7;	}

.langtext > span span:before {
	text-indent: 0;
	right: 0.3em;
	position: absolute;
	overflow: show;
}
.langtext > span span:hover:before {
	display: none;
}


.langtexterr { color: #f00; }
.indent { display: inline-block; background: #181818; height: .5em; vertical-align: middle; margin: 0 4px 0 0; }
.indent:hover { background: #666; }
.indent-hyper { display: inline-block; background: #322; height: 1em; vertical-align: middle; margin: 0 4px 0 0; }
.indent-hyper:hover { background: #966; }

.flag { color: #ec6; }
.flagn { color: #fd8; background: black; }
.flagd { color: #ca4; font-style: italic; }

.tempvar { background: black; }
.with { position: relative; border: 1px dotted black; z-index: 1; }
.with .with { margin: 0 1em; }
.with .with div { position: relative; left: -1em; }
.with:hover { /*border: 1px dotted white !important;*/ background: rgba(255, 255, 255, .05) !important; }

.withkey { background: black; font-style: italic; }

.kbd { color: #dd4; }
.kbd span { color: #ff0; background: black; }


.room { color: #8f8; background: #000; padding: 0 .5em; }
.roomdesc { color: #494; font-style: italic; }

.alarm {
	color:	#faa;
	text-decoration: underline dotted #a66;
	position:	relative;
}
.alarm:hover { color: white; }
.alarmT {
	font-weight:	normal;
	font-style:	normal;
	position:	relative;
	float:	right;
	/*width:	300px;*/
	max-width:	500px;
	/*overflow-x:	auto;*/
	margin:	0 1em 1em 1em;
	padding:	0.5em 1em;
	border:		1px solid #888;
	box-shadow:	6px 6px 0px 2px black;
	background:	#222;
	color:		#ccc;
	z-index:	10000;
	top:		-1.8em;
	box-sizing: border-box;
	overflow-x:	auto;
}
.alarmU {
	position:	relative;
	display:	block;
	float:		left;
	margin-right:	.4em;
}
.alarmA {
	display:	block;
	position:	relative;
	top:		0.5em;
	margin:		0 100px 0 0;
	height:		2px;
	border-top: 1px dashed #444;
	z-index:	10;
	overflow:	hidden;
}

.alarmC:hover, .alarmC:hover .alarmU, .alarmC:hover .alarmA, .alarmC:hover .alarmT {
	background: #400; border-color: #f88;
}
.c { clear: left; }
input { background: #000; padding: 0.1em 0.5em; font-family: monospace; color: white; border: 1px solid #c9f; font-size: inherit; }

.funcC { position: relative; }
.func { color: #8f8; text-decoration: underline dotted #292; }
.funcC .funcCode { display: none; }
.funcC:hover .func { background: #272; color: white;}
.funcC:hover .funcCode {
	display:	block;
	position:	absolute;
	max-width:	1000px;
	/*overflow-x:	auto;*/
	margin:	0 1em 1em 1em;
	padding:	0.5em 1em;
	border:		1px solid #8f8;
	box-shadow:	6px 6px 0px 2px black;
	background:	rgba(30, 50, 30, .9);
	color:		#ccc;
	z-index:	1000000;
	top:		1em;
	left:		2em;
	box-sizing: border-box;
	overflow-x:	auto;
}
.debug { color: #fff; background: #f00; font-weight: bold; padding: 0 0.5em; }

.sr { color: #8f8; background: #000; font-weight: bold; }

hr { border-color: #666; }
</style>
</head>
<body>
<div id="yrstruly"><pre><em>this is the <strong>deltarune script viewer</strong></em>
made (sort of) for <a href="https://www.reddit.com/r/Underminers/">r/underminers</a>
by <a href="https://twitter.com/xkeepah">xkeeper</a> (<a href="https://www.reddit.com/u/xkeeper/">reddit</a>)
feedback: <a href="https://www.reddit.com/r/Underminers/comments/9x2x1l/online_deltarune_decompile_viewer_version_2_for/">this reddit thread</a>

updated <?php echo date("y-m-d H:i:s", filemtime(__FILE__)); ?>

other places: <a href="https://tcrf.net/Deltarune">tcrf.net/Deltarune</a>

updates:
- better search
- inline function views/links
- slightly less broken! nice
- auto alarm links/display
- with(...){...} collapsing
</pre></div>
<h1>decompiled deltarune script viewer</h1>
<strong><a href="?">&larr; back to main script listing</a></strong> &bull; also: <a href="data/enemy.txt">enemy ids</a> &middot; <a href="data/rooms.txt">room list</a> &middot; <a href="data/flags.txt">unofficial flag names</a></small>
<pre><?php

	error_reporting(E_ALL);

	$secondLevelR	= 0;

	if (v($argv[1])) {
		$_GET['f']	= $argv[1];
	}

	if (isset($_GET['s'])) {
		print "<h2>search results</h2><form action='' method='get'>search: <input type='text' name='s' value=\"". htmlentities($_GET['s']) ."\" size='20'> <input type='submit' value='go'></form>\n\nsearching for: <strong>". htmlentities($_GET['s']) ."</strong>\n\n";
		if (strlen($_GET['s']) < 3) {
			print "you should probably search for something longer than 2 letters";
		} else {
			$fname	= escapeshellarg($_GET['s']);
			$r	= shell_exec($c = "grep -Fi ". $fname ." decompiled/*.gml");
			$x	= explode("\n", $r);
			if (($z = count($x)) > 1000) {
				die("way too many results ($z)");
			}

			$oldFile	= "";
			foreach ($x as $ff) {
				if (!trim($ff)) continue;
				$result	= explode(":", $ff, 2);
				$file	= $result[0];
				$text	= trim($result[1]);

				$flink	= str_replace("decompiled/", "", $file);
				if ($oldFile != $flink) {
					printf("\n<em><a href='?f=%s'>%s</a></em>\n", $flink, $flink);
				}
				print "    ". str_replace($_GET['s'], "<strong class='sr'>". $_GET['s'] ."</strong>", $text) ."\n";
				$oldFile	= $flink;
			}

			print "\nresults found: ". (count($x) - 1);
		}

	} elseif (!isset($_GET['f'])) {


		print "<h2>script listing</h2><form action='' method='get'>search: <input type='text' name='s' size='20'> <input type='submit' value='go'></form>";
		$a = scandir("./decompiled/");
		$lastseg	= "";
		$junkfiles	= "";

		$sums		= getSums();
		$junksums	= getJunkSums();

		foreach ($a as $file) {
			if (substr($file, -4) === ".gml") {
				$size	= filesize("decompiled/". $file);
				$class	= "";
				if (isset($junksums[$sums[$file]])) {
					$class	= " class='junk'";
					$jsum	= $sums[$file];
				}

				$temp	= sprintf("<a href='?f=%s'%s>%-60s</a>  %10d\n", $file, $class, $file, $size);

				if ($class === "") {
					$segs	= explode("_", $file);
					array_pop($segs);
					array_pop($segs);
					$seg	= implode("_", $segs);
					if ($segs[1] === "Object" && $seg !== $lastseg) {
						print "\n";
						$lastseg	= $seg;
					}
					print $temp;
				} else {
					$junksums[$jsum][1][]	= $temp;
				}
			}
		}

		print "\n========================================================================\nduplicated or common scripts\n";

		foreach ($junksums as $junko) {
			print "\n------------------------------------------------------------------------\n$junko[0]\n";;
			print implode("", $junko[1]);
		}

	} else {


		$f	= $_GET['f'];
		if (stripos($f, "/") !== false) {
			echo "No.";

		} elseif (!file_exists("decompiled/". $f)) {
			echo "File not found (or other unexpected error, what are you doing???)";

		} else {


			$file		= mangleFile($f);


			print "<h2>$f</h2><small>(<a href='decompiled/$f'>view raw script w/o annotations or w/e</a>)</small><hr>";
			//print "option: <a href='?f=". $_GET['f'] ."&amp;x=1'>disable with(...){...} collapsing</a>\n-----------------------------------------\n\n";

			print $file;
		}

	}



	function mangleFile($filename, $secondLevel = 0, $sizeLimit = null) {
		static $mangled	= array();
		global $secondLevelR, $baseFile, $fullFile;

		$oldBaseFile	= $baseFile;
		$oldFullFile	= $fullFile;

		$segs			= explode("_", $filename);
		array_pop($segs);
		array_pop($segs);
		$baseFile		= implode("_", $segs);
		$fullFile		= $filename;

		$oldSL			= $secondLevelR;
		$secondLevelR	= $secondLevel;

		if (isset($mangled[$filename])) {
			$secondLevelR	= $oldSL;
			$baseFile		= $oldBaseFile;
			$fullFile		= $oldFullFile;
			//print "$secondLevelR - $secondLevel Q $oldSL\n";
			return $mangled[$filename];
		}
		//print "$secondLevelR - $secondLevel M $oldSL\n";


		$filename2	= "decompiled/". $filename;
		if (!file_exists($filename2)) {
			return "something went wrong here.\n$filename";
			//die("SOMETHING HAS GONE HORRIBLY WRONG!!!\nOH NO!!!\n$filename2\n");
		}
		$file	= file_get_contents($filename2);

		if ($sizeLimit && strlen($file) > $sizeLimit) {
			$file	= "too big to show inline, sorry\n\n<a href='?f=$filename'>view full file</a>";
			$mangled[$filename]	= $file;

			return $file;
		}

		$file	= str_replace("\r\n", "\n", $file);
		$file	= preg_replace('/^\s+$/m', '', $file);

		$file	= preg_replace_callback('/(scr_84_get_lang_string\(")([a-zA-Z0-9_-]+)("[@0-9A-F]+\))/mi', "textvar_to_text", $file);
		$file	= preg_replace_callback('/(global\.flag\[)([0-9]+)(\])/mi', 'flagcolor', $file);
		$file	= preg_replace_callback('/(keyboard_check(?:_pressed)?\()([0-9]+)(\))/im', 'keyboard', $file);
		$file	= preg_replace_callback('/(keyboard_check(?:_pressed)?\()(\'.\'|[0-9]+|vk_[^)]+)(\))/im', 'keyboard', $file);
		$file	= preg_replace_callback('/_temp_local_var_([0-9]+)/im', 'tempvar', $file);
		//$file	= preg_replace('/scr_debug/i', '<span class="debug">scr_debug</span>', $file);
		$file	= preg_replace_callback('/(self\.room\s*[!=]+\s*|room_goto\()([A-Za-z0-9_]+)/mi', 'roomlist', $file);
		$file	= preg_replace_callback('/(global\.monstertype\b.*[!=]+\s*)([0-9]+)/mi', 'enemylist', $file);

		#if (!$secondLevel) {
			$file	= preg_replace_callback('/(\b)(scr_[a-zA-Z0-9_]+)\(/mi', 'functionlink', $file);
		#}

		//$file	= preg_replace_callback('/^[ \t]+/m', "unindent", $file);
		if (!v($_GET['x'])) {
			$file	= withhandler($file);
		}

		#if (!$secondLevel) {
			$file	= preg_replace_callback('/(<div>|^)( *.+)(\.alarm\[([0-9]+)\])( = .*$)/m', 'alarmer', $file);
		#}

		$mangled[$filename]	= $file;


		$secondLevelR	= $oldSL;
		$baseFile		= $oldBaseFile;
		$fullFile		= $oldFullFile;

		return $file;
	}


	function functionlink($matches) {
		global $secondLevelR;
		$filename	= "gml_Script_". $matches[2] .".gml";
		$sc			= ($matches[2] == "scr_debug") ? " debug" : "";

		if ($secondLevelR) {
			return "$matches[1]<span class='funcC'><a class='func$sc' href='?f=$filename'>$matches[2]</a></span>(";

		} else {
			return "$matches[1]<span class='funcC'><a class='func$sc' href='?f=$filename'>$matches[2]</a><div class='funcCode'><strong><a href='?f=$filename'>$matches[2]</a></strong>\n\n". mangleFile($filename, true, 3000) ."</div></span>(";

		}
	}


	function alarmer($matches) {
		global $fullFile, $baseFile, $secondLevelR;
		static $hackCount;

		$line	= trim(strip_tags($matches[0]));

		if (strpos($line, "if (")) {
			// abort if this is an if condition or other wonky thing
			return $matches[0];
		}

		$objT	= explode("=", $line);
		$obj	= explode(".", $objT[0]);
		$objN	= $obj[0];

		if (count($obj) === 2 && $objN === "self") {
			$objN	= $baseFile;
		} elseif (count($obj) == 2) {
			$objN	= "gml_Object_". $objN;
		} else {
			$out	= "<div class='alarmT'><strong>(unknown reference)</strong>\n\nyou're on your own, sorry.\ncheck for 'instance_create' nearby.</div>";
			return $matches[1] . "<span class='alarmC'><span class='alarmU'>" . $matches[2] ."<span class='alarm'>". $matches[3] ."</span>". $matches[5] ."</span><span class='alarmA'></span>". $out ."</span><span class='c'></span>";
		}

		$objF	= "{$objN}_Alarm_$matches[4].gml";

		if ($objF == $fullFile) {
			$out	= "err, wait, that's THIS file.\n\nrecursion sure is neat, huh?";

		} elseif ($secondLevelR) {
			$out	= "You probably shouldn't ever see this!\n\nIf you are seeing it that's weird";

		} else {
			$out	= "". mangleFile($objF, true, 3000) ."";
		}

		$out	= "<div class='alarmT'><strong><a href='?f=$objF'>". str_replace("gml_Object_", "", $objF) ."</a></strong>\n\n". $out ."</div>";

		$override	= false;
		if ($objF == $fullFile && $hackCount > 1) {
			// special hack for this horrible file full of alarms
			$override	= true;
		}


		if (!$secondLevelR) $hackCount++;

		if ($secondLevelR || $override) {
			return $matches[1] . "" . $matches[2] ."<a class='alarm' href='?f=$objF' title='$objF'>". $matches[3] ."</a>". $matches[5] ."";

		} else {
			return $matches[1] . "<span class='alarmC'><span class='alarmU'>" . $matches[2] ."<a href='?f=$objF' title='$objF' class='alarm'>". $matches[3] ."</a>". $matches[5] ."</span><span class='alarmA'></span>". $out ."</span><span class='c'></span>";
		}

	}



	function withhandler($matches) {

		if (is_array($matches)) {
			$text		= $matches[5];
			$replace	= $matches[3];
		} else {
			$text		= $matches;
			$replace	= false;
		}

		$newtext		= preg_replace_callback('/^( *)(with\()([^\)]+)(\)\s+{)(.*?)(^\1})/mis', 'withhandler', $text);

		if ($replace !== false) {
			$colorv		= mt_rand(0, 359);
			$colorv		= abs(crc32($replace)) % 360;
			$color		= "<span class='withkey' style='color: hsl(". $colorv .", 70%, 70%)'>";
			$color2		= "style='background: hsl(". $colorv .", 50%, 5%); border-color: hsl(". $colorv .", 20%, 20%)'";

			$newtext	= preg_replace('/^    /m', '', $newtext);
			$newtext	= preg_replace('/([^][])self\./', '$1'. $color . $replace .'</span>.', $newtext);
			$newtext	= preg_replace('/^(\s+)([A-Za-z0-9_]+)(\(.*?\))$/m', '$1'. $color . $replace .'</span>.$2$3', $newtext);

			//$newtext	= "<div class='with' $color2 title='with(". encode2($replace) .") { ... }'>". trim($newtext, "\n") ."</div>";
			$newtext	= "<div class='with' $color2 title='with(". encode2($replace) .") { ... }'><div>". $newtext ."</div></div>";
		} else {
			$newtext	= preg_replace("/<div>\n+/", '<div>', $newtext);
		}

		return $newtext;

	}


	function encode2($str) {
		//$str = mb_convert_encoding($str , 'UTF-32', 'UTF-8');
		$t = unpack("C*", $str);
		$t = array_map(function($n) { return "&#$n;"; }, $t);
		return implode("", $t);
	}


	function keyboard($matches) {
		if (is_numeric($matches[2])) {
			$k	= intval($matches[2]);
			$kc	= chr($k);
			if ($k < 32) { $kc = "(unk)"; }
			return $matches[1] .$matches[2] ." <span class='kbd'>\"$kc\"</span>". $matches[3];

		} else {
			return "<span class='kbd'>$matches[1]<span>$matches[2]</span>$matches[3]</span>";

		}
	}

	function tempvar($matches) {
		$t	= intval($matches[1]);
		return "<span class='tempvar' style='color: hsl(". (($t * 80) % 360) .", 80%, 80%);'>temp_$t</span>";
	}


	function unindent($matches) {
		$max	= 40;

		$m	= strlen($matches[0]);
		$ct	= $m / 4;
		$c	= $ct * 32;
		if ($ct > $max) {
			$c	= $max * 32;
			$h	= ($ct - $max) * 2;
			return "<span class='indent' style='width: {$c}px;' title='$ct levels'></span><span class='indent-hyper' style='width: {$h}px;' title='oof'></span>";
		}

		return "<span class='indent' style='width: {$c}px;' title='$ct levels'></span>";
	}


	function flagcolor($matches) {
		global $flags;
		$flagt	= $matches[2];
		$flag	= D_Flags::getId($matches[2]);
		if ($flag) {
			$flagt	= "<span class='flagn'>$matches[2] <span class='flagd'>". $flag ."</span></span>";
		}
		return "<span class='flag'>$matches[1]$flagt$matches[3]</span>";
	}

	function roomlist($matches) {

		$roomtext	= $matches[2];
		$roomalt	= null;
		$roomdesc	= null;

		if (is_numeric($matches)) {
			$room		= D_Rooms::getId($matches[2]);
			if ($room) {
				$roomtext	= $matches[2];
				$roomalt	= $room['name'];
				$roomdesc	= $room['desc'];
			}
		} else {
			$room		= D_Rooms::getName($matches[2]);
			if ($room) {
				$roomtext	= $matches[2];
				$roomalt	= $room['id'];
				$roomdesc	= $room['desc'];
			}
		}

		if ($roomalt === null) {
			return $matches[0];
		}

		return $matches[1] ."<span class='room'>$roomalt $roomtext <span class='roomdesc'>$roomdesc</span></span>";
	}


	function enemylist($matches) {
		$enemyname	= D_Enemies::getId(intval($matches[2]));
		return $matches[1] . $matches[2] ." <span class='room'>$enemyname</span>";
	}



	function textvar_to_text($matches) {
		//global $lang;
		//var_dump($lang);
		//var_dump($matches);
		//die();
		$text	= D_Lang::getText($matches[2]);
		if ($text) {
			//return $matches[1] .
			//	"<span class='langvar'>$matches[2]</span>$matches[3] ".
			//	"<span class='langtext'>". $lang[$matches[2]] ."</span>";
			return //$matches[1] .
				"<div class='langtext'><span>". D_Lang::parseText($text) . "</span>".
				"<div class='langvar'>". $matches[1] . $matches[2] . $matches[3] ."</div>" .
				"</div>" .
				""; //$matches[3];
		} else {
			return $matches[1] .
					"<span class='langvar'>$matches[2]<span>$matches[3]".
					"<span class='langtexterror'>(MISSING)</span>";
		}
	}


	class D_Lang {
		protected static $lang = null;

		protected static function init() {
			$lang	= json_decode(file_get_contents("data/lang_en.json"), true);
			self::$lang	= $lang;
		}

		public static function getText($key) {
			if (self::$lang === null) self::init();
			return v(self::$lang[$key]);
		}

		public static function parseText($text) {
			$text	= preg_replace('#/#i', '<span class="cc cc-wait">Wait for input</span>', $text);
			$text	= preg_replace('#\^([1-9])(.)#i', '\2<span class="cc cc-delay">Delay \1</span>', $text);
			$text	= preg_replace('#&#i', '<br>', $text);
			$text	= preg_replace('#%#i', '<span class="cc cc-close">Close Message</span>', $text);
			$text	= preg_replace('#\\\\E(.)#', '<span class="cc-face">Face \1</span>', $text);
			#$text	= preg_replace('#\\\\c(.)#', '(color: \1)', $text);
			$text	= preg_replace('#\\\\c(.)(.*?)(?=\\\\c|$)#', '<span class="cc-color cc-\1">\2</span>', $text);
			return $text;
		}

	}

	class D_Rooms {
		protected static $rooms = null;

		protected static function init() {
			$roomA	= explode("\n", file_get_contents("data/rooms.txt"));
			$rooms	= array('id' => array(), 'name' => array());
			foreach ($roomA as $room) {
				$roomT	= explode("\t", $room);
				$rooms['id'][$roomT[0]] = array('name' => $roomT[1], 'desc' => $roomT[2]);
				$rooms['name'][$roomT[1]]	= array('id' => $roomT[0], 'desc' => $roomT[2]);
			}
			self::$rooms	= $rooms;
		}

		public static function getName($name) {
			if (self::$rooms === null) self::init();
			return v(self::$rooms['name'][$name]);
		}

		public static function getId($id) {
			if (self::$rooms === null) self::init();
			return v(self::$rooms['id'][$id]);
		}
	}

	class D_Enemies {
		protected static $enemies = null;

		protected static function init() {
			$enemiesA	= explode("\n", file_get_contents("data/enemy.txt"));
			$enemies	= array();
			foreach ($enemiesA as $enemy) {
				$enemy	= explode("\t", $enemy);
				$enemies[$enemy[0]]	= $enemy[1];
			}
			self::$enemies	= $enemies;

		}

		public static function getId($id) {
			if (self::$enemies === null) self::init();
			return v(self::$enemies[$id], "(UNKNOWN ENEMY $id)");
		}
	}


	class D_Flags {
		protected static $flags = null;

		protected static function init() {
			$flagsA		= explode("\n", file_get_contents("data/flags.txt"));
			$flags		= array();
			foreach ($flagsA as $flag) {
				if (!trim($flag)) continue;
				$flagZ	= explode("\t", $flag);
				$flags[$flagZ[0]]	= $flagZ[1];
			}
			self::$flags	= $flags;

		}

		public static function getId($id) {
			if (self::$flags === null) self::init();
			return v(self::$flags[$id]);
		}
	}


	function getSums() {
		// get file list
		$sumA		= explode("\n", file_get_contents("data/sums.txt"));
		$sums		= array();
		foreach ($sumA as $sum) {
			$sumx	= explode("  ", $sum);
			$sums[$sumx[1]]	= $sumx[0];
		}

		return $sums;
	}

	function getJunkSums() {

		$junksums	= array(
'01f59b2c92905b4a93005292d1d6226e5bf008f78e892df71d0f76d5649907f3' => array('doors, fade-out', array()),
'ab2d29f8421cfa1f586d54fb07f47866c612b039fc1acd1d6aa6db28e6963a33' => array('doors, music fade', array()),
'af3208f9a243fdaf84af4a33df239237b678a0cebbbf4e971eb1d349291e9182' => array('doors, frees current song', array()),
'934e7cbed2a10a0a83a7b30a1f2795a8b9a6058cf82b89a7d5f537d712dc62e5' => array('doors, interactable?', array()),
'd755696a11b77ac971ca72025b2337611f68886448241260ff9e26e59157214c' => array('door: go +1 room, ent 1', array()),
'40a65190d977f13bba6b0dc220bbb629f11bf1c573ed18cab90d074af74078c0' => array('door: go +3 rooms, ent 4', array()),
'd49881a8ea574d2523f9fd976210168a5a4016bc061df041d2395d8e7aea8cb5' => array('door: go -2 rooms, ent 5', array()),
'0b659f93e3b839f3f9698cbb9cb003e276e7175a9f42fef53b929da3fa4fbeee' => array('fade-ins 1', array()),
'6c0cf3710a4ec1b3bd28541111226c63075115f5bb0a6f8686337b5bc5d504f3' => array('fade-ins 2', array()),
'133db2c19331736a00c1bd048e393ebc4c79098546a56142ba6b09303bae76ab' => array('interact == 0 then image index/speed = 0', array()),
'1c46a4174c9b44f1b007ff994f2c3c07b26999415bd61989771897e24ac35466' => array('free all sounds', array()),
'86f8d2a2d49a3a7dc59dead12eab5691156e2c6b533f6eeb961d7d0e326ec935' => array('enable choice-making', array()),
'9fd0b0723ef1c36e5f2a75449bddbc613aff37c1421c0bd297a819c63121c54a' => array('call event_user(0)', array()),
'f2667d8fc0f045fd4e848ddf99ffd5cf793b47173260218a0dc866ba2da995f3' => array('DEVICE draw stuff', array()),
'f539a166f911d309f14985fc9abf4ddd8c8e8c667e6332638e5ad3b503e650c1' => array('spawns smth w/ slightly random offset', array()),
'f71dc7a6d29d4be285295998df5e2c5ada6928da23eff421d6fb858e8213faca' => array('DEVICE event advance', array()),
'f8999039cbb56ece49825ecb4c43318114c7a420ed9bb45d0ccf50f4cc17088d' => array('some battle drawer thing', array()),
'fa778d0c18b7d1195caff5591a4dc665a4775032a02faa71117e2a620ccc0f47' => array('shop things', array()),
'6367709d3bdf8492c2d36deefff202a809518c1384ff6b64934c9b367ea7d781' => array('interactable solids', array()),
'c7a94b2176e4b10549384fe696e4b87a28fefece2876ec907469399813ea77d8' => array('call scr_depth()', array()),
'59dcec304deeec35fce9c040532f4ff706cfefb561d596ba8d74ad8dbb928b53' => array('call event_user(7)', array()),
'8f43ace6ca37d249967ad74c3456f918bdccc71902b0124ecf2bae80bfac3524' => array('? something w/ enemies, rooms 51/52, flag 50/500/501', array()),
'279561762a9eb97742fa8407f9c0c74ae9979fa659d7d4370beb01ad7574ffd3' => array('calls draw_self()', array()),
'8c7d578ba9271d04587c5ea7dad14cf9d267c927018b3b0bea64c2355658fa0c' => array('calls instance_destroy()', array()),
'66f3a1538435e035ccef6e5dd491c002f905c210230499acf810f5f68c570040' => array('increments self.actcon', array()),

'6949b0505b082f250041fa0dfb8805b054c2468fe7d7785e5c4c1bc212abc8ba' => array('monster sprite shrink', array()),
'1df51eb5a4e586655c318075f401ff659ed410398edbdca932119ccb74538405' => array('self.touched = 0', array()),
'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855' => array('(empty)', array()),
'8de5edc189874547448d83439e90830430829e054768e4594b37db2fe9e07064' => array('self.con = (self.con + 1)', array()),
'9f05d2cd4fe053804bf99aa9662b1101535bc0ae7f9fade5c7583bedfd01a179' => array('event_inherited()', array()),
		);

		return $junksums;

	}



	function v(&$var, $d = null) {
		return isset($var) ? $var : $d;
	}



?></pre>
</body>
</html>
