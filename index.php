<!doctype html>
<head>
        <title>deltarune script viewer</title>
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
        <link rel="stylesheet" href="style.css" />
</head>
<body>
<div id="yrstruly">
	<em>this is the <strong><del>deltarune</del> <del>undertalemodtool</del> deltarune script viewer</strong></em>
	<br>by <a href="https://twitter.com/xkeepah">xkeeper</a>
	<br>ported for personal use on Windows by Grossley
	<br>made into a yet nonfunctional static website by Jacky720 and KockaAdmiralac.
	<br>source on <a href="https://github.com/KockaAdmiralac/deltarune-viewer">github</a>
	<br>links: <a href="https://www.reddit.com/r/Underminers/">r/underminers</a>, <a href="https://tcrf.net/Deltarune">tcrf</a>
</div>

<h1>decompiled <del>deltarune</del> <del>undertalemodtool</del> deltarune script viewer</h1>
<strong>
	<a href="/">&larr; back to main script listing</a></strong>
	<br>(etc: <a href="data/enemy.txt">enemy ids (deltarune)</a> - <a href="data/rooms.txt">room list (deltarune)</a> - <a href="data/flags.txt">flag names (deltarune)</a>)
<?php

	error_reporting(E_ALL);

	$secondLevelR	= 0;

	if (v($argv[1])) {
		$_GET['f']	= $argv[1];
	}

	if (!isset($_GET['f'])) {


		print "<h2>script listing</h2><form action='' method='get'>search (does not work): <input type='text' name='s' size='20'> <input type='submit' value='go'></form><br>";
		$a = scandir("./decompiled/");
		$lastseg	= "";
/* 		$junkfiles	= "";
 
 		$sums		= getSums();
		$junksums	= getJunkSums();
 */
		foreach ($a as $file) {
			if (substr($file, -4) === ".gml") {
				$size	= filesize("decompiled/". $file);
				$class	= "";
/* 				if (isset($junksums[$sums[$file]])) {
					$class	= " class='junk'";
					$jsum	= $sums[$file];
				}
 */
				$replaced = str_replace(".gml", ".html", $file);
				$temp	= sprintf("<pre><a href='/%s'%s>%-60s</a>  %10d</pre>", $replaced, $class, $file, $size);

 				if ($class === "") {
					$segs	= explode("_", $file);
					array_pop($segs);
					array_pop($segs);
					$seg	= implode("_", $segs);
//					if ($segs[1] === "Object" && $seg !== $lastseg) {
					if ($seg !== $lastseg) {
						print "<br>";
						$lastseg	= $seg;
					}
					print $temp;
				} 
/*
				else {
					$junksums[$jsum][1][]	= $temp;
				}
 */			}
		}
/*
		print "\n========================================================================\nduplicated or common scripts\n";

 		foreach ($junksums as $junko) {
			print "\n------------------------------------------------------------------------\n$junko[0]\n";;
			print implode("", $junko[1]);
		}
 */
	} else {


		$f	= $_GET['f'];
		if (stripos($f, "/") !== false) {
			echo "No.";

		} elseif (!file_exists("decompiled/". $f)) {
			echo "File not found (or other unexpected error, what are you doing???)";

		} else {


			$file		= mangleFile($f);


			print "<h2>$f</h2><small>(<a href='decompiled/$f'>view raw script w/o annotations or w/e</a>)</small><hr>";
			//print "option: <a href='/". $_GET['f'] ."&amp;x=1'>disable with(...){...} collapsing</a>\n-----------------------------------------\n\n";

			$lines = explode("\n", $file);
			$line_index = 1;
			echo '<table class="code">';
			foreach ($lines as $line) {
				echo "\n<tr>\n\t<td id=\"L$line_index\"><a href=\"#L$line_index\">$line_index</a></td>\n\t<td><pre>$line</pre></td>\n</tr>";
				$line_index++;
			}
			echo "</table><script src=\"script.js\"></script>";
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
			$replaced = str_replace(".gml", ".html", $filename);
			$file	= "too big to show inline, sorry\n\n<a href='/$replaced'>view full file</a>";
			$mangled[$filename]	= $file;

			return $file;
		}

		$file	= str_replace("\r\n", "\n", $file);
		$file	= preg_replace('/^\s+$/m', '', $file);
		$file	= preg_replace('/\n\s*{$/m', ' {', $file);

		//$file	= preg_replace_callback('/(scr_84_get_lang_string\(")([a-zA-Z0-9_-]+)("[@0-9A-F]+\))/mi', "textvar_to_text", $file);
		$file	= preg_replace_callback('/(scr_84_get_lang_string\(")([a-zA-Z0-9_-]+)(")\)/mi', "textvar_to_text", $file);
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
			//$file	= withhandler($file);
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
		$filename	= "gml_GlobalScript_". $matches[2] .".gml";
		$sc			= ($matches[2] == "scr_debug") ? " debug" : "";

		$replaced = str_replace(".gml", ".html", $filename);
		if ($secondLevelR) {
			return "$matches[1]<span class='funcC'><a class='func$sc' href='/$replaced'>$matches[2]</a></span>(";

		} else {
			return "$matches[1]<span class='funcC'><a class='func$sc' href='/$replaced'>$matches[2]</a><div class='funcCode'><strong><a href='/$replaced'>$matches[2]</a></strong><br><br>". str_replace("\n", "<br>", mangleFile($filename, true, 3000)) ."</div></span>(";
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

		$replaced = str_replace(".gml", ".html", $objF);
		$out	= "<div class='alarmT'><strong><a href='/$replaced'>". str_replace("gml_Object_", "", $objF) ."</a></strong>\n\n". $out ."</div>";

		$override	= false;
		if ($objF == $fullFile && $hackCount > 1) {
			// special hack for this horrible file full of alarms
			$override	= true;
		}


		if (!$secondLevelR) $hackCount++;

		if ($secondLevelR || $override) {
			return $matches[1] . "" . $matches[2] ."<a class='alarm' href='/$replaced' title='$objF'>". $matches[3] ."</a>". $matches[5] ."";

		} else {
			return $matches[1] . "<span class='alarmC'><span class='alarmU'>" . $matches[2] ."<a href='/$replaced' title='$objF' class='alarm'>". $matches[3] ."</a>". $matches[5] ."</span><span class='alarmA'></span>". $out ."</span><span class='c'></span>";
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

		$newtext		= preg_replace_callback('/^( *)(with \()([^\)]+)(\)\s+{)(.*?)(^\1})/mis', 'withhandler', $text);

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
			$text	= preg_replace('#\^([1-9])(.)#i', '\2<span class="cc cc-delay">Delay \1<span>\1</span></span>', $text);
			$text	= preg_replace('#&#i', '<br>', $text);
			$text	= preg_replace('#%#i', '<span class="cc cc-close">Close Message</span>', $text);
			$text	= preg_replace('#\\\\E(.)#', '<span class="cc-face">Face \1</span>', $text);
			#$text	= preg_replace('#\\\\c(.)#', '(color: \1)', $text);
			$text	= preg_replace('#\\\\c(.)(.*?)(?=\\\\c|$)#', '<span class="cc-color cc-\1">\2</span>', $text);
			$text	= preg_replace('#\\\\T(.)#', '<span class="cc-face">Sound \1</span>', $text);
			$text	= preg_replace('#\\\\F(.)#', '<span class="cc-face">Char \1</span>', $text);
			$text	= preg_replace('#\\\\C(.)#', '<span class="cc-face">Choice type \1</span>', $text);
			return $text;
		}

	}

	class D_Rooms {
		protected static $rooms = null;

		protected static function init() {
			$roomA	= explode("\n", file_get_contents("data/rooms.txt"));
			$rooms	= array('id' => array(), 'name' => array());
			foreach ($roomA as $room) {
				if (!trim($room)) continue;
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
				if (!trim($enemy)) continue;
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
				$flags[$flagZ[0]]	= trim($flagZ[1]);
			}
			self::$flags	= $flags;

		}

		public static function getId($id) {
			if (self::$flags === null) self::init();
			return v(self::$flags[$id]);
		}
	}


/* 	function getSums() {
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
 */


	function v(&$var, $d = null) {
		return isset($var) ? $var : $d;
	}


?>
</body>
</html>
